package com.gamevh.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import com.gamevh.entities.Favorite;

public interface FavoriteRepository extends JpaRepository<Favorite, Integer>{
	
		List<Favorite> findByAccountId(Integer AccountId);
		
		List<Favorite> findByProductId(Integer productid);
		
		 @Query("SELECT f FROM Favorite f WHERE f.account.id = ?1 and f.product.id = ?2")
		 	List<Favorite> findByProductIdAndAccountId( Integer  accountid, Integer productid);
}
