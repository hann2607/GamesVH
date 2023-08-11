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
@Table(name="banner")
public class Banner implements Serializable{
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="Id", unique=true, nullable=false, precision=10)
    private Integer id;
	
    @Column(name="Image1", nullable=false, length=50)
    private String image1;
    
    @Column(name="Image2", nullable=false, length=50)
    private String image2;
    
    @Column(name="Image3", nullable=false, length=50)
    private String image3;
    
    @Column(name="Image4", nullable=false, length=50)
    private String image4;
    
    @Column(name="Image5", nullable=false, length=50)
    private String image5;
    
    @Column(name="Status", nullable=false, length=1)
    private Boolean status;
    
    @ManyToOne(optional=false)
    @JoinColumn(name="product_id", nullable=false)
    private Product product;
}
