package com.gamevh.mapper;

import org.mapstruct.Mapper;

import com.gamevh.dto.AccountDTO;
import com.gamevh.dto.OrderDetailDTO;
import com.gamevh.entities.Account;
import com.gamevh.entities.OrderDetail;

@Mapper
public interface OrderDetailMapper {
	
	OrderDetailDTO modelToDto(OrderDetail orderDetail);
	
	OrderDetail dtoToModel (OrderDetailDTO orderDetailDTO);
	
}
