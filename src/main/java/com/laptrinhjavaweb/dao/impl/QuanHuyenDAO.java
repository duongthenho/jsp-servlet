package com.laptrinhjavaweb.dao.impl;

import java.util.ArrayList;

import com.laptrinhjavaweb.dao.IQuanHuyenDAO;
import com.laptrinhjavaweb.mapper.QuanHuyenMapper;
import com.laptrinhjavaweb.model.QuanHuyen;

public class QuanHuyenDAO extends AbstractDAO<QuanHuyen> implements IQuanHuyenDAO {

	@Override
	public ArrayList<QuanHuyen> findAllbyMaTP(String matp) {
		String sql = "select * from quanhuyen where matp =?;";
		return query(sql, new QuanHuyenMapper(),matp);
	}

}
