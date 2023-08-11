package com.gamevh.mapper;

import org.mapstruct.Mapper;

import com.gamevh.dto.FeedbackDTO;
import com.gamevh.entities.Feedback;

@Mapper
public interface FeedbackMapper {
	
	FeedbackDTO modelToDto(Feedback feedback);
	
	Feedback dtoToModel (FeedbackDTO feedbackDTO);
	
}
