package com.gamevh.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gamevh.repository.OrderDataRepository;
import com.gamevh.service.RevenueService;

@Service
public class RevenueServiceImpl implements RevenueService{
	@Autowired
	OrderDataRepository orderDataRepository;

	@Override
	public List<Object[]> getTotalOrderStatusByYear(Integer year) {
		return orderDataRepository.getTotalOrderStatusByYear(year);
	}

	@Override
	public List<Object[]> getPaymentTypeStatsForMonth(Integer month) {
		return orderDataRepository.getPaymentTypeStatsForMonth(month);
	}

	@Override
	public List<Object[]> getOrderStatsForMonthAndByCategory(Integer month) {
		return orderDataRepository.getOrderStatsForMonthAndByCategory(month);
	}

	@Override
	public List<Object[]> getTotalPriceByYear(Integer year) {
		return orderDataRepository.getTotalPriceByYear(year);
	}

}
