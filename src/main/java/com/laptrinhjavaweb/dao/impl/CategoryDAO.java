package com.laptrinhjavaweb.dao.impl;

import java.util.ArrayList;

import com.laptrinhjavaweb.dao.ICategoryDAO;
import com.laptrinhjavaweb.mapper.CategoryMapper;
import com.laptrinhjavaweb.model.CategoryModel;

public class CategoryDAO extends AbstractDAO<CategoryModel> implements ICategoryDAO {

	
	
	@Override
	public ArrayList<CategoryModel> findAll() {
		String sql = "select * from category";
		return query(sql, new CategoryMapper());
	}

	@Override
	public void update(CategoryModel model) {
		String sql = "update category set name =?, code =? where id =?";
		update(sql, model.getName(), model.getCode(), model.getId());
	}

	@Override
	public void delete(Long id) {
		String sql = "delete from category where id = ?";
		update(sql, id);
		
	}

	@Override
	public Long save(CategoryModel model) {
		String sql = "insert into category(name, code) values(?,?)";
		
		return insert(sql, model.getName(), model.getCode());
	}
	
}
