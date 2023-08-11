package com.gamevh.restcontroller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gamevh.dto.FeedbackWebsiteDTO;
import com.gamevh.entities.FeedbackWebsite;
import com.gamevh.mapper.FeedbackMapper;
import com.gamevh.mapper.FeedbackWebsiteMapper;
import com.gamevh.service.FeedbackWebsiteService;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/feedbackwebsite")
public class FeedbackWebsiteRC {
	@Autowired
	FeedbackWebsiteService feedbackWebsiteService;
	
	@Autowired
	FeedbackWebsiteMapper feedbackWebsiteMapper;
	
	@PostMapping("create")
	public ResponseEntity<FeedbackWebsite> feedbackSite(@RequestBody FeedbackWebsite feedbackWebsite) {
		if(feedbackWebsite != null) {
			feedbackWebsite = feedbackWebsiteService.add(feedbackWebsite);
			feedbackWebsite.setAccount(null);
			return ResponseEntity.ok(feedbackWebsite);
		}
		return null;
	}
	
	@GetMapping("getAll")
	public ResponseEntity<List<FeedbackWebsiteDTO>> getAllFeedbackSite() {
		List<FeedbackWebsite> feedbackWebsites = feedbackWebsiteService.getAll();
		List<FeedbackWebsiteDTO> feedbackWebsiteDTOs = new ArrayList<>();
		if(!feedbackWebsites.isEmpty()) {
			for (FeedbackWebsite feedbackWebsite : feedbackWebsites) {
				feedbackWebsiteDTOs.add(feedbackWebsiteMapper.modelToDto(feedbackWebsite));
			}
			return ResponseEntity.ok(feedbackWebsiteDTOs);
		}
		return null;
	}
}
