package com.gamevh.service;

import java.util.List;

import com.gamevh.entities.FeedbackWebsite;

public interface FeedbackWebsiteService {
	FeedbackWebsite add(FeedbackWebsite feedbackWebsite);
	
	List<FeedbackWebsite> getAll();
}
