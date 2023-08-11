package com.gamevh.service.impl;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.gamevh.dto.MomoDTO;
import com.gamevh.service.MomoService;

@Service
public class MomoServiceImpl implements MomoService {
	private final RestTemplate restTemplate;
	private final String apiUrl;

	public MomoServiceImpl(RestTemplate restTemplate) {
		this.restTemplate = restTemplate;
		this.apiUrl = "https://test-payment.momo.vn/v2/gateway/api/";
	}

	@Override
	public MomoDTO createOrder(MomoDTO momoDTO) {
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<MomoDTO> requestEntity = new HttpEntity<>(momoDTO, headers);

		ResponseEntity<MomoDTO> responseEntity = restTemplate.exchange(apiUrl + "create", HttpMethod.POST, requestEntity,
				MomoDTO.class);

		return responseEntity.getBody();
	}

	@Override
	public MomoDTO queryTransaction(MomoDTO momoInput) {
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<MomoDTO> requestEntity = new HttpEntity<>(momoInput, headers);

		ResponseEntity<MomoDTO> responseEntity = restTemplate.exchange(apiUrl + "query", HttpMethod.POST, requestEntity,
				MomoDTO.class);

		return responseEntity.getBody();
	}
}
