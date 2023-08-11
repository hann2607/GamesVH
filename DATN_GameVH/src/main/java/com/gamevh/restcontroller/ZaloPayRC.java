package com.gamevh.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gamevh.dto.ZaloPayDTO;
import com.gamevh.service.ZaloPayService;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/zalopay")
public class ZaloPayRC {

	@Autowired
	private ZaloPayService zaloPayService;

	@PostMapping("/create")
	public ResponseEntity<String> createPayment(@RequestBody ZaloPayDTO zaloPayDTO) {
		String response = zaloPayService.createPayment(zaloPayDTO);

		// Xử lý phản hồi từ ZaloPay
		if (response != null && response.contains("return_code=1")) {
			// Giao dịch thành công
			return ResponseEntity.ok("Payment successful");
		} else {
			// Giao dịch thất bại
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Payment failed");
		}
	}

}
