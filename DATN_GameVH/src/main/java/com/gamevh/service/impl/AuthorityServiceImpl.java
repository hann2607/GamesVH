package com.gamevh.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gamevh.entities.Authority;
import com.gamevh.repository.AuthorityRepository;
import com.gamevh.service.AuthorityService;

@Service
public class AuthorityServiceImpl implements AuthorityService{
	@Autowired
	AuthorityRepository authorityRepository;

	@Override
	public Authority findByAccountAndRole(Integer accountId, String roleId) {
		return authorityRepository.findByAccountAndRole(accountId, roleId);
	}

	@Override
	public Authority add(Authority authority) {
		return authorityRepository.save(authority);
	}
}
