package com.gamevh.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MomoDTO {
	//input + return
	private String partnerCode;
	private String partnerName;
	private String storeId;
	private String requestType;
	private String ipnUrl;
	private String redirectUrl;
	private String orderId;
	private String amount;
	private String lang;
	private String autoCapture;
	private String orderInfo;
	private String requestId;
	private String extraData;
	private String signature;
	
	//return
	private Long responseTime;
	private String message;
	private Integer resultCode;
	private String payUrl;
}
