package com.laptrinhjavaweb.dao;

import java.io.InputStream;

import com.laptrinhjavaweb.model.QuangCao;

public interface IQuangCaoDAO extends GenericDAO<QuangCao> {
	void updateImage(String col,InputStream is);
	QuangCao findCol(String col);
}
