package com.gamevh.mapper.impl;

import javax.annotation.processing.Generated;

import org.springframework.stereotype.Service;

import com.gamevh.dto.FeedbackWebsiteDTO;
import com.gamevh.entities.FeedbackWebsite;
import com.gamevh.mapper.FeedbackWebsiteMapper;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2023-08-06T21:25:37+0700",
    comments = "version: 1.5.5.Final, compiler: Eclipse JDT (IDE) 1.4.300.v20221108-0856, environment: Java 18.0.2.1 (Oracle Corporation)"
)

@Service
public class FeedbackWebsiteMapperImpl implements FeedbackWebsiteMapper {

    @Override
    public FeedbackWebsiteDTO modelToDto(FeedbackWebsite feedbackWebsite) {
        if ( feedbackWebsite == null ) {
            return null;
        }

        FeedbackWebsiteDTO feedbackWebsiteDTO = new FeedbackWebsiteDTO();

        feedbackWebsiteDTO.setContent( feedbackWebsite.getContent() );
        feedbackWebsiteDTO.setCreateDate( feedbackWebsite.getCreateDate() );
        feedbackWebsiteDTO.setId( feedbackWebsite.getId() );
        
        if(feedbackWebsite.getAccount() != null) {
        	feedbackWebsiteDTO.setUsername(feedbackWebsite.getAccount().getUsername());
        	feedbackWebsiteDTO.setFullname(feedbackWebsite.getAccount().getFullname());
        }

        return feedbackWebsiteDTO;
    }

    @Override
    public FeedbackWebsite dtoToModel(FeedbackWebsiteDTO feedbackWebsiteDTO) {
        if ( feedbackWebsiteDTO == null ) {
            return null;
        }

        FeedbackWebsite feedbackWebsite = new FeedbackWebsite();

        feedbackWebsite.setContent( feedbackWebsiteDTO.getContent() );
        feedbackWebsite.setCreateDate( feedbackWebsiteDTO.getCreateDate() );
        feedbackWebsite.setId( feedbackWebsiteDTO.getId() );

        return feedbackWebsite;
    }
}
