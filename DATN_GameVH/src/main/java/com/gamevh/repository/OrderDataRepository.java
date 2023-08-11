package com.gamevh.repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.gamevh.entities.OrderData;

public interface OrderDataRepository extends JpaRepository<OrderData, Long> {

	@Query("SELECT o FROM OrderData o WHERE o.account.username = ?1")
	List<OrderData> findByUsernameContaining(String search);

	Optional<OrderData> findByOrderId(String orderId);
	@Query(value = "SELECT * FROM order_data order by create_date desc LIMIT 5",nativeQuery = true)
	List<OrderData> getTop5OrderDataOrderCreatedDate();

	@Query("SELECT o FROM OrderData o WHERE " +
			"(:username IS NULL or COALESCE(o.account.username, '') LIKE CONCAT('%', LOWER(:username), '%')) AND " +
			"(:phone IS NULL or COALESCE(o.phone, '') LIKE CONCAT('%', LOWER(:phone), '%')) AND " +
			"( COALESCE(:createdAt) IS NULL or o.createDate = :createdAt) ORDER BY o.createDate DESC")
	Page<OrderData> findAllByFilterPagination(Pageable pageable ,@Param("username") String username, @Param("phone") String phone,
									@Param("createdAt") Optional<LocalDate> createdAt);
	
	@Query(nativeQuery = true, value = "SELECT MONTH(create_date) AS month, " +
	           "SUM(CASE WHEN order_status = 'Đã hoàn thành' THEN 1 ELSE 0 END) AS totalOrderSuccess, " +
	           "SUM(CASE WHEN order_status = 'Đã hủy' THEN 1 ELSE 0 END) AS totalOrderFailed " +
	           "FROM db_gamesvh.order_data " +
	           "WHERE YEAR(create_date) = :year " +
	           "GROUP BY MONTH(create_date)")
	List<Object[]> getTotalOrderStatusByYear(Integer year);
	
	@Query(nativeQuery = true, value = "SELECT MONTH(create_date) AS month, " +
	           "SUM(CASE WHEN order_status = 'Đã hoàn thành' THEN total_price ELSE 0 END) AS totalPrice " +
	           "FROM db_gamesvh.order_data " +
	           "WHERE YEAR(create_date) = :year " +
	           "GROUP BY MONTH(create_date)")
	List<Object[]> getTotalPriceByYear(Integer year);
	
	@Query(nativeQuery = true, value = "SELECT " +
	           "    MONTH(create_date) AS month, " +
	           "    SUM(CASE WHEN payment_type = 'momo' THEN 1 ELSE 0 END) AS momo, " +
	           "    SUM(CASE WHEN payment_type = 'vnpay' THEN 1 ELSE 0 END) AS vnpay, " +
	           "    SUM(CASE WHEN payment_type = 'paypal' THEN 1 ELSE 0 END) AS paypal, " +
	           "    SUM(CASE WHEN payment_type = 'cod' THEN 1 ELSE 0 END) AS cod " +
	           "FROM " +
	           "    db_gamesvh.order_data " +
	           "WHERE " +
	           "    YEAR(create_date) = YEAR(NOW()) AND MONTH(create_date) = :month " +
	           "GROUP BY " +
	           "    MONTH(create_date)")
	List<Object[]> getPaymentTypeStatsForMonth(Integer month);
	
	@Query(nativeQuery = true, value = "SELECT " +
	           "    MONTH(o.create_date) AS month, " +
	           "    c.Name, " +
	           "    SUM(CASE WHEN o.order_status = 'Đã hoàn thành' THEN od.Qty ELSE 0 END) AS totalOrderSuccess " +
	           "FROM " +
	           "    db_gamesvh.order_data o " +
	           "    JOIN db_gamesvh.order_detail od ON o.Id = od.order_data_id " +
	           "    JOIN db_gamesvh.product p ON p.Id = od.product_id " +
	           "    JOIN db_gamesvh.category c ON c.Id = p.category_id " +
	           "WHERE " +
	           "    YEAR(o.create_date) = YEAR(NOW()) AND MONTH(o.create_date) = :month " +
	           "GROUP BY " +
	           "    MONTH(o.create_date), c.Name")
	List<Object[]> getOrderStatsForMonthAndByCategory(Integer month);
}
