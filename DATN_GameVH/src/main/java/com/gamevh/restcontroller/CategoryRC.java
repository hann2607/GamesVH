package com.gamevh.restcontroller;

import java.util.List;

import com.gamevh.handle.CustomException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.gamevh.entities.Category;
import com.gamevh.entities.Product;
import com.gamevh.service.CategoryService;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/category")
public class CategoryRC {
	@Autowired
	CategoryService categoryService;

	@GetMapping("/getAll")
	public ResponseEntity<List<Category>> getAllCategories() {
		return ResponseEntity.ok(categoryService.findAll());
	}

	@GetMapping("/getProduct/{categoryId}")
	public ResponseEntity<List<Product>> getAllProductByCategory(@PathVariable("categoryId") Integer categoryId) {
		return ResponseEntity.ok(categoryService.findById(categoryId).getProduct());
	}
	@PostMapping
	public Category addCategory(@RequestBody Category category){
		return  categoryService.addCategory(category);
	}
	@PutMapping("/{categoryId}")
	public Category updateCategory(@PathVariable("categoryId") String categoryId,@RequestBody Category category) throws CustomException {
		return  categoryService.updateCategory(categoryId, category);
	}
	@DeleteMapping("/{categoryId}")
	public void deleteCategory(@PathVariable("categoryId") String categoryId) throws CustomException {
		categoryService.deleteCategory(categoryId);
	}
}
