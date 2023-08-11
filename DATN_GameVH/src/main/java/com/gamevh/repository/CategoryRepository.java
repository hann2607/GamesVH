package com.gamevh.repository;

import com.gamevh.dto.mapping.IRecordCountTotal;
import com.gamevh.dto.mapping.IRecordDataChart;
import org.springframework.data.jpa.repository.JpaRepository;

import com.gamevh.entities.Category;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;


public interface CategoryRepository extends JpaRepository<Category, Integer> {

    @Query(value = "select \n" +
            "(select count(1) from product ) as totalProduct,\n" +
            "(select count(1) from blog ) as totalBlog,\n" +
            "(select count(1) from order_data  ) as totalOrder,\n" +
            "(select count(1) from account ) as totalCustomer\n" +
            "from dual ",nativeQuery = true)
    IRecordCountTotal findRecordCountTotal();

    @Query(value = "select 'product' as type,count(1) totalRecord,DATE_FORMAT(create_date , '%m%Y') monthYear from product\n" +
            "where DATE_FORMAT(create_date , '%Y') = DATE_FORMAT(CURDATE() , '%Y')\n" +
            "group by  DATE_FORMAT(create_date , '%m%Y') \n" +
            "union all\n" +
            "select 'payment',count(1) totalRecord,DATE_FORMAT(create_date , '%m%Y') monthYear from order_data od \n" +
            "where DATE_FORMAT(create_date , '%Y') = DATE_FORMAT(CURDATE() , '%Y')\n" +
            "group by  DATE_FORMAT(create_date , '%m%Y') ",nativeQuery = true)
    List<IRecordDataChart> findRecordDataChart();
    Optional<Category> findByCategoryId(String categoryId);
}
