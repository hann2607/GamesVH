package com.gamevh.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gamevh.entities.FeedbackWebsite;
import com.gamevh.repository.FeedbackWebsiteRepository;
import com.gamevh.service.FeedbackWebsiteService;

@Service
public class FeedbackWebsiteServiceImpl implements FeedbackWebsiteService{

	@Autowired
	FeedbackWebsiteRepository feedbackWebsiteRepository;
	
	@Override
	public FeedbackWebsite add(FeedbackWebsite feedbackWebsite) {
		return feedbackWebsiteRepository.save(feedbackWebsite);
	}

	@Override
	public List<FeedbackWebsite> getAll() {
		return feedbackWebsiteRepository.findAll();
	}

}
