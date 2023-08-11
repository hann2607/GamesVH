package com.gamevh.dto;

import com.gamevh.entities.OrderData;
import com.gamevh.entities.OrderDetail;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class FullOrderDTO {
    OrderData orderData;
    List<OrderDetail> orderDetail;
}
