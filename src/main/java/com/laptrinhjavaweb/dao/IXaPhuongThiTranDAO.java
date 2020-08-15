package com.laptrinhjavaweb.dao;

import java.util.ArrayList;

import com.laptrinhjavaweb.model.XaPhuongThiTran;

public interface IXaPhuongThiTranDAO extends GenericDAO<XaPhuongThiTran> {
	ArrayList<XaPhuongThiTran> findAllByMaQH(String maqh);
}
