package com.laptrinhjavaweb.service;

import java.util.ArrayList;

import com.laptrinhjavaweb.model.QuanHuyen;

public interface IQuanHuyenService {
	ArrayList<QuanHuyen> findAllByMaTP(String matp);
}
