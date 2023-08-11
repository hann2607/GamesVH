package com.gamevh.mapper;

import org.mapstruct.Mapper;

import com.gamevh.dto.CouponDTO;
import com.gamevh.entities.Coupon;

@Mapper
public interface CouponMapper {
	
	CouponDTO modelToDto(Coupon coupon);
	
	Coupon dtoToModel (CouponDTO couponDTO);
	
}
