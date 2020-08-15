package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;

import javax.inject.Inject;

import com.laptrinhjavaweb.dao.ICategoryDAO;
import com.laptrinhjavaweb.model.CategoryModel;
import com.laptrinhjavaweb.service.ICategoryService;


public class CategoryService implements ICategoryService{

	@Inject
	private ICategoryDAO categoryDAO;
	
	@Override
	public ArrayList<CategoryModel> findAll() {
		return categoryDAO.findAll() ;
	}

	@Override
	public void update(CategoryModel model) {
		categoryDAO.update(model);	
	}

	@Override
	public void delete(Long id) {
		categoryDAO.delete(id);
	}

	@Override
	public Long save(CategoryModel model) {
		
		return categoryDAO.save(model);
	}
	
}
