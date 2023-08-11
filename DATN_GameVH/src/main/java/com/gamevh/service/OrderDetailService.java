package com.gamevh.service;

import java.util.List;

import com.gamevh.entities.OrderDetail;

public interface OrderDetailService {
	OrderDetail add(OrderDetail orderDetailData);
	
	List<OrderDetail> findByOrderId(Long orderId);
}
