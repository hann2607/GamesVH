package com.gamevh.request;

import lombok.Data;

@Data
public class CouponSearchRequest {
    private Long couponId;
    private String couponName;
}
