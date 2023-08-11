package com.gamevh.restcontroller;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import com.gamevh.dto.FullOrderDTO;
import com.gamevh.handle.CustomException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.web.JsonPath;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.gamevh.dto.CartDTO;
import com.gamevh.dto.MailInfoDTO;
import com.gamevh.dto.OrderRequestDTO;
import com.gamevh.entities.Category;
import com.gamevh.entities.CouponOwner;
import com.gamevh.entities.OrderData;
import com.gamevh.entities.OrderDetail;
import com.gamevh.entities.Product;
import com.gamevh.repository.CategoryRepository;
import com.gamevh.repository.OrderDataRepository;
import com.gamevh.service.CouponOwnerService;
import com.gamevh.service.MailService;
import com.gamevh.service.OrderDetailService;
import com.gamevh.service.OrderService;
import com.gamevh.service.ProductService;
import com.gamevh.util.mail_CONSTANT;

import jakarta.mail.MessagingException;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/orderdata")
public class OrderDataRC {
	mail_CONSTANT mailBody = new mail_CONSTANT();
	@Autowired
	OrderDataRepository orderDataRepository;

	@Autowired
	CategoryRepository categoriesDAO;

	@Autowired
	OrderDataRepository orderDetailsDAO;

	@Autowired
	MailService mailService;

	@Autowired
	OrderService orderService;

	@Autowired
	CouponOwnerService couponOwnerService;
	
	@Autowired
	OrderDetailService orderDetailService;
	
	@Autowired
	ProductService productService;

	@GetMapping("")
	public ResponseEntity<Page<OrderData>> getAll(
			@RequestParam("page") Optional<Integer> page,
			@RequestParam("size") Optional<Integer> size,
			@RequestParam(value = "username", defaultValue = "", required = false) String username,
			@RequestParam(value = "phone", defaultValue = "", required = false) String phone,
			@RequestParam(value = "createdAt", defaultValue = "", required = false) Optional<LocalDate> createdAt
	) {
		System.out.println(createdAt);
		return ResponseEntity.ok(orderService.findAll(page, size, username, phone, createdAt));
	}

	@GetMapping("/categories")
	public ResponseEntity<List<Category>> getAllCategories(Model model) {
		return ResponseEntity.ok(categoriesDAO.findAll());
	}

	@GetMapping("/search/{search}")
	public ResponseEntity<List<OrderData>> search(Model model, @PathVariable("search") String search) {
		return ResponseEntity.ok(orderDataRepository.findByUsernameContaining(search));
	}

	@GetMapping("{id}")
	public ResponseEntity<OrderData> getOne(@PathVariable("id") Long id) {
		if (!orderDataRepository.existsById(id)) {
			return ResponseEntity.notFound().build();
		}
		return ResponseEntity.ok(orderDataRepository.findById(id).get());
	}

	@DeleteMapping("{id}")
	public ResponseEntity<Void> delete(@PathVariable("id") Long id) {
		if (!orderDataRepository.existsById(id)) {
			return ResponseEntity.notFound().build();
		}
		orderDataRepository.deleteById(id);
		return ResponseEntity.ok().build();
	}

	@PostMapping("/sendEmail")
	public ResponseEntity<MailInfoDTO> sendMail(@RequestBody MailInfoDTO mailInfo) throws MessagingException {
		MailInfoDTO mail = new MailInfoDTO();
		mail.setTo(mailInfo.getTo());
		mail.setSubject("Thông Báo Tạo Tài Khoản Thành Công");
		mail.setBody(mailBody.mail_order(mailInfo.getTo(), mailInfo.getSource()));
		mailService.send(mail);
		return ResponseEntity.ok(mailInfo);
	}

	@GetMapping("/orderdetail/{id}")
	public ResponseEntity<List<OrderDetail>> srcgame(Model model, @PathVariable("id") Long id) {
		return ResponseEntity.ok(orderDataRepository.findById(id).get().getOrderDetail());
	}

	@PostMapping("/create")
	public ResponseEntity<OrderData> createOrderAndOrderDetailAndUpdateCouponOwner(@RequestBody OrderRequestDTO orderRequestDTO) {
		if (orderRequestDTO.getOrderData() != null) {
			if (orderRequestDTO.getOrderData().getId() == null && orderService.findByOrderId(orderRequestDTO.getOrderData().getOrderId()) == null) {
				OrderData orderDataResult = orderService.add(orderRequestDTO.getOrderData());
				
				if (orderDataResult != null && orderRequestDTO.getOrderData().getCouponCode() != null
						&& !orderRequestDTO.getOrderData().getCouponCode().equals("")) {
					CouponOwner couponOwner = couponOwnerService
							.findCouponByAccount(orderRequestDTO.getOrderData().getAccount().getUsername(), orderRequestDTO.getOrderData().getCouponCode());
					couponOwner.setStatus(false);
					couponOwnerService.update(couponOwner);
				}
				
				if(orderDataResult != null) {
					for (CartDTO cartDTO : orderRequestDTO.getListCartDTO()) {
						Product product = productService.findById(cartDTO.getId());
						OrderDetail orderDetail = new OrderDetail();
						orderDetail.setOrderData(orderDataResult);
						orderDetail.setPrice(product.getSalePrice());
						orderDetail.setProduct(product);
						orderDetail.setQty(cartDTO.getQty());
						
						orderDetailService.add(orderDetail);
					}
				}
				return ResponseEntity.ok(orderRequestDTO.getOrderData());
			}
		}

		return null;
	}

	@GetMapping("/getTop5")
	public ResponseEntity<List<OrderData>> getTop5() {
		return ResponseEntity.ok(orderDetailsDAO.getTop5OrderDataOrderCreatedDate());
	}

	@GetMapping("/full/{orderId}")
	public FullOrderDTO findOne(@PathVariable("orderId") String orderId) throws CustomException {
		return orderService.findOne(orderId);
	}

	@PutMapping("/status/{orderId}")
	public void updateStatus(@PathVariable("orderId") String orderId, @RequestBody String newStatus) throws CustomException {
		orderService.updateStatus(orderId, newStatus);
	}
}
