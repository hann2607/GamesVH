package com.gamevh.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.gamevh.dto.BlogDTO;
import com.gamevh.dto.BlogDataDTO;
import com.gamevh.dto.CommentDTO;
import com.gamevh.entities.Blog;
import com.gamevh.entities.Comment;
import com.gamevh.mapper.BlogMapper;
import com.gamevh.repository.AccountRepository;
import com.gamevh.repository.BlogRepository;
import com.gamevh.repository.CommentRepository;
import com.gamevh.service.BlogService;

@Service
public class BlogServiceImpl implements BlogService {

	@Autowired
	BlogRepository blogRepository;

	@Autowired
	AccountRepository accountRepository;

	@Autowired
	CommentRepository commentRepository;

	@Override
	public List<BlogDTO> findAll() {
		// Lấy danh sách các đối tượng Blog từ repository
		List<Blog> blogEntities = blogRepository.findAll();

		// Sắp xếp danh sách các đối tượng Blog theo ngày đăng mới nhất (giảm dần)
		blogEntities.sort(Comparator.comparing(Blog::getCreateDate, Comparator.nullsLast(Comparator.reverseOrder())));

		// Chuyển đổi danh sách các đối tượng Blog sang danh sách các đối tượng BlogDTO
		List<BlogDTO> blogDTOs = blogEntities.stream().map(blogEntity -> {
			BlogDTO dto = new BlogDTO();
			BeanUtils.copyProperties(blogEntity, dto);
			dto.setUsername(blogEntity.getAccount().getUsername());
			return dto;
		}).collect(Collectors.toList());

		// Trả về danh sách blogDTOs chứa các đối tượng BlogDTO đã sao chép và sắp xếp
		// theo ngày đăng mới nhất
		return blogDTOs;
	}

	@Override
	public List<BlogDTO> findAllByStatus(Integer status) {
		// Lấy danh sách blog có status = true
		List<Blog> blogs = blogRepository.findAllByStatus(status);
		// Chuyển đổi danh sách các đối tượng Blog thành danh sách BlogDTO
		List<BlogDTO> blogDTOs = new ArrayList<>();
		for (Blog blog : blogs) {
			BlogDTO blogDTO = new BlogDTO();
			// Thực hiện sao chép các thuộc tính từ đối tượng Blog sang đối tượng BlogDTO
			blogDTO.setId(blog.getId());
			blogDTO.setTitle(blog.getTitle());
			blogDTO.setContent(blog.getContent());
			blogDTO.setImage(blog.getImage());
			blogDTO.setCreateDate(blog.getCreateDate());
			blogDTO.setUsername(blog.getAccount().getFullname());
			blogDTO.setCommentCount(blog.getCommentCount());
			// Sao chép các thuộc tính khác tùy thuộc vào yêu cầu của bạn

			blogDTOs.add(blogDTO);
		}
		// Sắp xếp danh sách BlogDTO theo thời gian mới nhất
		Collections.sort(blogDTOs, new Comparator<BlogDTO>() {
			@Override
			public int compare(BlogDTO blogDTO1, BlogDTO blogDTO2) {
				return blogDTO2.getCreateDate().compareTo(blogDTO1.getCreateDate());
			}
		});
		return blogDTOs;
	}

	@Override
	public List<BlogDTO> findTop4BlogsByCommentCountAndStatus() {
		// Lấy danh sách blog có status = true
		List<Blog> blogs = blogRepository.findTop4BlogsByCommentCountAndStatus();
		// Chuyển đổi danh sách các đối tượng Blog thành danh sách BlogDTO
		List<BlogDTO> blogDTOs = new ArrayList<>();
		for (Blog blog : blogs) {
			BlogDTO blogDTO = new BlogDTO();
			// Thực hiện sao chép các thuộc tính từ đối tượng Blog sang đối tượng BlogDTO
			blogDTO.setId(blog.getId());
			blogDTO.setTitle(blog.getTitle());
			blogDTO.setContent(blog.getContent());
			blogDTO.setImage(blog.getImage());
			blogDTO.setCreateDate(blog.getCreateDate());
			blogDTO.setUsername(blog.getAccount().getFullname());
			blogDTO.setCommentCount(blog.getCommentCount());

			blogDTOs.add(blogDTO);
		}
		return blogDTOs;
	}

	@Override
	public BlogDTO findById(Integer id) {
		Blog blog = blogRepository.findByIdAndStatus(id, 1).get();
		BlogDTO blogDTO = new BlogDTO();
		BeanUtils.copyProperties(blog, blogDTO);
		blogDTO.setUsername(blog.getAccount().getFullname());
		return blogDTO;
	}

	@Override
	public ResponseEntity<Object> createBlog(BlogDataDTO blogDataDTO) {
		Blog blog = BlogMapper.INSTANCE.mapToBlog(blogDataDTO);

		blog.setAccount(accountRepository.findByUsername(blogDataDTO.getUsername()));
		try {
			Blog createdBlog = blogRepository.save(blog);
			// Xử lý thành công, trả về trạng thái HTTP 200 OK và thông báo thành công
			return ResponseEntity.status(HttpStatus.CREATED).build();
		} catch (Exception e) {
			e.printStackTrace();
			// Xử lý lỗi, trả về trạng thái HTTP 500 Internal Server Error và thông báo lỗi
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Đã xảy ra lỗi khi tạo Blog: " + e.getMessage());
		}
	}

	@Override
	public ResponseEntity<Object> getBlogById(Long id) {
		Optional<Blog> blog = blogRepository.findById(id);
		if (blog.isPresent()) {
			// Nếu tìm thấy blog với id tương ứng, trả về dữ liệu của blog trong
			// ResponseEntity
			BlogDataDTO blogDataDTO = BlogMapper.INSTANCE.mapToBlogDataDTO(blog.get());
			blogDataDTO.setUsername(blog.get().getAccount().getUsername());
			return ResponseEntity.ok(blogDataDTO);
		} else {
			// Nếu không tìm thấy blog, trả về trạng thái HTTP 404 Not Found và thông báo
			// lỗi tương ứng
			String errorMessage = "Không tìm thấy blog ";
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body(errorMessage);
		}
	}

	@Override
	public ResponseEntity<Object> deleteBlogById(Long blogId) {
		try {
			Optional<Blog> blog = blogRepository.findById(blogId);
			if (blog.isPresent()) {
				blogRepository.delete(blog.get());
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
					.body("Đã xảy ra lỗi khi xóa blog: " + e.getMessage());
		}
	}

	@Override
	public ResponseEntity<Object> getCommentsByBlogId(Integer blogId) {
		List<Comment> comments = commentRepository.findByBlogId(blogId);
		if (comments.isEmpty()) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND); // Nếu không có bình luận, trả về HTTP 404 NOT FOUND
		} else {
			List<CommentDTO> commentDTOs = comments.stream().map(comment -> {
				CommentDTO commentDTO = new CommentDTO();
				BeanUtils.copyProperties(comment, commentDTO);
				commentDTO.setUsername(comment.getAccount().getUsername());
				commentDTO.setAvatarUser(comment.getAccount().getPhoto());
				commentDTO.setBlogId(comment.getBlog().getId());

				return commentDTO;
			}).collect(Collectors.toList());

			return new ResponseEntity<>(commentDTOs, HttpStatus.OK); // Nếu có bình luận, trả về danh sách CommentDTO và
																		// HTTP 200 OK
		}
	}

}
