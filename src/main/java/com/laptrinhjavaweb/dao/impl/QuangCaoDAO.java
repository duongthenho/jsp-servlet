package com.laptrinhjavaweb.dao.impl;

import java.io.InputStream;
import java.util.ArrayList;

import com.laptrinhjavaweb.dao.IQuangCaoDAO;
import com.laptrinhjavaweb.mapper.QuangCaoMapper;
import com.laptrinhjavaweb.model.QuangCao;

public class QuangCaoDAO extends AbstractDAO<QuangCao> implements IQuangCaoDAO{


	@Override
	public void updateImage(String col, InputStream is) {
		String sql ="update quangcao set "+col+"= ? ;";
		update(sql, is);
	}

	@Override
	public QuangCao findCol(String col) {
		String sql ="Select "+col+" from quangcao";
		ArrayList<QuangCao> list = query(sql, new QuangCaoMapper());
		
		return list.isEmpty()?null: list.get(0);
	}

}
