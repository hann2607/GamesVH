package com.gamevh.service;

import java.util.List;

public interface RevenueService {
	List<Object[]> getTotalOrderStatusByYear(Integer year);
	
	List<Object[]> getTotalPriceByYear(Integer year);
	
	List<Object[]> getPaymentTypeStatsForMonth(Integer month);
	
	List<Object[]> getOrderStatsForMonthAndByCategory(Integer month);
}
