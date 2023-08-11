package com.gamevh.service;

import java.util.List;




import com.gamevh.entities.Favorite;

public interface FavoriteService {
	
	List<Favorite> findAll();

	Favorite findById(Integer id);

	Favorite save(Favorite favorite);

	List<Favorite> findAllByAccountId(Integer accountId);
	
	List<Favorite> findByProductId(Integer productid);

	List<Favorite> findByProductIdAndAccountId( Integer  accountid, Integer productid);
	

	
}
