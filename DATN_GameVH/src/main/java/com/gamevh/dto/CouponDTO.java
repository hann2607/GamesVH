package com.gamevh.dto;

import java.time.LocalDateTime;

import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CouponDTO {
	@Id
	private Integer id;

	private String couponName;

	private String code;

	private Integer amount;

	private Double value;

	private Double minSpend;

	private LocalDateTime mfgDate;

	private LocalDateTime expDate;
	
	private Boolean status;
	
	private Boolean isUsed;
	
	private String image;
	
	private String description;
}
