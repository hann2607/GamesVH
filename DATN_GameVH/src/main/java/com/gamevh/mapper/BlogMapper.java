package com.gamevh.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import com.gamevh.dto.BlogDataDTO;
import com.gamevh.entities.Blog;

@Mapper
public interface BlogMapper {
    BlogMapper INSTANCE = Mappers.getMapper(BlogMapper.class);

    Blog mapToBlog(BlogDataDTO blogDataDTO);

	BlogDataDTO mapToBlogDataDTO(Blog blog);
}

