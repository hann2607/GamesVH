package com.gamevh.service;

public interface EncryptionService {
	
	String encrypt(String data);

	Boolean compare(String data, String encryptedData);
}
