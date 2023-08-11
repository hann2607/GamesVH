package com.gamevh.service;

import java.util.List;

import org.springframework.http.ResponseEntity;

import com.gamevh.entities.Product;


public interface ProductService {
	

	List<Product> findAll();

	Product findById(Integer id);
	
	Product createOrUpdateProduct(Product product);
	
	void deleteProduct(Product product);
	
	ResponseEntity<Object> deleteFeedbackById(Integer Id);
	List<Object[]> getReportProduct();

	List<Product> findTop5();
	
	
}
