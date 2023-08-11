package com.gamevh.request;

import lombok.Data;

@Data
public class CouponOwnerSearchRequest {
    private String couponName;
    private String location;
    private Double totalMoneySpent;
    private String customerName;
}
