package com.gamevh.dto;

import java.time.LocalDate;

public interface ProductDTO{
	Integer getId();
	String getName();
	String getPoster();
	String getThumbnail();
	Double getSalePrice();
	Double getOriginPrice(); 
	Double getOffer();
	String getDetails();
	Double getRate();
	Integer getCountFeedBack();
	String getCategoryName();
	String getCategoryId();
	String getType();
	LocalDate getCreateDate();
}
