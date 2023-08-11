package com.gamevh.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gamevh.service.RevenueService;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/revenue")
public class RevenueRC {
	@Autowired
	RevenueService revenueService;
	
	@GetMapping("year/{year}")
	public ResponseEntity<List<Object[]>> getRevenueByYear(@PathVariable("year") Integer year) {
		if(year > 0) {
			return ResponseEntity.ok(revenueService.getTotalOrderStatusByYear(year));
		}

		return null;
	}
	
	@GetMapping("year/totalPrice/{year}")
	public ResponseEntity<List<Object[]>> getRevenueForTotalPriceByYear(@PathVariable("year") Integer year) {
		if(year > 0) {
			return ResponseEntity.ok(revenueService.getTotalPriceByYear(year));
		}

		return null;
	}
	
	@GetMapping("month/paymentType/{month}")
	public ResponseEntity<List<Object[]>> getRevenueByMonthAndPaymentType(@PathVariable("month") Integer month) {
		if(month > 0) {
			return ResponseEntity.ok(revenueService.getPaymentTypeStatsForMonth(month));
		}

		return null;
	}
	
	@GetMapping("month/category/{month}")
	public ResponseEntity<List<Object[]>> getRevenueByMonthAndCategory(@PathVariable("month") Integer month) {
		if(month > 0) {
			return ResponseEntity.ok(revenueService.getOrderStatsForMonthAndByCategory(month));
		}

		return null;
	}
}
