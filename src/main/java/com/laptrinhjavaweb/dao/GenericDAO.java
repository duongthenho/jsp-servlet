package com.laptrinhjavaweb.dao;

import java.util.ArrayList;

import com.laptrinhjavaweb.mapper.RowMapper;

public interface GenericDAO<T> {
	<T> ArrayList<T> query(String sql, RowMapper<T> rowMapper, Object... parameters);
	void update (String sql, Object... parameters);
	Long insert(String sql, Object... parameters);
	int count(String sql, Object... parameters );
	
}
