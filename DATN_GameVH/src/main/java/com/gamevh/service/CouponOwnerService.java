package com.gamevh.service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import com.gamevh.entities.Account;
import com.gamevh.entities.Coupon;
import com.gamevh.entities.CouponOwner;
import com.gamevh.handle.CustomException;
import com.gamevh.request.CouponOwnerAddRequest;
import com.gamevh.request.CouponOwnerSearchRequest;
import com.gamevh.response.CouponOwnerResponse;
import jakarta.annotation.Resource;
import org.springframework.beans.BeanUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

public interface CouponOwnerService {
	CouponOwner findCouponByAccount(String username, String couponcode);
	
	List<CouponOwner> findCouponByUsername(String username);
	
	CouponOwner update(CouponOwner couponOwner);

	List<CouponOwnerResponse> getAllBySearch(CouponOwnerSearchRequest couponOwnerSearchRequest);

	ResponseEntity<?> addCouponOwner(CouponOwnerAddRequest couponOwnerAddRequest);

	void deleteCouponOwner(Integer couponOwnerId) throws CustomException;
}
