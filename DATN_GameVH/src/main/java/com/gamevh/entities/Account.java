package com.gamevh.entities;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Index;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.*;

@SuppressWarnings("serial")
@EqualsAndHashCode(exclude = "authority")
@ToString(exclude = "authority")
@Setter
@Getter
@Entity
@Table(name="account", indexes={@Index(name="account_Username_IX", columnList="Username", unique=true), @Index(name="account_Email_IX", columnList="Email", unique=true), @Index(name="account_Photo_IX", columnList="Photo", unique=false)})
public class Account  implements Serializable{
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="Id", unique=true, nullable=false, precision=10)
    private Integer id;
	
    @Column(name="Username", unique=true, nullable=false, length=50)
    private String username;
    
    @Column(name="Password", length=255)
    private String password;
    
    @Column(name="Fullname", length=255)
    private String fullname;
    
    @Column(name="Email", unique=true, length=255)
    private String email;
    
    @Column(name="Photo", unique=false, length=255)
    private String photo;
    
    @Column(name="Status", nullable=false, length=1)
    private Boolean status;
    
    @Column(name="access_token", nullable=true, length=255)
    private String accessToken;
    
    @Column(name="Type", length=20)
    private String type;
    
    @JsonIgnore
    @OneToMany(mappedBy="account")
    private List<Blog> blog;
    
    @JsonIgnore
    @OneToMany(mappedBy="account")
    private List<Comment> comment;
    
    @JsonIgnore
    @OneToMany(mappedBy="account")
    private List<CouponOwner> couponOwner;
    
    @JsonIgnore
    @OneToMany(mappedBy="account")
    private List<Favorite> favorite;
    
    @JsonIgnore
    @OneToMany(mappedBy="account")
    private List<Feedback> feedback;
    
    @JsonIgnore
    @OneToMany(mappedBy="account")
    private List<Location> location;
    
    @JsonIgnore
    @OneToMany(mappedBy="account")
    private List<OrderData> orderData;
    
    @JsonIgnore
    @OneToMany(mappedBy="account")
    private List<Authority> authority;
    
    @JsonIgnore
    @OneToMany(mappedBy="account")
    private List<FeedbackWebsite> feedbackWebsite;
}
