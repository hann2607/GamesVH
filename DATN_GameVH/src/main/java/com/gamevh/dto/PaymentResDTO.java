package com.gamevh.dto;

import java.io.Serializable;

import lombok.Data;

@SuppressWarnings("serial")
@Data
public class PaymentResDTO implements Serializable{
	
	private String status;
	private String message;
	private String URL;
}
