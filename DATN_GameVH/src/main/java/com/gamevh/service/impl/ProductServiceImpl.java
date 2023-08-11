package com.gamevh.service.impl;



import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.gamevh.entities.Feedback;
import com.gamevh.entities.Product;
import com.gamevh.repository.FeedbackRepository;
import com.gamevh.repository.ProductRepository;
import com.gamevh.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductRepository productRepository;
	
	@Autowired
	FeedbackRepository feedbackRepository;

	@Override
	public List<Product> findAll() {
		return productRepository.findAll();
	}

	@Override
	public Product findById(Integer id) {
		return productRepository.findById(id).get();
	}

	@Override
	public Product createOrUpdateProduct(Product product) {
		return productRepository.save(product);
	}

	@Override
	public void deleteProduct(Product product) {
		 productRepository.delete(product);
	}

	@Override
	public List<Object[]> getReportProduct() {
		return productRepository.reportProduct();
	}

	@Override
	public List<Product> findTop5() {
		return productRepository.getTop5();
	}


	@Override
	public ResponseEntity<Object> deleteFeedbackById(Integer Id) {
		try {
			Optional<Feedback> feedback = feedbackRepository.findById(Id);
			if (feedback.isPresent()) {
				feedbackRepository.delete(feedback.get());
				// Xóa blog thành công, trả về trạng thái HTTP 200 OK và thông báo thành công
				return ResponseEntity.status(HttpStatus.OK).build();
			} else {
				// Nếu không tìm thấy blog, trả về trạng thái HTTP 404 Not Found
				return ResponseEntity.notFound().build();
			}
		} catch (Exception e) {
			e.printStackTrace();
			// Xử lý lỗi, trả về trạng thái HTTP 500 Internal Server Error và thông báo lỗi
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Đã xảy ra lỗi khi xóa feedback: " + e.getMessage());
		}
	}



}
