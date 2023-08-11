package com.gamevh.service;

import java.util.List;
import java.util.Optional;

import com.gamevh.entities.Account;
import com.gamevh.handle.CustomException;
import org.springframework.data.domain.Page;
import org.springframework.web.multipart.MultipartFile;


public interface AccountService {

	List<Account> findAll();
	Page<Account> findAll(Optional<Integer> pageNo, Optional<Integer> pageSize,
						  String username, String name, String email, String roleId);

	Account findById(Integer AccountId);
	
	Account add(Account account);
	
	Account findByUsername(String username);
	
	Account findByEmail(String email);

	Account findById(String username);

	Account toggleAccountStatus(String username);

	Account updateAccount(String userName, String updateAccountDTO, MultipartFile image) throws CustomException;
	byte[] getAccountImage(String userName);
	Account registerAccount(String registerAccountDTOString, MultipartFile image) throws CustomException;
	void deleteAccount(String userName);
}
