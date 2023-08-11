package com.gamevh.entities;

import java.io.Serializable;
import java.util.Date;

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
@Table(name = "comment")
public class Comment implements Serializable {
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="Id", unique=true, nullable=false, precision=10)
    private Integer id;

    @Column(name="Content", nullable=false, length=255)
    private String content;

    @Column(name="create_date", nullable=false)
    private Date createDate;

    @Column(name="Status", nullable=false, length=1)
    private Integer status;

    @ManyToOne(optional=false)
    @JoinColumn(name="account_id", nullable=false)
    private Account account;

    @ManyToOne(optional=false)
    @JoinColumn(name="blog_id", nullable=false)
    private Blog blog;
}
