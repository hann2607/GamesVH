package com.gamevh.restcontroller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gamevh.dto.OrderDetailDTO;
import com.gamevh.entities.OrderDetail;
import com.gamevh.mapper.OrderDetailMapper;
import com.gamevh.service.OrderDetailService;
import com.gamevh.service.OrderService;
import com.gamevh.service.ProductService;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/orderdetail")
public class OrderDetailRC {
	@Autowired
	OrderDetailService orderDetailService;

	@Autowired
	OrderService orderService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	OrderDetailMapper orderDetailMapper;

	@PostMapping("/create")
	public ResponseEntity<OrderDetail> createOrderAndUpdateCouponOwner(@RequestBody OrderDetail orderDetailData) {
		if (orderDetailData != null) {
			orderDetailService.add(orderDetailData);
			return ResponseEntity.ok(orderDetailData);
		}

		return null;
	}
	
	@GetMapping("/orderdata/{orderDataId}")
	public ResponseEntity<List<OrderDetailDTO>> getOrderDetailByOrderId(@PathVariable("orderDataId") Long orderDataId) {
		if (orderDataId != null) {
			List<OrderDetail> orderDetails = orderDetailService.findByOrderId(orderDataId);
			
			List<OrderDetailDTO> orderDetailDTOs = new ArrayList<>();
			
			for (OrderDetail orderDetail : orderDetails) {
				orderDetailDTOs.add(orderDetailMapper.modelToDto(orderDetail));
			}
			return ResponseEntity.ok(orderDetailDTOs);
		}

		return null;
	}
}
