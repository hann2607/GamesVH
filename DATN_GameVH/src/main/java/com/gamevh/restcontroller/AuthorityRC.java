package com.gamevh.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gamevh.entities.Authority;
import com.gamevh.service.AuthorityService;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/authority")
public class AuthorityRC {
	@Autowired
	AuthorityService authorityService;
	
	@PostMapping("create")
	public ResponseEntity<Authority> getAllAuthoritys(@RequestBody Authority authority) {
		if(authorityService.findByAccountAndRole(authority.getAccount().getId(), authority.getRole().getId()) == null) {
			authorityService.add(authority);
		}
		return ResponseEntity.ok(authority);
	}
}
