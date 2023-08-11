package com.gamevh.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.gamevh.entities.Blog;

public interface BlogRepository extends JpaRepository<Blog, Integer> {

	@Query("SELECT p FROM Blog p WHERE p.title LIKE ?1")
	Blog getBlogbyTittleSearch(String titleSearch);	

	@Query(value = "SELECT TOP(10) b FROM Blog b INNER JOIN FETCH b.comment c GROUP BY b ORDER BY COUNT(c) DESC", nativeQuery = true)
	List<Blog> getListHighestComments();

	List<Blog> findAllByStatus(Integer status);

	@Query(value = "SELECT b.*, COUNT(c.Id) AS commentCount " + "FROM blog b " + "JOIN comment c ON b.Id = c.blog_id "
			+ "WHERE b.Status = true " + "GROUP BY b.Id " + "ORDER BY commentCount DESC "
			+ "LIMIT 4", nativeQuery = true)
	List<Blog> findTop4BlogsByCommentCountAndStatus();

    Optional<Blog> findByIdAndStatus(Integer id, Integer status);

	Optional<Blog> findById(Long id);

}
