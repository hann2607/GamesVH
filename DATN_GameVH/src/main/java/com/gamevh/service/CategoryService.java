package com.gamevh.service;

import java.util.List;

import com.gamevh.entities.Category;
import com.gamevh.handle.CustomException;

public interface CategoryService {
	List<Category> findAll();

	Category findById(Integer id);

	Category addCategory(Category category);
	Category updateCategory(String categoryId, Category newCategory) throws CustomException;
	void deleteCategory(String categoryId) throws CustomException;
}
