package com.gamevh.entities;

import java.time.LocalDateTime;

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
@Table(name="feedback_website")
public class FeedbackWebsite {
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="Id", unique=true, nullable=false, precision=10)
    private Integer id;
	
	@Column(name = "Content", nullable = false, columnDefinition = "LONGTEXT")
	private String content;
	
	@Column(name="create_date", nullable=false)
    private LocalDateTime createDate;
	
	@ManyToOne(optional=false)
    @JoinColumn(name="account_id", nullable=false)
    private Account account;
}
