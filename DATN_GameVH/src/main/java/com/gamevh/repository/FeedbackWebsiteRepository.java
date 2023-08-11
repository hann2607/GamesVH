package com.gamevh.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.gamevh.entities.FeedbackWebsite;

public interface FeedbackWebsiteRepository extends JpaRepository<FeedbackWebsite, String> {
	
}
