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
@Table(name="authority")
public class Authority  implements Serializable{
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="Id", unique=true, nullable=false, precision=10)
    private Integer id;
	
    @ManyToOne(optional=false)
    @JoinColumn(name="role_id", nullable=false)
    private Role role;
    
    @ManyToOne(optional=false)
    @JoinColumn(name="account_id", nullable=false)
    private Account account;
}