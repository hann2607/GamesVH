package com.gamevh.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ZaloPayDTO {
    private String appUser; // Thông tin định danh của người dùng ứng dụng thanh toán đơn hàng
    private String appTransID; // Mã giao dịch của đơn hàng
    private long appTime; // Thời gian tạo đơn hàng (unix timestamp in milisecond)
    private long amount; // Giá trị của đơn hàng (VND)
    private List<Item> items; // Item của đơn hàng
    private String description; // Thông tin mô tả về dịch vụ đang được thanh toán
    private String embedData; // Dữ liệu riêng của đơn hàng

    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class Item {
        private String itemId; // ID của item
        private String itemName; // Tên của item
        private long itemPrice; // Giá của item
        private int itemQuantity; // Số lượng của item
    }
}

