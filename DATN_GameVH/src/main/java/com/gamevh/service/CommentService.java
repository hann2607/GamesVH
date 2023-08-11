package com.gamevh.service;

import java.util.List;

import org.springframework.http.ResponseEntity;

import com.gamevh.dto.CommentDTO;

public interface CommentService {

	List<CommentDTO> findAllByBlogId(Integer blogId);

	void save(CommentDTO dto);

	ResponseEntity<Object> deleteCommentById(Long commentId);

	ResponseEntity<Object> updateCommentStatus(Long commentId, Integer newStatus);

}
