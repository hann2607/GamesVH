package com.gamevh.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.gamevh.entities.Authority;

public interface AuthorityRepository extends JpaRepository<Authority, Integer>{
	@Query("SELECT a FROM Authority a WHERE a.account.id = :accountId AND a.role.id = :roleId")
	Authority findByAccountAndRole(Integer accountId, String roleId);
}
