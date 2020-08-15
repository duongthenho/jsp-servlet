package com.laptrinhjavaweb.service;

import java.util.ArrayList;

import com.laptrinhjavaweb.model.CategoryModel;

public interface ICategoryService {
	ArrayList<CategoryModel> findAll();
	void update(CategoryModel model);
	void delete(Long id);
	Long save(CategoryModel model);
}
