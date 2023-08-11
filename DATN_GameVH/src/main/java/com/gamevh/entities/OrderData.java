package com.gamevh.entities;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Index;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name="order_data", indexes={@Index(name="order_data_order_id_IX", columnList="order_id", unique=true)})
public class OrderData  implements Serializable{
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="Id", unique=true, nullable=false, precision=19)
    private Long id;

    @Column(name="order_id", unique=true, nullable=false, length=20)
    private String orderId;

    @Column(name="Fullname", nullable=false, length=50)
    private String fullname;

    @Column(name="create_date")
    private LocalDate createDate;

    @Column(name="Address", length=255)
    private String address;

    @Column(name="payment_type", nullable=false, length=6)
    private String paymentType;

    @Column(name="shipping_fee", nullable=false, precision=22, columnDefinition = "DOUBLE")
    private Double shippingFee;

    @Column(name="coupon_code", length=10)
    private String couponCode;

    @Column(name="Email", nullable=false, length=50)
    private String email;

    @Column(name="Phone", nullable=false, length=10)
    private String phone;

    @Column(name="order_status", nullable=false, length=100)
    private String orderStatus;
    
    @Column(name="payment_status", nullable=false, length=1)
    private Boolean paymentStatus;

    @Column(name="Note", length=255)
    private String note;

    @Column(name="total_price", nullable=false, precision=22, columnDefinition = "DOUBLE")
    private Double totalPrice;

    @Column(name="Qty", nullable=false, precision=10)
    private Integer qty;

    @ManyToOne(optional=false)
    @JoinColumn(name="account_id", nullable=false)
    private Account account;

    @JsonIgnore
    @OneToMany(mappedBy="orderData")
    private List<OrderDetail> orderDetail;
}