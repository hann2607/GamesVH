package com.gamevh.service;

import com.gamevh.dto.MomoDTO;

public interface MomoService {
	MomoDTO createOrder(MomoDTO momoDTO);
	
	MomoDTO queryTransaction(MomoDTO momoInput);
}
