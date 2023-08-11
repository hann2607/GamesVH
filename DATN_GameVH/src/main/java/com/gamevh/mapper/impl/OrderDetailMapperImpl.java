package com.gamevh.mapper.impl;

import javax.annotation.processing.Generated;

import org.springframework.stereotype.Service;

import com.gamevh.dto.OrderDetailDTO;
import com.gamevh.entities.OrderDetail;
import com.gamevh.mapper.OrderDetailMapper;

@Generated(value = "org.mapstruct.ap.MappingProcessor", date = "2023-07-24T23:07:31+0700", comments = "version: 1.5.5.Final, compiler: Eclipse JDT (IDE) 1.4.300.v20221108-0856, environment: Java 18.0.2.1 (Oracle Corporation)")
@Service
public class OrderDetailMapperImpl implements OrderDetailMapper {

	@Override
	public OrderDetailDTO modelToDto(OrderDetail orderDetail) {
		if (orderDetail == null) {
			return null;
		}

		OrderDetailDTO orderDetailDTO = new OrderDetailDTO();

		if (orderDetail.getId() != null) {
			orderDetailDTO.setId(orderDetail.getId().intValue());
		}
		if (orderDetail.getPrice() != null) {
			orderDetailDTO.setPrice(String.valueOf(orderDetail.getPrice()));
		}
		orderDetailDTO.setQty(orderDetail.getQty());
		if (orderDetail.getProduct() != null) {
			orderDetailDTO.setProductId(orderDetail.getProduct().getId());
			orderDetailDTO.setProductName(orderDetail.getProduct().getName());
			orderDetailDTO.setProductPoster(orderDetail.getProduct().getPoster());
		}

		return orderDetailDTO;
	}

	@Override
	public OrderDetail dtoToModel(OrderDetailDTO orderDetailDTO) {
		if (orderDetailDTO == null) {
			return null;
		}

		OrderDetail orderDetail = new OrderDetail();

		if (orderDetailDTO.getId() != null) {
			orderDetail.setId(orderDetailDTO.getId().longValue());
		}
		if (orderDetailDTO.getPrice() != null) {
			orderDetail.setPrice(Double.parseDouble(orderDetailDTO.getPrice()));
		}
		orderDetail.setQty(orderDetailDTO.getQty());

		return orderDetail;
	}
}
