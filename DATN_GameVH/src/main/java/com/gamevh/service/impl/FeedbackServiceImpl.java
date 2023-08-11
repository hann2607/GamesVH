package com.gamevh.service.impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.gamevh.entities.Feedback;
import com.gamevh.repository.FeedbackRepository;
import com.gamevh.service.FeedbackService;



@Service
public class FeedbackServiceImpl implements FeedbackService{

	@Autowired
	FeedbackRepository feedbackRepository;
	
	@Override
	public List<Feedback> findAll() {
		return feedbackRepository.findAll();
	}

	@Override
	public Feedback findById(Integer id) {
		return feedbackRepository.findById(id).get();
	}

	@Override
	public List<Feedback> findByProductId(Integer productId) {
		return feedbackRepository.findByProductId(productId);
	}

	@Override
	public List<Feedback> findByAllProductId(Integer productId) {
		return feedbackRepository.findByAllProductId(productId);
	}

	@Override
	public Feedback findByAccountAndProduct(String username, Integer productId) {
		return feedbackRepository.findByAccountUsernameAndProductId(username, productId);
	}

	@Override
	public Feedback addOrUpdate(Feedback feedback) {
		return feedbackRepository.save(feedback);
	}

	@Override
	public List<Feedback> getTop5feedback() {
		// TODO Auto-generated method stub
		return feedbackRepository.getTop5feedback();
	}

	
}
