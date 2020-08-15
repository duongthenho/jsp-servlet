package com.laptrinhjavaweb.dao;

import java.util.ArrayList;

import com.laptrinhjavaweb.model.CategoryModel;

public interface ICategoryDAO extends GenericDAO<CategoryModel> {
	ArrayList<CategoryModel> findAll();
	void update(CategoryModel model);
	void delete(Long id);
	Long save(CategoryModel model);
}
