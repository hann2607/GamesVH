package com.gamevh.restcontroller;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.gamevh.dto.BlogDTO;
import com.gamevh.dto.BlogDataDTO;
import com.gamevh.dto.ErrorResponseDTO;
import com.gamevh.service.BlogService;
import com.gamevh.service.CommentService;
import com.gamevh.service.GoogleDriveService;

import jakarta.transaction.Transactional;

@CrossOrigin("*")
@RestController
@Transactional
@RequestMapping("/api/blog")
public class BlogRC {

	@Autowired
	BlogService blogService;

	@Autowired
	CommentService commentService;

	@Autowired
	private GoogleDriveService driveService;

	@GetMapping("getAllBlog")
	public ResponseEntity<List<BlogDTO>> getAllBlogDTOByStatus() {
		// Lấy danh sách blog có status = true
		List<BlogDTO> lstBlog = blogService.findAllByStatus(1);
		return ResponseEntity.ok(lstBlog);
	}

	@GetMapping("getAll")
	public ResponseEntity<List<BlogDTO>> getAllBlogDTO() {
		// Lấy toàn bộ danh sách blog
		List<BlogDTO> lstBlog = blogService.findAll();
		return ResponseEntity.ok(lstBlog);
	}

	@GetMapping("getTop4BlogPopular")
	public ResponseEntity<List<BlogDTO>> getTop4BlogPopular() {
		// Lấy danh sách blog có status = true
		List<BlogDTO> lstBlog = blogService.findTop4BlogsByCommentCountAndStatus();
		return ResponseEntity.ok(lstBlog);
	}

	@GetMapping("getBlogDetail/{blogId}")
	public ResponseEntity<BlogDTO> getBlogDTOById(@PathVariable("blogId") Integer blogId) {
		return ResponseEntity.ok(blogService.findById(blogId));
	}

	@PostMapping("upload-imageBlog")
	public ResponseEntity<Object> uploadImage(@RequestParam("image") MultipartFile image)
			throws GeneralSecurityException {
		try {
			if (!image.isEmpty()) {
				String fileName = image.getOriginalFilename();
				String mimeType = image.getContentType();
				String folderId = "1k01GTFqGOfNB4FHInOpXfSS_a1ZKne_N"; // ID của thư mục trên Google Drive để lưu file
				String fileId = driveService.uploadFile(image, fileName, mimeType, folderId);

				// Xử lý thành công
				String responseData = "{\"fileId\": \"" + fileId + "\"}";
				return ResponseEntity.ok(responseData);
			} else {
				// Trả về thông báo lỗi khi không có hình được upload
				ErrorResponseDTO errorResponse = new ErrorResponseDTO(HttpStatus.BAD_REQUEST.value(),
						"Không có hình được upload", LocalDateTime.now());
				return ResponseEntity.status(HttpStatus.BAD_REQUEST.value()).body(errorResponse);
			}
		} catch (IOException e) {
			e.printStackTrace();
			// Xử lý lỗi
			ErrorResponseDTO errorResponse = new ErrorResponseDTO(HttpStatus.INTERNAL_SERVER_ERROR.value(),
					"Lỗi upload hình: " + e.getMessage(), LocalDateTime.now());
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR.value()).body(errorResponse);
		}
	}

	@PostMapping("create")
	public ResponseEntity<Object> createBLog(@RequestBody BlogDataDTO blogDataDTO) {
		return blogService.createBlog(blogDataDTO);
	}

	@GetMapping("{blogId}")
	public ResponseEntity<Object> editBLog(@PathVariable Long blogId) {
		return blogService.getBlogById(blogId);
	}

	@DeleteMapping("{blogId}")
	public ResponseEntity<Object> deleteBlog(@PathVariable Long blogId) {
		return blogService.deleteBlogById(blogId);
	}

	@GetMapping("getComment/{blogId}")
	public ResponseEntity<Object> getCommentsByBlogId(@PathVariable Integer blogId) {
		// Gọi hàm từ Repository để lấy danh sách bình luận dựa vào blogId
		return blogService.getCommentsByBlogId(blogId);
	}

	// API endpoint để xóa bình luận dựa trên commentId
	@DeleteMapping("deleteComment/{commentId}")
	public ResponseEntity<Object> deleteCommentById(@PathVariable Long commentId) {
		return commentService.deleteCommentById(commentId);
	}

	@PutMapping("/updateCommentStatus/{commentId}")
	public ResponseEntity<Object> updateCommentStatus(@PathVariable Long commentId, @RequestParam Integer status) {
		return commentService.updateCommentStatus(commentId, status);
	}

}
