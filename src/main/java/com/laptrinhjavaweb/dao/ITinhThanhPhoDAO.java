package com.laptrinhjavaweb.dao;

import java.util.ArrayList;

import com.laptrinhjavaweb.model.TinhThanhPho;

public interface ITinhThanhPhoDAO extends GenericDAO<TinhThanhPho> {
	ArrayList<TinhThanhPho> findAll();
}
