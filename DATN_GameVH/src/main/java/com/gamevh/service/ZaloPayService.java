package com.gamevh.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Base64;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gamevh.dto.ZaloPayDTO;
import com.gamevh.util.HMACUtil;

@Service
public class ZaloPayService {

	// Thêm các thuộc tính cấu hình ZaloPay
	private String appId = "553";
	private String key1 = "9phuAOYhan4urywHTh0ndEXiV3pKHr5Q";
	private String endpoint = "https://sb-openapi.zalopay.vn/v2/create";

	public String createPayment(ZaloPayDTO zaloPayDTO) {
		try {
			// Chuyển đổi dữ liệu thành chuỗi JSON
			ObjectMapper objectMapper = new ObjectMapper();
			String requestBody = objectMapper.writeValueAsString(zaloPayDTO);
			

			// Tạo chữ ký và mã hóa dữ liệu
			String data = Base64.getEncoder().encodeToString(requestBody.getBytes());
			String mac = HMACUtil.HMacBase64Encode(HMACUtil.HMACSHA256, key1, data);

			// Tạo kết nối HTTP
			URL url = new URL(endpoint);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			conn.setRequestProperty("User-Agent", "Mozilla/5.0");
			conn.setDoOutput(true);

			// Gửi yêu cầu
			String postData = String.format("data=%s&mac=%s&app_id=%s", URLEncoder.encode(data, "UTF-8"),
					URLEncoder.encode(mac, "UTF-8"), appId);
			byte[] postDataBytes = postData.getBytes("UTF-8");
			OutputStream outputStream = conn.getOutputStream();
			outputStream.write(postDataBytes);
			outputStream.flush();
			outputStream.close();

			// Đọc phản hồi từ ZaloPay
			BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			StringBuilder responseBuilder = new StringBuilder();
			String line;
			while ((line = reader.readLine()) != null) {
				responseBuilder.append(line);
			}
			reader.close();

			// Xử lý phản hồi từ ZaloPay
			String response = responseBuilder.toString();
			// ...

			// Ví dụ xử lý phản hồi: in ra phản hồi từ ZaloPay
			System.out.println("ZaloPay response: " + response);

			// Trả về phản hồi từ ZaloPay
			return response;

		} catch (Exception e) {
			// Xử lý lỗi
			e.printStackTrace();
			return null;
		}
	}

}
