package com.gamevh.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.gamevh.dto.CommentDTO;
import com.gamevh.entities.Account;
import com.gamevh.entities.Comment;
import com.gamevh.repository.AccountRepository;
import com.gamevh.repository.BlogRepository;
import com.gamevh.repository.CommentRepository;
import com.gamevh.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	CommentRepository commentRepository;

	@Autowired
	BlogRepository blogRepository;

	@Autowired
	AccountRepository accountRepository;

	@Override
	public List<CommentDTO> findAllByBlogId(Integer blogId) {
		List<Comment> comments = commentRepository.findByBlogIdAndStatus(blogId, 1);
		List<CommentDTO> commentDTOs = new ArrayList<>();
		for (Comment comment : comments) {
			CommentDTO commentDTO = new CommentDTO();
			// Thực hiện sao chép các thuộc tính từ đối tượng Comment sang đối tượng
			// CommentDTO
			commentDTO.setId(comment.getId());
			commentDTO.setContent(comment.getContent());
			commentDTO.setCreateDate(comment.getCreateDate());
			commentDTO.setUsername(comment.getAccount().getUsername());
			commentDTO.setAvatarUser(comment.getAccount().getPhoto());

			commentDTOs.add(commentDTO);
		}
		return commentDTOs;
	}

	@Override
	public void save(CommentDTO dto) {
		Comment entity = new Comment();
		entity.setContent(dto.getContent());
		entity.setCreateDate(new Date());
		entity.setStatus(0); // trạng thái mặc định cho comment luôn là false để chờ kiểm duyệt

		Account account = accountRepository.findByUsername(dto.getUsername());
		if (account != null) {
			entity.setAccount(account);
		} else {
			// Xử lý trường hợp không tìm thấy tài khoản
			// Ví dụ: throw một Exception hoặc gán giá trị mặc định cho account
		}

		entity.setBlog(blogRepository.findById(dto.getBlogId()).orElse(null));
		commentRepository.save(entity);
	}

	@Override
	public ResponseEntity<Object> deleteCommentById(Long commentId) {
		try {
			Optional<Comment> comment = commentRepository.findById(commentId);
			if (comment.isPresent()) {
				commentRepository.delete(comment.get());
				// Xóa blog thành công, trả về trạng thái HTTP 200 OK và thông báo thành công
				return ResponseEntity.status(HttpStatus.OK).build();
			} else {
				// Nếu không tìm thấy blog, trả về trạng thái HTTP 404 Not Found
				return ResponseEntity.notFound().build();
			}
		} catch (Exception e) {
			e.printStackTrace();
			// Xử lý lỗi, trả về trạng thái HTTP 500 Internal Server Error và thông báo lỗi
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Đã xảy ra lỗi khi xóa comment: " + e.getMessage());
		}
	}

	@Override
	public ResponseEntity<Object> updateCommentStatus(Long commentId, Integer newStatus) {
        try {
            Optional<Comment> comment = commentRepository.findById(commentId);
            if (comment.isPresent()) {
                Comment existingComment = comment.get();
                existingComment.setStatus(newStatus);
                commentRepository.save(existingComment);

                // Cập nhật trạng thái của comment thành công, trả về trạng thái HTTP 200 OK và thông báo thành công
                return ResponseEntity.status(HttpStatus.OK).build();
            } else {
                // Nếu không tìm thấy comment, trả về trạng thái HTTP 404 Not Found
                return ResponseEntity.notFound().build();
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Xử lý lỗi, trả về trạng thái HTTP 500 Internal Server Error và thông báo lỗi
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Đã xảy ra lỗi khi cập nhật trạng thái của comment: " + e.getMessage());
        }
    }
}
