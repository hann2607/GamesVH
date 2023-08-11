package com.gamevh.restcontroller;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Optional;

import org.eclipse.jetty.http.HttpStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.gamevh.dto.AccountDTO;
import com.gamevh.entities.Account;
import com.gamevh.handle.CustomException;
import com.gamevh.mapper.AccountMapper;
import com.gamevh.service.AccountService;
import com.gamevh.service.AuthorityService;
import com.gamevh.service.EncryptionService;
import com.gamevh.service.GoogleDriveService;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/account")
public class AccountRC {
	@Autowired
	AccountService accountService;

	@Autowired
	AuthorityService authorityService;

	@Autowired
	AccountMapper accountMapper;
	
	@Autowired
	EncryptionService encryptionService;
	
	@Autowired
	private GoogleDriveService driveService;

	@GetMapping("{username}")
	public ResponseEntity<AccountDTO> getAccountLogin(@PathVariable("username") Optional<String> username) {
		Optional<String> optionalUsername = username;

		if (optionalUsername.isPresent() && !optionalUsername.get().trim().equals("")) {
			Account account = accountService.findByUsername(optionalUsername.get());
			if (account != null) {
				AccountDTO accountDTO = accountMapper.modelToDto(account);
				if (accountDTO != null) {
					if (authorityService.findByAccountAndRole(accountDTO.getId(), "CUST") != null) {
						accountDTO.setRole("CUST");
					}
				}
				return ResponseEntity.ok(accountDTO);
			}
		}

		return null;
	}
	
	@GetMapping("email/{email}")
	public ResponseEntity<AccountDTO> getAccountByEmail(@PathVariable("email") Optional<String> email) {
		Optional<String> optionalEmail = email;

		if (optionalEmail.isPresent() && !optionalEmail.get().trim().equals("")) {
			Account account = accountService.findByEmail(optionalEmail.get());
			if (account != null) {
				AccountDTO accountDTO = accountMapper.modelToDto(account);
				if (accountDTO != null) {
					if (authorityService.findByAccountAndRole(accountDTO.getId(), "CUST") != null) {
						accountDTO.setRole("CUST");
					}
				}
				return ResponseEntity.ok(accountDTO);
			}
		}

		return null;
	}

	@PostMapping("create")
	public ResponseEntity<Account> createAccount(@RequestBody Account account) {
		if(accountService.findByUsername(account.getUsername()) == null && accountService.findByEmail(account.getEmail()) == null) {
			account.setPassword(encryptionService.encrypt(account.getPassword()));
			accountService.add(account);
		}
		return ResponseEntity.ok(account);
	}
	
	@PutMapping("changePassword")
	public ResponseEntity<Account> changePassword(@RequestBody Account account) {
		if(accountService.findByUsername(account.getUsername()) != null) {
			account.setPassword(encryptionService.encrypt(account.getPassword()));
			accountService.add(account);
		}
		return ResponseEntity.ok(account);
	}
	
	@PutMapping("update")
	public ResponseEntity<Account> updateAccount(@RequestBody Account account) {
		if(account != null) {
			if (accountService.findById(account.getId()) != null) {
				accountService.add(account);
			} 
		}
		return ResponseEntity.ok(account);
	}

	@PostMapping("upload")
	public ResponseEntity<Object> uploadImage(@RequestParam("image") MultipartFile image)
	        throws GeneralSecurityException {
	    try {
	        if (!image.isEmpty()) {
	        	
	            String fileName = image.getOriginalFilename();
	            String mimeType = image.getContentType();
	            String folderId = "1mMOXDZOQvQVs2MvJJF77UUpACbkfp5sv"; // ID của thư mục trên Google Drive để lưu file
	            // URL example:
	            // https://drive.google.com/drive/folders/10VLW7dddQHqi4-f4ddSTqxjN9YmLFZWi
	            String fileId = driveService.uploadFile(image, fileName, mimeType, folderId);
//	            System.out.println(fileId);
	            // Xử lý thành công
	            String responseData = "{\"fileId\": \"" + fileId + "\"}";
				return ResponseEntity.ok(responseData);
	        }
	    } catch (IOException e) {
	    	e.printStackTrace();
	        // Xử lý lỗi
	    	return ResponseEntity.status(HttpStatus.BAD_REQUEST_400).contentType(MediaType.APPLICATION_JSON).body("Lỗi upload hình: " + e.getMessage());
	    }

	    return ResponseEntity.status(HttpStatus.BAD_REQUEST_400).contentType(MediaType.APPLICATION_JSON).body("Lỗi upload hình");
	    
	}

	@GetMapping
	public ResponseEntity<Page<Account>> getAllAccounts(
			@RequestParam("page") Optional<Integer> page,
			@RequestParam("size") Optional<Integer> size,
			@RequestParam(value = "username", defaultValue = "", required = false) String username,
			@RequestParam(value = "name", defaultValue = "", required = false) String name,
			@RequestParam(value = "email", defaultValue = "", required = false) String email,
			@RequestParam(value = "roleId", defaultValue = "", required = false) String roleId
	) {
		Page<Account> accounts = accountService.findAll(page, size, username, name, email, roleId);
		return ResponseEntity.ok(accounts);
	}

	@PostMapping
	public Account registerNewAccount(@RequestPart("account")String  accountDTOString,
									  @RequestPart("image") MultipartFile image) throws CustomException {
		return accountService.registerAccount(accountDTOString, image);
	}

	@PutMapping("/status/{username}")
	public Account toggleAccountStatus(@PathVariable("username") String username){
		return accountService.toggleAccountStatus(username);
	}
	@PutMapping("/{username}")
	public Account updateAccount(@PathVariable("username") String username,
								 @RequestPart("account")String  accountDTOString,
								 @RequestPart(value = "image", required = false) MultipartFile image) throws CustomException {
		return accountService.updateAccount(username, accountDTOString, image);
	}
	@GetMapping(value = "/image/{username}", produces = MediaType.IMAGE_PNG_VALUE)
	public byte[] getAccountImage(@PathVariable("username")String userName){
		return accountService.getAccountImage(userName);
	}
}
