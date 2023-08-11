package com.gamevh.service;

import com.gamevh.entities.Authority;

public interface AuthorityService {
	Authority findByAccountAndRole(Integer accountId, String roleId);
	
	Authority add(Authority authority);
}
