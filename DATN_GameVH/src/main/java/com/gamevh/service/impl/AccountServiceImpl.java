package com.gamevh.service.impl;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import com.gamevh.dto.RegisterAccountDTO;
import com.gamevh.dto.UpdateAccountDTO;
import com.gamevh.entities.Authority;
import com.gamevh.handle.CustomException;
import com.gamevh.mapper.AccountChangeMapper;
import com.gamevh.repository.AuthorityRepository;
import com.gamevh.service.FileManagerService;
import com.gamevh.service.GoogleDriveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.gamevh.entities.Account;
import com.gamevh.repository.AccountRepository;
import com.gamevh.service.AccountService;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;


@Service
public class AccountServiceImpl implements AccountService {

	@Autowired
	AccountRepository accountRepository;
	@Autowired
	AuthorityRepository authorityRepository;
	@Autowired
	AccountChangeMapper accountMapper;
	@Autowired
	FileManagerService fileManagerService;

	@Override
	public List<Account> findAll() {
		return accountRepository.findAll();
	}

	@Override
	public Page<Account> findAll(Optional<Integer> pageNo, Optional<Integer> pageSize, String username, String name, String email, String roleId) {
		Pageable pageable = PageRequest.of(pageNo.orElse(0), pageSize.orElse(6));

		// Áp dụng filter họ tên và roleId của account
		Page<Account> accounts = accountRepository.filterAccountByUsernameAndNameAndRoleId(pageable, username, name, email, roleId);
		return accounts;
	}

	@Override
	public Account findById(Integer AccountId) {
		return accountRepository.findById(AccountId);
	}

	@Override
	public Account findByUsername(String username) {
		return accountRepository.findByUsername(username);
	}

	@Override
	public Account add(Account account) {
		return accountRepository.save(account);
	}

	@Override
	public Account findByEmail(String email) {
		return accountRepository.findByEmail(email);
	}

	@Override
	public Account findById(String username) {
		return accountRepository.findById(username).get();
	}

	@Override
	public Account toggleAccountStatus(String username){
		Account account = accountRepository.findByUsername(username);
		account.setStatus(!account.getStatus());
		return accountRepository.save(account);
	}

	@Override
	public Account updateAccount(String userName, String updateAccountJSON, MultipartFile image) throws CustomException {
		UpdateAccountDTO updateAccountDTO = accountMapper.parseUpdateAccountDTOFromJSON(updateAccountJSON);
		Account account = accountRepository.findByUsername(userName);
		account.setUsername(updateAccountDTO.getUsername());
		// Encrypt mật khẩu mới
		if (updateAccountDTO.getPassword() != null){
			account.setPassword(new BCryptPasswordEncoder().encode(updateAccountDTO.getPassword()));
		}
		account.setEmail(updateAccountDTO.getEmail());
		account.setFullname(updateAccountDTO.getFullName());
		account.setStatus(updateAccountDTO.getStatus());
		if (image != null){
			updateAccountImage(account, image);
		}
		return accountRepository.save(account);
	}


	public void updateAccountImage(Account account,MultipartFile image) throws CustomException {
		MultipartFile[] files = new MultipartFile[1];
		files[0] = image;
//		List<String> imageUrls = fileManagerService.save("accountImage",files);
//		System.out.println(imageUrls);
//		// Xóa ảnh cũ khỏi file system
//		fileManagerService.delete("accountImage", account.getPhoto());
		GoogleDriveService driveService = new GoogleDriveService();
		String photo = "";
		String folderId = "1xbZ557bXhtiEG-sPP4TRXf007THuPsns";
		try{
			photo = driveService.uploadFile(files[0], UUID.randomUUID().toString(),
					files[0].getContentType(), folderId);
			System.out.println(photo);
		}
		catch(GeneralSecurityException | IOException e){
			throw new CustomException("Có lỗi xảy ra", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		account.setPhoto(photo);
	}

	@Override
	public byte[] getAccountImage(String userName) {
		Account account = accountRepository.findByUsername(userName);
		return fileManagerService.read("accountImage", account.getPhoto());
	}

	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public Account registerAccount(String registerAccountDTOString, MultipartFile image) throws CustomException {
		RegisterAccountDTO registerAccountDTO = accountMapper.parseRegisterAccountDTOFromJSON(registerAccountDTOString);
		Account newAccount = accountMapper.mapRegisterAccountToAccount(registerAccountDTO);
		MultipartFile[] files = new MultipartFile[1];
		files[0] = image;
//		List<String> imageUrls = fileManagerService.save("accountImage",files);
		GoogleDriveService driveService = new GoogleDriveService();
		String photo = "";
		String folderId = "1xbZ557bXhtiEG-sPP4TRXf007THuPsns";
		try{
			 photo = driveService.uploadFile(files[0], UUID.randomUUID().toString(),
					files[0].getContentType(), folderId);
			 System.out.println(photo);
		}
		catch(GeneralSecurityException | IOException e){
			throw new CustomException("Có lỗi xảy ra", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		newAccount.setPhoto(photo);
		newAccount = accountRepository.save(newAccount);
		System.out.println(newAccount);
		for(Authority authority:newAccount.getAuthority()){
			authorityRepository.save(authority);
		}
		return newAccount;
	}
	@Override
	public void deleteAccount(String userName){
		Account account = accountRepository.findByUsername(userName);
		accountRepository.delete(account);
	}
}
