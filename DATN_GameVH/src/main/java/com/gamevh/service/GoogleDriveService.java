package com.gamevh.service;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.security.GeneralSecurityException;
import java.util.Collections;

import org.springframework.web.multipart.MultipartFile;

import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.InputStreamContent;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.drive.Drive;
import com.google.api.services.drive.DriveScopes;
import com.google.api.services.drive.model.File;
import com.google.auth.http.HttpCredentialsAdapter;
import com.google.auth.oauth2.GoogleCredentials;

public class GoogleDriveService {
	private static final String APPLICATION_NAME = "gamesvh";
	private static final JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();
	private static final String CREDENTIALS_FILE_PATH = "credentials.json";

	public Drive getDriveService() throws IOException, GeneralSecurityException {
		var httpTransport = GoogleNetHttpTransport.newTrustedTransport();
		var credentials = getCredentials();
		var requestInitializer = new HttpCredentialsAdapter(credentials);
		return new Drive.Builder(httpTransport, JSON_FACTORY, requestInitializer).setApplicationName(APPLICATION_NAME)
				.build();
	}

	public String uploadFile(MultipartFile multipartFile, String fileName, String mimeType, String folderId) throws IOException, GeneralSecurityException {
	    var driveService = getDriveService();

	    // Tìm kiếm tệp tin có cùng tên trong thư mục đích
	    var file = getFileByName(driveService, fileName, folderId);

	    if (file != null) {
	        // Nếu tệp tin đã tồn tại, cập nhật nội dung của nó
	        var fileContent = new InputStreamContent(mimeType, multipartFile.getInputStream());

	        var updateRequest = driveService.files().update(file.getId(), null, fileContent);
	        updateRequest.setSupportsAllDrives(true); // Đảm bảo hỗ trợ ghi đè trên tất cả các drive
	        updateRequest.setFields("id,name"); // Chỉ lấy về trường id và name của tệp tin
	        var updatedFile = updateRequest.execute();

//	        System.out.println("Updated File ID: " + updatedFile.getId());
	        return updatedFile.getId();
	    } else {
	        // Nếu tệp tin chưa tồn tại, tạo một tệp tin mới
	        var fileMetadata = new File();
	        fileMetadata.setName(fileName);
	        fileMetadata.setParents(Collections.singletonList(folderId));

	        var fileContent = new InputStreamContent(mimeType, multipartFile.getInputStream());

	        var createRequest = driveService.files().create(fileMetadata, fileContent);
	        createRequest.setSupportsAllDrives(true); // Đảm bảo hỗ trợ ghi đè trên tất cả các drive
	        createRequest.setFields("id,name"); // Chỉ lấy về trường id và name của tệp tin
	        var createdFile = createRequest.execute();

//	        System.out.println("Created File ID: " + createdFile.getId());
	        return createdFile.getId();
	    }
	}


	private File getFileByName(Drive driveService, String fileName, String folderId) {
	    try{
			var query = "name='" + fileName + "' and '" + folderId + "' in parents";
			var request = driveService.files().list().setQ(query).setSpaces("drive").setFields("files(id,name)").setSupportsAllDrives(true);
			var response = request.execute();
			var files = response.getFiles();
			if (files != null && !files.isEmpty()) {
				return files.get(0); // Trả về tệp tin đầu tiên có cùng tên
			}
			return null;
		}
		catch (Exception e){
			return null;
		}
	}



	public GoogleCredentials getCredentials() throws IOException {
		InputStream inputStream = GoogleDriveService.class.getClassLoader().getResourceAsStream(CREDENTIALS_FILE_PATH);
		if (inputStream == null) {
			throw new FileNotFoundException("File '" + CREDENTIALS_FILE_PATH + "' not found in the classpath.");
		}
		return GoogleCredentials.fromStream(inputStream).createScoped(Collections.singletonList(DriveScopes.DRIVE));
	}

}
