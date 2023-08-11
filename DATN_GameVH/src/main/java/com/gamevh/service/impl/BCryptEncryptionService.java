package com.gamevh.service.impl;

import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;

import com.gamevh.service.EncryptionService;

@Service
public class BCryptEncryptionService implements EncryptionService {

	@Override
	public String encrypt(String data) {
		return BCrypt.hashpw(data, BCrypt.gensalt());
	}

	@Override
	public Boolean compare(String data, String encryptedData) {
		return BCrypt.checkpw(data, encryptedData);
	}
}
