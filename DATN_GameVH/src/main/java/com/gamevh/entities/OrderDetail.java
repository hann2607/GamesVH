package com.gamevh.entities;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "order_detail")
public class OrderDetail implements Serializable {
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="Id", unique=true, nullable=false, precision=19)
    private Long id;

    @Column(name="Price", precision=22, columnDefinition = "DOUBLE")
    private Double price;

    @Column(name="Qty", nullable=false, precision=10)
    private Integer qty;

    @ManyToOne
    @JoinColumn(name="order_data_id")
    private OrderData orderData;

    @ManyToOne
    @JoinColumn(name="product_id")
    private Product product;
}
