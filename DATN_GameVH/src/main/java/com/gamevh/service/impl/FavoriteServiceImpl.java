package com.gamevh.service.impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gamevh.entities.Favorite;
import com.gamevh.repository.FavoriteRepository;
import com.gamevh.service.FavoriteService;

@Service
public class FavoriteServiceImpl implements FavoriteService {
	@Autowired
	private FavoriteRepository favoriteRepository;
	
	@Override
	public List<Favorite> findAll() {
		return favoriteRepository.findAll();
	}

	@Override
	public Favorite findById(Integer id) {
		return favoriteRepository.findById(id).get();
	}
	
	 public Favorite save(Favorite favorite) {
	        return favoriteRepository.save(favorite);
	    }

	@Override
	public List<Favorite> findAllByAccountId(Integer accountId) {
		// TODO Auto-generated method stub
		return favoriteRepository.findByAccountId(accountId);
	}

	@Override
	public List<Favorite> findByProductIdAndAccountId(Integer accountid, Integer productid) {
		// TODO Auto-generated method stub
		return favoriteRepository.findByProductIdAndAccountId(accountid, productid);
	}

	@Override
	public List<Favorite> findByProductId(Integer productid) {
		// TODO Auto-generated method stub
		return favoriteRepository.findByProductId(productid);
	}

	

	

	
	

	
}
