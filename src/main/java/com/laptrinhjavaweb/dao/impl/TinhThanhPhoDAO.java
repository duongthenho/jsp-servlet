package com.laptrinhjavaweb.dao.impl;

import java.util.ArrayList;

import com.laptrinhjavaweb.dao.ITinhThanhPhoDAO;
import com.laptrinhjavaweb.mapper.TinhThanhPhoMapper;
import com.laptrinhjavaweb.model.TinhThanhPho;

public class TinhThanhPhoDAO extends AbstractDAO<TinhThanhPho> implements ITinhThanhPhoDAO {

	@Override
	public ArrayList<TinhThanhPho> findAll() {
		String sql ="Select * from tinhthanhpho; ";
		return query(sql, new TinhThanhPhoMapper());
	}
}
