package com.laptrinhjavaweb.service;

import java.util.ArrayList;

import com.laptrinhjavaweb.model.XaPhuongThiTran;

public interface IXaPhuongThiTranService {
	ArrayList<XaPhuongThiTran> findByMaQH(String maqh);
}
