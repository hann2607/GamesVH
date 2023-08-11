package com.gamevh.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.gamevh.entities.Coupon;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CouponRepository extends JpaRepository<Coupon, Integer>{
    @Query(value = "SELECT * FROM coupon WHERE 1 = 1 AND (:couponId is null OR id = :couponId) AND (:couponName is null OR coupon_name like %:couponName%)",nativeQuery = true)
    List<Coupon> getAllCouponBySearch(Long couponId, String couponName);
}
