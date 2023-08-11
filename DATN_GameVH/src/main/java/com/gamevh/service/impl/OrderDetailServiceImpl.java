package com.gamevh.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gamevh.entities.OrderDetail;
import com.gamevh.repository.OrderDetailRepository;
import com.gamevh.service.OrderDetailService;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class OrderDetailServiceImpl implements OrderDetailService{

	@Autowired
	OrderDetailRepository orderDetailRepository;
	
	@Override
	public OrderDetail add(OrderDetail orderDetailData) {
		return orderDetailRepository.save(orderDetailData);
	}

	@Override
	public List<OrderDetail> findByOrderId(Long orderId) {
		return orderDetailRepository.findByOrderDataId(orderId);
	}
	
}
