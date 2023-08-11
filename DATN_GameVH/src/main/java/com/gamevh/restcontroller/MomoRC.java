package com.gamevh.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gamevh.dto.MomoDTO;
import com.gamevh.service.MomoService;

@CrossOrigin("*")
@RestController
@RequestMapping("api/momo")
public class MomoRC {
	@Autowired
	MomoService momoService;
	
	@PostMapping("create")
	public ResponseEntity<MomoDTO> createMomoOrder(@RequestBody MomoDTO momo) {
		return ResponseEntity.ok(momoService.createOrder(momo));
	}
	
	@PostMapping("query")
	public ResponseEntity<MomoDTO> MomoQueryTrancsaction(@RequestBody MomoDTO momoInput) {
		return ResponseEntity.ok(momoService.queryTransaction(momoInput));
	}
}
