package com.gamevh.response;

import lombok.Data;

@Data
public class CouponOwnerResponse {
    private String userName;
    private String location;
    private Double totalMoneySpent;
    private String voucherName;
    private String code;
    private Boolean status;
    private String image;
    private Integer couponId;
    private Integer id;
    private Integer accountId;
}
