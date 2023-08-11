package com.gamevh.mapper;

import org.mapstruct.Mapper;

import com.gamevh.dto.FeedbackWebsiteDTO;
import com.gamevh.entities.FeedbackWebsite;

@Mapper
public interface FeedbackWebsiteMapper {

	FeedbackWebsiteDTO modelToDto(FeedbackWebsite feedbackWebsite);

	FeedbackWebsite dtoToModel(FeedbackWebsiteDTO feedbackWebsiteDTO);
}
