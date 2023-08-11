package com.gamevh.dto;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MailInfoDTO {
	String from = "SevenBee";
	String to;
	String[] cc;
	String[] bcc;
	String subject;
	String body;
	String source;
	List<File> files = new ArrayList<>();

	public MailInfoDTO(String to, String subject, String body) {
		this.to = to;
		this.subject = subject;
		this.body = body;

	}
}
