package com.gamevh.restcontroller;

import com.gamevh.handle.CustomException;
import com.gamevh.request.CouponAddRequest;
import com.gamevh.request.CouponSearchRequest;
import com.gamevh.service.CouponService;
import jakarta.annotation.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.security.GeneralSecurityException;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/coupon")
public class CouponRC {
    @Resource
    private CouponService couponService;

    @PostMapping("/getAllBySearch")
    public ResponseEntity<?> getAllCoupon(@RequestBody CouponSearchRequest couponSearchRequest) {
        return ResponseEntity.ok(couponService.getAllCoupon(couponSearchRequest));
    }

    @PostMapping("/addCoupon")
    public ResponseEntity<?> addCoupon(@RequestBody CouponAddRequest couponAddRequest) throws GeneralSecurityException, IOException {
        return ResponseEntity.ok(couponService.addCoupon(couponAddRequest));
    }
    @DeleteMapping("/{couponId}")
    public void deleteCategory(@PathVariable("couponId") Integer couponId) throws CustomException {
        couponService.deleteCoupon(couponId);
    }
}
