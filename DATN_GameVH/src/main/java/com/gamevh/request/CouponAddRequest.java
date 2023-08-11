package com.gamevh.request;

import lombok.Data;

import java.time.LocalDateTime;
import java.util.Date;

@Data
public class CouponAddRequest {
    private Integer id;
    private String couponName;
    private String code;
    private Integer amount;
    private Double value;
    private Double minSpend;
    private Integer status;
    private LocalDateTime mfgDate;
    private LocalDateTime expDate;
    private String description;
    private String image;
}
