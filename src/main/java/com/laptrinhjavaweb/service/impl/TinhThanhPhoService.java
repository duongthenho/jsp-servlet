package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;

import javax.inject.Inject;

import com.laptrinhjavaweb.dao.ITinhThanhPhoDAO;
import com.laptrinhjavaweb.model.TinhThanhPho;
import com.laptrinhjavaweb.service.ITinhThanhPhoService;

public class TinhThanhPhoService implements ITinhThanhPhoService {
	@Inject
	private ITinhThanhPhoDAO tinhThanhPhoDAO;

	@Override
	public ArrayList<TinhThanhPho> findAll() {
		return tinhThanhPhoDAO.findAll();
	}
	
	
}
