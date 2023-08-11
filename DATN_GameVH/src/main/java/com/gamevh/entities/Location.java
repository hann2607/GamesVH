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
@Table(name = "location")
public class Location implements Serializable {
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="Id", unique=true, nullable=false, precision=10)
    private Integer id;

    @Column(name="Address", nullable=false, length=100)
    private String address;

    @Column(name="Province", nullable=false, length=100)
    private String province;

    @Column(name="District", nullable=false, length=100)
    private String district;

    @Column(name="Ward", nullable=false, length=100)
    private String ward;

    @Column(name="Phone", nullable=false, length=10)
    private String phone;

    @Column(name="Type", nullable=false, length=9)
    private String type;
    
    @Column(name="address_default", nullable=false, length = 1)
    private Boolean addressDefault;

    @ManyToOne(optional=false)
    @JoinColumn(name="account_id", nullable=false)
    private Account account;

}
