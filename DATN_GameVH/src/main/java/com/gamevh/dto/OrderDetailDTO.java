package com.gamevh.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class OrderDetailDTO {
	private Integer id;
	private Integer productId;
	private String productName;
	private String productPoster;
	private String price;
	private Integer qty;
}
