package com.gamevh.service;

import java.util.List;

import org.springframework.http.ResponseEntity;

import com.gamevh.dto.BlogDTO;
import com.gamevh.dto.BlogDataDTO;

public interface BlogService {

	List<BlogDTO> findAll();

	List<BlogDTO> findTop4BlogsByCommentCountAndStatus();

	BlogDTO findById(Integer id);

	ResponseEntity<Object> createBlog(BlogDataDTO blogDataDTO);

	List<BlogDTO> findAllByStatus(Integer status);

	ResponseEntity<Object> getBlogById(Long id);

	ResponseEntity<Object> deleteBlogById(Long blogId);

	ResponseEntity<Object> getCommentsByBlogId(Integer blogId);
}
