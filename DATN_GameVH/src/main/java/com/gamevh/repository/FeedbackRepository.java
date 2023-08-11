package com.gamevh.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.gamevh.entities.Feedback;
import com.gamevh.entities.Product;

public interface FeedbackRepository extends JpaRepository<Feedback, Integer> {
	@Query("SELECT f FROM Feedback f WHERE f.product.id = :productId AND f.status = true")
	List<Feedback> findByProductId(Integer productId);
	
	@Query("SELECT f FROM Feedback f WHERE f.product.id = :productId")
	List<Feedback> findByAllProductId(@Param("productId") Integer productId);

	Feedback findByAccountUsernameAndProductId(String username, Integer ProductId);
	
	@Query(value = "SELECT * FROM feedback order by create_date desc LIMIT 5",nativeQuery = true)
	List<Feedback> getTop5feedback();
}
