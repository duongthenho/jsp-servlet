package com.laptrinhjavaweb.service.impl;

import java.io.InputStream;

import javax.inject.Inject;

import com.laptrinhjavaweb.dao.IQuangCaoDAO;
import com.laptrinhjavaweb.model.QuangCao;
import com.laptrinhjavaweb.service.IQuangCaoService;

public class QuangCaoService implements IQuangCaoService {

	@Inject
	private IQuangCaoDAO quangCaoDao;
	
	@Override
	public void updateImage(String col, InputStream is) {
		quangCaoDao.updateImage(col, is);		
	}

	@Override
	public QuangCao findCol(String col) {
		
		return quangCaoDao.findCol(col);
	}

}
