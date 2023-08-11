package com.gamevh.restcontroller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import com.gamevh.handle.CustomException;
import com.gamevh.request.CouponOwnerAddRequest;
import com.gamevh.request.CouponOwnerSearchRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.gamevh.dto.CouponDTO;
import com.gamevh.entities.CouponOwner;
import com.gamevh.mapper.CouponMapper;
import com.gamevh.service.CouponOwnerService;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/couponowner")
public class CouponOwnerRC {
	@Autowired
	CouponOwnerService couponOwnerService;

	@Autowired
	CouponMapper couponMapper;

	@GetMapping("getcoupon/{username}/{couponcode}")
	public ResponseEntity<CouponDTO> getAccountLogin(@PathVariable("username") Optional<String> username,
			@PathVariable("couponcode") Optional<String> couponcode) {
		Optional<String> optionalUsername = username;
		Optional<String> optionalCouponcode = couponcode;

		if ((optionalUsername.isPresent() && !optionalUsername.get().trim().equals(""))
				&& (optionalCouponcode.isPresent() && !optionalCouponcode.get().trim().equals(""))) {
			CouponOwner couponOwner = couponOwnerService.findCouponByAccount(optionalUsername.get(),
					optionalCouponcode.get());
			if (couponOwner != null) {
				CouponDTO couponDTO = couponMapper.modelToDto(couponOwner.getCoupon());
				return ResponseEntity.ok(couponDTO);
			}
		}

		return null;
	}

	@GetMapping("getcoupon/username/{username}")
	public ResponseEntity<List<CouponDTO>> getAccountLogin(@PathVariable("username") Optional<String> username) {
		Optional<String> optionalUsername = username;

		if ((optionalUsername.isPresent() && !optionalUsername.get().trim().equals(""))) {
			List<CouponOwner> couponOwners = couponOwnerService.findCouponByUsername(optionalUsername.get());
			if (!couponOwners.isEmpty()) {
				List<CouponDTO> couponDTOs = new ArrayList<>();
				for (CouponOwner couponOwner : couponOwners) {
					CouponDTO couponDTO = couponMapper.modelToDto(couponOwner.getCoupon());
					couponDTO.setIsUsed(!couponOwner.getStatus());
					couponDTOs.add(couponDTO);
				}
				
				couponDTOs.sort((coupon1, coupon2) -> coupon2.getExpDate().compareTo(coupon1.getExpDate()));

				return ResponseEntity.ok(couponDTOs);
			}
		}

		return null;
	}

	@PostMapping("/getAllBySearch")
	public ResponseEntity<?> getAllCoupon(@RequestBody CouponOwnerSearchRequest couponOwnerSearchRequest) {
		return ResponseEntity.ok(couponOwnerService.getAllBySearch(couponOwnerSearchRequest));
	}

	@PostMapping("/addCouponOwner")
	public ResponseEntity<?> addCouponOwner(@RequestBody CouponOwnerAddRequest couponOwnerAddRequest) {
		return ResponseEntity.ok(couponOwnerService.addCouponOwner(couponOwnerAddRequest));
	}

	@DeleteMapping("/{couponOwnerId}")
	public void deleteCategory(@PathVariable("couponOwnerId") Integer couponOwnerId) throws CustomException {
		couponOwnerService.deleteCouponOwner(couponOwnerId);
	}
}
