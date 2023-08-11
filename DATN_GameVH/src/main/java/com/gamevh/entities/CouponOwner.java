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
@Table(name = "coupon_owner")
public class CouponOwner implements Serializable {
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="Id", unique=true, nullable=false, precision=19)
    private Long id;

    @Column(name="Status", nullable=false, length=1)
    private Boolean status;

    @ManyToOne(optional=false)
    @JoinColumn(name="account_id", nullable=false)
    private Account account;

    @ManyToOne(optional=false)
    @JoinColumn(name="coupon_id", nullable=false)
    private Coupon coupon;

}
