package com.gamevh.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CategoryDTO {
	private String idCategory;
    private String nameCategory;
    private int qtyProduct;

}
