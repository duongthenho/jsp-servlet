package com.laptrinhjavaweb.service;

import java.io.InputStream;
import com.laptrinhjavaweb.model.QuangCao;

public interface IQuangCaoService {
	void updateImage(String col, InputStream is);
	QuangCao findCol(String col);
}
