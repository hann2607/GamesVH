package com.gamevh.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.data.jpa.repository.Query;

import java.util.List;


import com.gamevh.entities.Product;

public interface ProductRepository extends JpaRepository<Product, Integer> {
	
	 @Query(value = "SELECT p.*, " +
             "(SELECT COUNT(*) FROM Product) AS totalProducts, " +
             "(SELECT COUNT(*) FROM Product WHERE status = 1) AS availableProducts " +
             "FROM Product p", nativeQuery = true)
	 	List<Object[]> reportProduct();

	@Query(value = "SELECT * FROM product order by create_date desc LIMIT 5",nativeQuery = true)
	List<Product> getTop5();
	

	
}
