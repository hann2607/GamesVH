package com.gamevh.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gamevh.dto.MailInfoDTO;
import com.gamevh.entities.Account;
import com.gamevh.entities.OrderData;
import com.gamevh.entities.OrderDetail;
import com.gamevh.service.AccountService;
import com.gamevh.service.EncryptionService;
import com.gamevh.service.MailService;
import com.gamevh.service.OrderDetailService;
import com.gamevh.service.OrderService;
import com.gamevh.util.mail_CONSTANT;

import jakarta.mail.MessagingException;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/mail")
public class SendMailRC {

	@Autowired
	MailService mailService;

	@Autowired
	OrderService orderService;

	@Autowired
	OrderDetailService orderDetailService;

	@Autowired
	AccountService accountService;

	@Autowired
	EncryptionService encryptionService;

	@PostMapping("send/checkout/{orderId}")
	public ResponseEntity<String> sendMailOrderSuccess(@PathVariable("orderId") String orderId,
			@RequestBody MailInfoDTO mailInfo) throws MessagingException {
		if (mailInfo != null) {
			if (!orderId.equals("") && orderId != null) {
				OrderData orderData = orderService.findByOrderId(orderId);
				if (orderData != null) {
					List<OrderDetail> orderDetail = orderDetailService.findByOrderId(orderData.getId());
					mailService.send(mailInfo.getTo(), mailInfo.getSubject(),
							mail_CONSTANT.mail_Order_Success(orderData, orderDetail));
					return ResponseEntity.ok().build();
				}
			}
		}

		return ResponseEntity.badRequest().build();
	}

	@PostMapping("send/register/{username}/{password}")
	public ResponseEntity<String> sendMailRegister(@PathVariable("username") String username,
			@PathVariable("password") String password, @RequestBody MailInfoDTO mailInfo) throws MessagingException {
		if (mailInfo != null) {
			Account account = accountService.findByUsername(username);
			if (account != null) {
				mailService.send(mailInfo.getTo(), mailInfo.getSubject(),
						mail_CONSTANT.mail_Welcome(account.getFullname(), account.getUsername(), password));
				return ResponseEntity.ok().build();
			}
		}

		return ResponseEntity.badRequest().build();
	}

	@PostMapping("send/thanks/{username}")
	public ResponseEntity<String> sendMailRegister(@PathVariable("username") String username,
			@RequestBody MailInfoDTO mailInfo) throws MessagingException {
		if (mailInfo != null) {
			Account account = accountService.findByUsername(username);
			if (account != null) {
				mailService.send(mailInfo.getTo(), mailInfo.getSubject(), mail_CONSTANT.mail_TY(account.getFullname()));
				return ResponseEntity.ok().build();
			}
		}

		return ResponseEntity.badRequest().build();
	}
}
