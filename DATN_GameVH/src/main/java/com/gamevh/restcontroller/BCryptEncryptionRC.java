package com.gamevh.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gamevh.service.EncryptionService;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/bcrypt")
public class BCryptEncryptionRC {
	@Autowired
	EncryptionService encryptionService;
	
	@GetMapping("encrypt/{string}")
	public String encrypt(@PathVariable("string") String string) {
		if(string != null) {
			return encryptionService.encrypt(string);
		}
		return null; 
	}
	
	@GetMapping("compare")
	public Boolean compare(@RequestParam("string") String string, @RequestParam("encryptedString") String encryptedString) {
		if(string != null) {
			return encryptionService.compare(string, encryptedString);
		}
		return null; 
	}
}
