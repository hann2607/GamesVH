package com.gamevh.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MomoResultDTO {
	private String partnerCode;
	private String orderId;
	private String requestId;
	private Double amount;
	private Long responseTime;
	private String message;
	private Integer resultCode;
	private String payUrl;
}
