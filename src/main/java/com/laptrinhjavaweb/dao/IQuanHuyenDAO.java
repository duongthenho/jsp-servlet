package com.laptrinhjavaweb.dao;

import java.util.ArrayList;

import com.laptrinhjavaweb.model.QuanHuyen;

public interface IQuanHuyenDAO extends GenericDAO<QuanHuyen> {
	ArrayList<QuanHuyen> findAllbyMaTP(String matp);
}
