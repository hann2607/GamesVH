package com.gamevh.mapper.impl;

import javax.annotation.processing.Generated;

import org.springframework.stereotype.Service;

import com.gamevh.dto.AccountDTO;
import com.gamevh.entities.Account;
import com.gamevh.mapper.AccountMapper;

@Generated(value = "org.mapstruct.ap.MappingProcessor", date = "2023-07-04T23:29:41+0700", comments = "version: 1.5.5.Final, compiler: Eclipse JDT (IDE) 1.4.300.v20221108-0856, environment: Java 18.0.2.1 (Oracle Corporation)")
@Service
public class AccountMapperImpl implements AccountMapper {

	@Override
	public AccountDTO modelToDto(Account account) {
		if (account == null) {
			return null;
		}

		AccountDTO accountDTO = new AccountDTO();

		accountDTO.setEmail(account.getEmail());
		accountDTO.setFullname(account.getFullname());
		accountDTO.setId(account.getId());
		accountDTO.setPassword(account.getPassword());
		accountDTO.setPhoto(account.getPhoto());
		accountDTO.setStatus(account.getStatus());
		accountDTO.setUsername(account.getUsername());
		accountDTO.setType(account.getType());
		accountDTO.setAccessToken(account.getAccessToken());
		accountDTO.setRole(null);

		return accountDTO;
	}

	@Override
	public Account dtoToModel(AccountDTO accountDTO) {
		if (accountDTO == null) {
			return null;
		}

		Account account = new Account();

		account.setEmail(accountDTO.getEmail());
		account.setFullname(accountDTO.getFullname());
		account.setId(accountDTO.getId());
		account.setPassword(accountDTO.getPassword());
		account.setPhoto(accountDTO.getPhoto());
		account.setStatus(accountDTO.getStatus());
		account.setUsername(accountDTO.getUsername());
		account.setType(accountDTO.getType());
		account.setAccessToken(accountDTO.getAccessToken());
		
		return account;
	}
}
