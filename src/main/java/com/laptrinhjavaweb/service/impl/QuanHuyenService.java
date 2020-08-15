package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;

import javax.inject.Inject;

import com.laptrinhjavaweb.dao.IQuanHuyenDAO;
import com.laptrinhjavaweb.model.QuanHuyen;
import com.laptrinhjavaweb.service.IQuanHuyenService;

public class QuanHuyenService implements IQuanHuyenService{
	
	@Inject
	private IQuanHuyenDAO quanHuyenDAO;

	@Override
	public ArrayList<QuanHuyen> findAllByMaTP(String matp) {
		return quanHuyenDAO.findAllbyMaTP(matp);
	}

}
