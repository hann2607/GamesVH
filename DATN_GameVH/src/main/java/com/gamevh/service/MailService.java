package com.gamevh.service;

import org.springframework.stereotype.Service;

import com.gamevh.dto.MailInfoDTO;

import jakarta.mail.MessagingException;


@Service
public interface MailService {
	void send(MailInfoDTO mail) throws MessagingException;

	void send(String to, String subject, String body) throws MessagingException;
	
	void queue(MailInfoDTO mail);
	void queue(String to, String subject, String body);

}
