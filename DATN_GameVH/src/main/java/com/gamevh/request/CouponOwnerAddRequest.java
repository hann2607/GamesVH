package com.gamevh.request;

import lombok.Data;

@Data
public class CouponOwnerAddRequest {
    private Integer couponId;
    private Integer accountId;
    private Integer couponOwnerId;
}
