package com.gamevh.service;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;

@Service
public class FileManagerService {
	@Autowired
	ServletContext app;

	private Path getPath(String folder, String filename) {
	    try {
	        File staticDir = new File("src/main/resources/static");
	        File folderDir = new File(staticDir, "assets/images/" + folder);
	        if(!folderDir.exists()) {
	            folderDir.mkdirs();
	        }
	        return Paths.get(folderDir.getAbsolutePath(), filename);
	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    }
	}

	public byte[] read(String folder, String file) {
		Path path = this.getPath(folder, file);
		try {
			return Files.readAllBytes(path);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public List<String> save(String folder, MultipartFile[] files) {
		List<String> filenames = new ArrayList<String>();
		for (MultipartFile file : files) {
			String name = System.currentTimeMillis() + file.getOriginalFilename();
			String filename = Integer.toHexString(name.hashCode()) + name.substring(name.lastIndexOf("."));
			Path path = this.getPath(folder, filename);
			try {
				file.transferTo(path);
				filenames.add(filename);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return filenames;
	}

	public void delete(String folder, String file) {
		Path path = this.getPath(folder, file);
		path.toFile().delete();
	}

	public List<String> list(String folder) {
		List<String> filenames = new ArrayList<String>();
		File dir = Paths.get(app.getRealPath("/assets/images/"), folder).toFile();
		if (dir.exists()) {
			File[] files = dir.listFiles();
			for (File file : files) {
				filenames.add(file.getName());
			}
		}
		return filenames;
	}

}
