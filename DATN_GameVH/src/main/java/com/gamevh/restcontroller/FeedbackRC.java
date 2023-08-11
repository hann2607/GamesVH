package com.gamevh.restcontroller;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gamevh.dto.FeedbackDTO;
import com.gamevh.entities.Account;
import com.gamevh.entities.Feedback;
import com.gamevh.entities.Product;
import com.gamevh.mapper.FeedbackMapper;
import com.gamevh.repository.FeedbackRepository;
import com.gamevh.service.AccountService;
import com.gamevh.service.FeedbackService;
import com.gamevh.service.ProductService;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/feedback")
public class FeedbackRC {
	@Autowired
	FeedbackService feedBackService;
	
	@Autowired
	FeedbackRepository feedbackRepository;
	
	@Autowired
	AccountService accountService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	FeedbackMapper feedbackMapper;

	@GetMapping("/getProduct/{productId}")
	public ResponseEntity<List<Feedback>> getAllFeedBackByProductId(@PathVariable("productId") Integer productId) {
		List<Feedback> listFeedBacks = feedBackService.findByProductId(productId);
		// Order By Z-A CreateDate
		Comparator<Feedback> dateComparator = Comparator.comparing(Feedback::getCreateDate);
		Collections.sort(listFeedBacks, dateComparator.reversed());
		return ResponseEntity.ok(listFeedBacks);
	}
	
	@GetMapping("/getProductByUsernameAndProductId/{username}/{productId}")
	public ResponseEntity<FeedbackDTO> getProductByUsernameAndProductId(@PathVariable("username") String username,@PathVariable("productId") Integer productId) {
		Feedback feedback = feedBackService.findByAccountAndProduct(username, productId);
		if(feedback != null) {
			return ResponseEntity.ok(feedbackMapper.modelToDto(feedback));
		}
		return null;
	}	
	
	@PutMapping("/addOrUpdate/{username}/{productId}")
	public ResponseEntity<FeedbackDTO> addOrUpdate(@PathVariable("username") String username,@PathVariable("productId") Integer productId, @RequestBody Feedback feedback) {
		if(feedback != null) {
			Feedback feedbackOnDB = feedBackService.findByAccountAndProduct(username, productId);
			
			if(feedbackOnDB != null) {
				feedbackOnDB.setContent(feedback.getContent());
				feedbackOnDB.setCreateDate(feedback.getCreateDate());
				feedbackOnDB.setStar(feedback.getStar());
				feedbackOnDB.setStatus(feedback.getStatus());
				return ResponseEntity.ok(feedbackMapper.modelToDto(feedBackService.addOrUpdate(feedbackOnDB)));
			} else {
				Account account = accountService.findByUsername(username);
				Product product = productService.findById(productId);
				if(account != null && product != null) {
					feedback.setAccount(account);
					feedback.setProduct(product);
					return ResponseEntity.ok(feedbackMapper.modelToDto(feedBackService.addOrUpdate(feedback)));
				}
			}
		}
		return null;
	}	
}
