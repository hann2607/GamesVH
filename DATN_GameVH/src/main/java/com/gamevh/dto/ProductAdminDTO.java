package com.gamevh.dto;

import java.time.LocalDate;

public interface ProductAdminDTO{
	Integer getId();
	String getName();
	String getPoster();
	String getThumbnail();
	Double getSalePrice();
	Double getOriginPrice(); 
	Double getOffer();
	Boolean getAvailable();
	Boolean getStatus();
	String getSource();
	String getLink();
	Integer getQty();
	String getDetails();
	Double getRate();
	Integer getCountFeedBack();
	String getCategoryName();
	String getCategoryId();
	String getType();
	LocalDate getCreateDate();
}
