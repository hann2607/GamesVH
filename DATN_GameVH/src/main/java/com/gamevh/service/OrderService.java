package com.gamevh.service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import com.gamevh.dto.FullOrderDTO;
import com.gamevh.entities.OrderData;
import com.gamevh.handle.CustomException;
import org.springframework.data.domain.Page;


public interface OrderService {
	
	List<OrderData> findAll();
	Page<OrderData> findAll(Optional<Integer> page, Optional<Integer> size, String username, String phone, Optional<LocalDate> createdAt);

	OrderData findById(Long id);

	OrderData findByOrderId(String orderId);
	
	OrderData add(OrderData orderData);
	FullOrderDTO findOne(String orderId) throws CustomException;
	void updateStatus(String orderId, String newStatus) throws CustomException;
}
