package com.gamevh.mapper.impl;

import com.gamevh.dto.FullOrderDTO;
import com.gamevh.entities.OrderData;
import org.springframework.stereotype.Component;

@Component
public class OrderMapper {
    public FullOrderDTO orderToFullOrder(OrderData order){
        FullOrderDTO fullOrderDTO = new FullOrderDTO();
        fullOrderDTO.setOrderData(order);
        fullOrderDTO.setOrderDetail(order.getOrderDetail());
        return fullOrderDTO;
    }
}
