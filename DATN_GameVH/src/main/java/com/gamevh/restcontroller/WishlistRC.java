//package com.gamevh.restcontroller;
//
//import java.util.List;
//
//
//import org.springframework.web.bind.annotation.CrossOrigin;
//
//import org.springframework.http.ResponseEntity;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//
//import org.springframework.web.bind.annotation.RequestBody;
//
//import com.gamevh.reponsitory.FavoriteRepository;
//
//import com.gamevh.entities.Favorite;
//
//
//import com.gamevh.service.FavoriteService;
//import com.gamevh.service.ProductService;
//
//
//
//
//@CrossOrigin("*")
//@RestController
//@RequestMapping("/api/Wishlist")
//public class WishlistRC {
//	@Autowired
//	FavoriteService fService;
//
//	@Autowired
//	FavoriteRepository favoriteDAO;
//
//	@Autowired
//	ProductService pService;
//
//	@GetMapping("getAll")
//	public List<Favorite> getAllFavorites() {
//		return fService.findAll();
//	}
//
//	@GetMapping("/getAll/{accountId}")
//	public List<Favorite> getAllFavorites(@PathVariable("accountId") Integer accountId) {
//		return fService.findAllByAccountId(accountId);
//	}
//
//
//	@PostMapping("/addWishlist")
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
//}
