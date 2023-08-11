package com.gamevh.service.impl;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import com.gamevh.dto.FullOrderDTO;
import com.gamevh.entities.Location;
import com.gamevh.handle.CustomException;
import com.gamevh.mapper.impl.OrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.gamevh.entities.OrderData;
import com.gamevh.repository.OrderDataRepository;
import com.gamevh.service.OrderService;

import jakarta.transaction.Transactional;


@Service
@Transactional
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderDataRepository orderDataRepository;
	@Autowired
	OrderMapper orderMapper;

	@Override
	public List<OrderData> findAll() {
		return orderDataRepository.findAll();
	}

	@Override
	public Page<OrderData> findAll(Optional<Integer> pageNo, Optional<Integer> pageSize, String username, String phone, Optional<LocalDate> createdAt) {
		Pageable pageable = PageRequest.of(pageNo.orElse(0), pageSize.orElse(6));
		Page<OrderData> orderDataPage = orderDataRepository.findAllByFilterPagination(pageable, username, phone, createdAt);
		return orderDataPage;
	}

	@Override
	public OrderData findById(Long id) {
		return orderDataRepository.findById(id).get();
	}

	@Override
	public OrderData add(OrderData orderData) {
		return orderDataRepository.save(orderData);
	}

	@Override
	public OrderData findByOrderId(String orderId) {
		return orderDataRepository.findByOrderId(orderId).orElse(null);
	}

	@Override
	public FullOrderDTO findOne(String orderId) throws CustomException {
		OrderData orderData = orderDataRepository.findByOrderId(orderId)
				.orElseThrow(() ->
						new CustomException("Không tìm thấy order với mã là " + orderId, HttpStatus.NOT_FOUND));
		return orderMapper.orderToFullOrder(orderData);
	}
	@Override
	public void updateStatus(String orderId, String newStatus) throws CustomException {
		OrderData orderData = orderDataRepository.findByOrderId(orderId)
				.orElseThrow(() ->
						new CustomException("Không tìm thấy order với mã là " + orderId, HttpStatus.NOT_FOUND));
		orderData.setOrderStatus(newStatus);
		orderDataRepository.save(orderData);
	}
}
