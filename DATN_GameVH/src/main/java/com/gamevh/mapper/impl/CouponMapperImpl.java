package com.gamevh.mapper.impl;

import javax.annotation.processing.Generated;

import org.springframework.stereotype.Service;

import com.gamevh.dto.CouponDTO;
import com.gamevh.entities.Coupon;
import com.gamevh.mapper.CouponMapper;

@Generated(value = "org.mapstruct.ap.MappingProcessor", date = "2023-07-15T11:18:07+0700", comments = "version: 1.5.5.Final, compiler: Eclipse JDT (IDE) 1.4.300.v20221108-0856, environment: Java 18.0.2.1 (Oracle Corporation)")
@Service
public class CouponMapperImpl implements CouponMapper {

	@Override
	public CouponDTO modelToDto(Coupon coupon) {
		if (coupon == null) {
			return null;
		}

		CouponDTO couponDTO = new CouponDTO();

		couponDTO.setAmount(coupon.getAmount());
		couponDTO.setCode(coupon.getCode());
		couponDTO.setCouponName(coupon.getCouponName());
		couponDTO.setDescription(coupon.getDescription());
		couponDTO.setExpDate(coupon.getExpDate());
		couponDTO.setId(coupon.getId());
		couponDTO.setImage(coupon.getImage());
		couponDTO.setMfgDate(coupon.getMfgDate());
		couponDTO.setMinSpend(coupon.getMinSpend());
		couponDTO.setStatus(coupon.getStatus());
		couponDTO.setValue(coupon.getValue());

		return couponDTO;
	}

	@Override
	public Coupon dtoToModel(CouponDTO couponDTO) {
		if (couponDTO == null) {
			return null;
		}

		Coupon coupon = new Coupon();

		coupon.setAmount(couponDTO.getAmount());
		coupon.setCode(couponDTO.getCode());
		coupon.setCouponName(couponDTO.getCouponName());
		coupon.setDescription(couponDTO.getDescription());
		coupon.setExpDate(couponDTO.getExpDate());
		coupon.setId(couponDTO.getId());
		coupon.setImage(couponDTO.getImage());
		coupon.setMfgDate(couponDTO.getMfgDate());
		coupon.setMinSpend(couponDTO.getMinSpend());
		coupon.setStatus(couponDTO.getStatus());
		coupon.setValue(couponDTO.getValue());

		return coupon;
	}
}
