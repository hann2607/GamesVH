package com.gamevh.service.impl;

import java.util.List;

import com.gamevh.handle.CustomException;
import com.gamevh.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.gamevh.entities.Category;
import com.gamevh.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	CategoryRepository categoryDAO;

	@Override
	public List<Category> findAll() {
		return categoryDAO.findAll();
	}

	@Override
	public Category findById(Integer id) {
		return categoryDAO.findById(id).get();
	}

	@Override
	public Category addCategory(Category category){
		return categoryDAO.save(category);
	}

	@Override
	public Category updateCategory(String categoryId, Category newCategory) throws CustomException {
		Category category = categoryDAO.findByCategoryId(categoryId)
				.orElseThrow(() -> new CustomException
						("Không tìm thấy danh mục sản phẩm với id " + categoryId, HttpStatus.NOT_FOUND));
		category.setCategoryId(newCategory.getCategoryId());
		category.setName(newCategory.getName());
		category.setType(newCategory.getType());
		return categoryDAO.save(category);
	}

	@Override
	public void deleteCategory(String categoryId) throws CustomException {
		Category category = categoryDAO.findByCategoryId(categoryId)
				.orElseThrow(() -> new CustomException
						("Không tìm thấy danh mục sản phẩm với id " + categoryId, HttpStatus.NOT_FOUND));
		categoryDAO.delete(category);
	}

}
