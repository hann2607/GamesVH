package com.gamevh.restcontroller;

import java.util.List;
import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gamevh.entities.Favorite;
import com.gamevh.repository.FavoriteRepository;
import com.gamevh.service.FavoriteService;
import com.gamevh.service.ProductService;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/favorite")
public class FavoriteRC {
	@Autowired
	FavoriteService fService;

	@Autowired
	FavoriteRepository favoriteDAO;

	@Autowired
	ProductService pService;

	@GetMapping("getAll")
	public List<Favorite> getAllFavorites() {
		return fService.findAll();
	}

	@GetMapping("/getAll/{accountId}")
	public List<Favorite> getAllFavorites(@PathVariable("accountId") Integer accountId) {
		return fService.findAllByAccountId(accountId);
	}


//	@PostMapping("/addWishlist/")
//	public ResponseEntity<Favorite> addWishlist(@RequestBody Favorite favorite) {
//	    if (favorite.getAccount() != null && favorite.getProduct() != null) {
//	        List<Favorite> existingFavorites = fService.findByProductIdAndAccountId(favorite.getAccount().getId(), favorite.getProduct().getId());
//	        if (existingFavorites.isEmpty()) {
//	            // Chưa có sự thích sản phẩm từ tài khoản, lưu favorite mới với trạng thái true
//	            favorite.setStatus(true);
//	            favoriteDAO.save(favorite);
//	        } else {
//	            Favorite existingFavorite = existingFavorites.get(0);
//	            if (existingFavorite.getStatus()) {
//	                // Sản phẩm đã được tài khoản thích, thay đổi trạng thái thành false
//	                existingFavorite.setStatus(false);
//	            } else {
//	                // Sản phẩm đã được tài khoản thích và trạng thái là false, thay đổi trạng thái thành true
//	                existingFavorite.setStatus(true);
//	            }
//	            favoriteDAO.save(existingFavorite);
//	        }
//	    }
//
//	    return ResponseEntity.ok(favorite);
//	}
//	
//	@PutMapping("/updateWishlist/")
//	public ResponseEntity<Favorite> updateFavorite(@RequestBody Favorite favorite) {
//	    if (favorite.getAccount() != null && favorite.getProduct() != null) {
//	        List<Favorite> existingFavorites = fService.findByProductIdAndAccountId(favorite.getAccount().getId(), favorite.getProduct().getId());
//	        if (!existingFavorites.isEmpty()) {
//	            Favorite existingFavorite = existingFavorites.get(0);
//	            existingFavorite.setStatus(favorite.getStatus());
//	            favoriteDAO.save(existingFavorite);
//	            return ResponseEntity.ok(existingFavorite);
//	        }
//	    }
//
//	    return ResponseEntity.notFound().build();
//	}
	
	@PostMapping("/addWishlist/")
	public ResponseEntity<Favorite> addWishlist(@RequestBody Favorite favorite) {
	    if (favorite.getAccount() != null && favorite.getProduct() != null) {
	        List<Favorite> existingFavorites = fService.findByProductIdAndAccountId(favorite.getAccount().getId(), favorite.getProduct().getId());
	        if (existingFavorites.isEmpty()) {
	            // Chưa có sự thích sản phẩm từ tài khoản, lưu favorite mới với trạng thái true và thời gian yêu thích
	            favorite.setStatus(true);
	            favorite.setLikeDate(LocalDate.now()); // Cung cấp thời gian hiện tại
	            favoriteDAO.save(favorite);
	        } else {
	            Favorite existingFavorite = existingFavorites.get(0);
	            existingFavorite.setStatus(!existingFavorite.getStatus()); // Đảo ngược trạng thái yêu thích
	            favoriteDAO.save(existingFavorite);
	        }
	    }

	    return ResponseEntity.ok(favorite);
	}


	@PutMapping("/updateWishlist")
	public ResponseEntity<Favorite> updateFavorite(@RequestBody Favorite favorite) {
	    if (favorite.getAccount() != null && favorite.getProduct() != null) {
	        List<Favorite> existingFavorites = fService.findByProductIdAndAccountId(favorite.getAccount().getId(), favorite.getProduct().getId());
	        if (!existingFavorites.isEmpty()) {
	            Favorite existingFavorite = existingFavorites.get(0);
	            existingFavorite.setStatus(!existingFavorite.getStatus()); // Đảo ngược trạng thái yêu thích
	            favoriteDAO.save(existingFavorite);
	            return ResponseEntity.ok(existingFavorite);
	        }
	    }

	    return ResponseEntity.notFound().build();
	}
	
	@DeleteMapping("/removeWishlist/{productId}")
	public ResponseEntity<?> removeWishlist(@PathVariable Integer productId) {
	    // Truy vấn cơ sở dữ liệu để tìm sản phẩm yêu thích có productId tương ứng
	    List<Favorite> existingFavorites = fService.findByProductId(productId);

	    if (!existingFavorites.isEmpty()) {
	        // Nếu sản phẩm yêu thích tồn tại, thực hiện xoá nó khỏi cơ sở dữ liệu
	        Favorite existingFavorite = existingFavorites.get(0);
	        favoriteDAO.delete(existingFavorite);

	        // Trả về phản hồi thành công
	        return ResponseEntity.ok().build();
	    } else {
	        // Nếu sản phẩm yêu thích không tồn tại, trả về phản hồi lỗi (hoặc có thể trả về 404 Not Found)
	        return ResponseEntity.notFound().build();
	    }
	}



}
