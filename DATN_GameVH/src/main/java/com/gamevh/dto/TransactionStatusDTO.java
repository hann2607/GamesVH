package com.gamevh.dto;

import java.io.Serializable;

import lombok.Data;

@Data
public class TransactionStatusDTO implements Serializable{
	private String status;
	private String message;
	private String data;
}
