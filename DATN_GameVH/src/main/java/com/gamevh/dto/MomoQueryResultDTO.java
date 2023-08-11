package com.gamevh.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MomoQueryResultDTO {
	private String partnerCode;
    private String orderId;
    private String requestId;
    private String extraData;
    private int amount;
    private long transId;
    private String payType;
    private int resultCode;
    private List<Object> refundTrans;
    private String message;
    private long responseTime;
    private long lastUpdated;
}
