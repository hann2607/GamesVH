package com.gamevh.mapper.impl;

import javax.annotation.processing.Generated;

import org.springframework.stereotype.Service;

import com.gamevh.dto.FeedbackDTO;
import com.gamevh.entities.Feedback;
import com.gamevh.mapper.FeedbackMapper;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2023-07-29T11:48:14+0700",
    comments = "version: 1.5.5.Final, compiler: Eclipse JDT (IDE) 1.4.300.v20221108-0856, environment: Java 18.0.2.1 (Oracle Corporation)"
)
@Service
public class FeedbackMapperImpl implements FeedbackMapper {

    @Override
    public FeedbackDTO modelToDto(Feedback feedback) {
        if ( feedback == null ) {
            return null;
        }

        FeedbackDTO feedbackDTO = new FeedbackDTO();

        feedbackDTO.setContent( feedback.getContent() );
        feedbackDTO.setCreateDate( feedback.getCreateDate() );
        feedbackDTO.setId( feedback.getId() );
        feedbackDTO.setStar( feedback.getStar() );
        feedbackDTO.setStatus( feedback.getStatus() );

        return feedbackDTO;
    }

    @Override
    public Feedback dtoToModel(FeedbackDTO feedbackDTO) {
        if ( feedbackDTO == null ) {
            return null;
        }

        Feedback feedback = new Feedback();

        feedback.setContent( feedbackDTO.getContent() );
        feedback.setCreateDate( feedbackDTO.getCreateDate() );
        feedback.setId( feedbackDTO.getId() );
        feedback.setStar( feedbackDTO.getStar() );
        feedback.setStatus( feedbackDTO.getStatus() );

        return feedback;
    }
}
