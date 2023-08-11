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
@Table(name = "product", indexes = { @Index(name = "product_Name_IX", columnList = "Name", unique = true),
		@Index(name = "product_Poster_IX", columnList = "Poster", unique = false),
		@Index(name = "product_Thumbnail_IX", columnList = "Thumbnail", unique = false) })
public class Product implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id", unique = true, nullable = false, precision = 10)
	private Integer id;

	@Column(name = "Name", unique = true, length = 255)
	private String name;

	@Column(name = "Poster", unique = false, length = 255)
	private String poster;

	@Column(name = "Thumbnail", unique = false, length = 255)
	private String thumbnail;

	@Column(name = "origin_price", precision = 22, columnDefinition = "DOUBLE")
	private Double originPrice;

	@Column(name = "sale_price", precision = 22, columnDefinition = "DOUBLE")
	private Double salePrice;

	@Column(name = "Offer", precision = 22, columnDefinition = "DOUBLE")
	private Double offer;

	@Column(name = "create_date")
	private LocalDate createDate;

	@Column(name = "Available", precision = 3)
	private Boolean available;

	@Column(name = "Source", length = 255)
	private String source;

	@Column(name = "Link", length = 500)
	private String link;

	@Column(name = "Details", nullable = false, length = 500)
	private String details;

	@Column(name = "Qty", nullable = false, precision = 10)
	private Integer qty;

	@Column(name = "Status", nullable = false, length = 1)
	private Boolean status;

	@Column(name = "Type", nullable = false, length = 8)
	private String type;

	@JsonIgnore
	@OneToMany(mappedBy = "product")
	private List<Favorite> favorite;

	@JsonIgnore
	@OneToMany(mappedBy = "product")
	private List<Feedback> feedback;

	@JsonIgnore
	@OneToMany(mappedBy = "product")
	private List<OrderDetail> orderDetail;

	@JsonIgnore
	@OneToMany(mappedBy = "product")
	private List<Banner> banner;

	@ManyToOne
	@JoinColumn(name = "category_id")
	private Category category;
}
