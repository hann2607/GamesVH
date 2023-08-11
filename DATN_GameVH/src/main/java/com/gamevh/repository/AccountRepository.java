package com.gamevh.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.gamevh.entities.Account;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface AccountRepository extends JpaRepository<Account, String> {
	Account findById(Integer accountId);

	Account findByUsername(String username);
	
	Account findByEmail(String email);

	@Query("SELECT account FROM Account AS account JOIN account.authority AS auth WHERE " +
			"(:username = '' or :username IS NULL or LOWER(account.username) like CONCAT('%',:username,'%')) AND" +
			"(:name = '' or :name IS NULL or LOWER(account.fullname) like CONCAT('%',:name,'%')) AND " +
			"(:email = '' or :email IS NULL or LOWER(account.email) like CONCAT('%',:email,'%')) AND " +
			"(:roleId = '' or :roleId IS NULL or auth.role.id = :roleId)")
	Page<Account> filterAccountByUsernameAndNameAndRoleId(Pageable pageable, @Param("username") String username,
														  @Param("name") String name, @Param("email") String email, @Param("roleId") String roleId);
}
