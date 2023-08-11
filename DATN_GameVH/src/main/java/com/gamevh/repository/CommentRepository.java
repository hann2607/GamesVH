package com.gamevh.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.gamevh.entities.Comment;

public interface CommentRepository extends JpaRepository<Comment, Integer> {
	
	List<Comment> findByBlogIdAndStatus(Integer blogId, Integer status);

	List<Comment> findByBlogId(Integer blogId);

	Optional<Comment> findById(Long commentId);
}
