package com.gamevh.dto.impl;

import java.time.LocalDate;

import com.gamevh.dto.ProductAdminDTO;


public class ProductAdminDTOImpl implements ProductAdminDTO {
	private Integer id;
	private String name;
	private String poster;
	private String thumbnail;
	private Double salePrice;
	private Double originPrice;
	private Double offer;
	private Boolean available;
    private String source;
    private String link;
    private Integer qty;
    private Boolean status;
	private String details;
	private Double rate;
	private Integer countFeedBack;
	private String categoryName;
	private String categoryId;
	private String type;
	private LocalDate createDate;

	// Constructor
	public ProductAdminDTOImpl(Integer id, String name, String poster, String thumbnail,Double originPrice, Double salePrice, Double offer,Boolean available,String source,String link,
			Integer qty,Boolean status,String details, Double rate, Integer countFeedBack, String categoryName, String categoryId, String type,
			LocalDate localDate) {
		this.id = id;
		this.name = name;
		this.poster = poster;
		this.thumbnail = thumbnail;
		this.originPrice = originPrice;
		this.salePrice = salePrice;
		this.offer = offer;
		this.available = available;
		this.source = source;
		this.link = link;
		this.qty = qty;
		this.status = status;
		this.details = details;
		this.rate = rate;
		this.countFeedBack = countFeedBack;
		this.categoryName = categoryName;
		this.categoryId = categoryId;
		this.type = type;
		this.createDate = localDate;
	}

	// Getter methods
	@Override
	public Integer getId() {
		return id;
	}

	@Override
	public String getName() {
		return name;
	}

	@Override
	public String getPoster() {
		return poster;
	}

	@Override
	public String getThumbnail() {
		return thumbnail;
	}

	@Override
	public Double getSalePrice() {
		return salePrice;
	}
	
	@Override
	public Double getOriginPrice() {
		return originPrice;
	}

	@Override
	public Double getOffer() {
		return offer;
	}
	
	@Override
	public Boolean getAvailable() {
		return available;
	}
	
	@Override
	public Boolean getStatus() {
		return status;
	}
	
	@Override
	public String getSource() {
		return source;
	}
	
	@Override
	public String getLink() {
		return link;
	}
	
	@Override
	public Integer getQty() {
		return qty;
	}

	@Override
	public String getDetails() {
		return details;
	}

	@Override
	public Double getRate() {
		return rate;
	}

	@Override
	public Integer getCountFeedBack() {
		return countFeedBack;
	}

	@Override
	public String getCategoryName() {
		return categoryName;
	}

	@Override
	public String getCategoryId() {
		return categoryId;
	}
	
	@Override
	public String getType() {
		return type;
	}

	@Override
	public LocalDate getCreateDate() {
		return createDate;
	}
}
