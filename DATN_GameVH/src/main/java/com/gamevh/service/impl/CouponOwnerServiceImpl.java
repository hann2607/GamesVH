package com.gamevh.service.impl;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import com.gamevh.dto.mapping.ICouponOwner;
import com.gamevh.entities.Account;
import com.gamevh.entities.Coupon;
import com.gamevh.handle.CustomException;
import com.gamevh.repository.AccountRepository;
import com.gamevh.repository.CouponRepository;
import com.gamevh.request.CouponOwnerAddRequest;
import com.gamevh.request.CouponOwnerSearchRequest;
import com.gamevh.response.CouponOwnerResponse;
import jakarta.annotation.Resource;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.gamevh.entities.CouponOwner;
import com.gamevh.repository.CouponOwnerRepository;
import com.gamevh.service.CouponOwnerService;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class CouponOwnerServiceImpl implements CouponOwnerService{
	@Autowired
	CouponOwnerRepository couponOwnerRepository;

	@Resource
	private AccountRepository accountRepository;
	@Resource
	private CouponRepository couponRepository;
	@Override
	public List<CouponOwnerResponse> getAllBySearch(CouponOwnerSearchRequest couponOwnerSearchRequest) {
		List<ICouponOwner> lst = couponOwnerRepository.getAllBySearch(couponOwnerSearchRequest.getCouponName(),couponOwnerSearchRequest.getCustomerName(),
				couponOwnerSearchRequest.getTotalMoneySpent(),couponOwnerSearchRequest.getLocation());
		List<CouponOwnerResponse> lstResponse = lst.stream().map(s->{
			CouponOwnerResponse response = new CouponOwnerResponse();
			BeanUtils.copyProperties(s,response);
			return response;
		}).collect(Collectors.toList());
		return lstResponse;
	}

	@Override
	public ResponseEntity<?> addCouponOwner(CouponOwnerAddRequest couponOwnerAddRequest) {
		CouponOwner entity = new CouponOwner();
		Optional<Coupon> coupon = couponRepository.findById(couponOwnerAddRequest.getCouponId());
		Account account = accountRepository.findById(couponOwnerAddRequest.getAccountId());
		entity.setCoupon(coupon.get());
		entity.setAccount(account);
		entity.setStatus(true);
		return ResponseEntity.ok(couponOwnerRepository.save(entity));
	}

	@Override
	public void deleteCouponOwner(Integer couponOwnerId) throws CustomException {
		Optional<CouponOwner> couponOwner = couponOwnerRepository.findById(couponOwnerId);
		if(!couponOwner.isPresent()){
			throw new CustomException
					("Không tìm thấy danh mục sản phẩm với id " + couponOwnerId, HttpStatus.NOT_FOUND);
		}
		couponOwnerRepository.delete(couponOwner.get());
	}

	@Override
	public CouponOwner findCouponByAccount(String username, String couponcode) {
		return couponOwnerRepository.findCouponByAccount(username, couponcode);
	}

	@Override
	public CouponOwner update(CouponOwner couponOwner) {
		return couponOwnerRepository.save(couponOwner);
	}

	@Override
	public List<CouponOwner> findCouponByUsername(String username) {
		return couponOwnerRepository.findByAccountUsernameContaining(username);
	}
	
}
