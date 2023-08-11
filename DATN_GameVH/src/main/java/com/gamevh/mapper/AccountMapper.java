package com.gamevh.mapper;

import org.mapstruct.Mapper;

import com.gamevh.dto.AccountDTO;
import com.gamevh.entities.Account;

@Mapper
public interface AccountMapper {
	
	AccountDTO modelToDto(Account account);
	
	Account dtoToModel (AccountDTO accountDTO);
	
}
