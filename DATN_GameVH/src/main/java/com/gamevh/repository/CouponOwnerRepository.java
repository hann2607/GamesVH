package com.gamevh.repository;

import java.util.List;

import com.gamevh.dto.mapping.ICouponOwner;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.gamevh.entities.CouponOwner;

public interface CouponOwnerRepository extends JpaRepository<CouponOwner, Integer>{
	@Query("SELECT c FROM CouponOwner c WHERE (c.coupon.status = true) AND (c.status = true) AND (c.account.username = :username) AND (c.coupon.code = :couponcode)")
	CouponOwner findCouponByAccount(String username, String couponcode);
	
	List<CouponOwner> findByAccountUsernameContaining(String username);

	@Query(value = "select co.id,c.id as couponId,a.id as accountId,a.Fullname as userName,l.Address as location,c.Value as totalMoneySpent,c.coupon_name as voucherName," +
			"c.Code as code,c.Status as status,c.image  from coupon_owner co  \n" +
			"left join coupon c on c.Id  = co.coupon_id\n" +
			"left join account a  on a.Id  = co.account_id\n" +
			"left join location l on l.account_id = a.Id \n" +
			"where 1 =1 \n" +
			"AND (:couponName is null OR c.coupon_name like %:couponName%)\n" +
			"AND (:customerName is null OR a.Fullname  like %:customerName%)\n" +
			"AND (:totalMoneySpent is null OR c.Value  = :totalMoneySpent)\n" +
			"AND (:location is null OR l.Address  like %:location%)",nativeQuery = true)
	List<ICouponOwner> getAllBySearch(String couponName, String customerName, Double totalMoneySpent, String location);
}
