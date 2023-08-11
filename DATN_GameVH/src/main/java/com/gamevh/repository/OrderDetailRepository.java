package com.gamevh.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.gamevh.entities.OrderDetail;

public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long>{
	
	@Query("SELECT ordt FROM OrderDetail ordt GROUP BY ordt ORDER BY COUNT(ordt) DESC")
	List<OrderDetail> findTopSellingProducts();
	
	List<OrderDetail> findByOrderDataId(Long orderId);
}
