package com.gamevh.dto;

import java.util.List;

import com.gamevh.entities.OrderData;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderRequestDTO {
	private OrderData orderData;
    private List<CartDTO> listCartDTO;
}
