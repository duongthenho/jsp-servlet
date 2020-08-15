package com.laptrinhjavaweb.dao.impl;

import java.util.ArrayList;

import com.laptrinhjavaweb.dao.IXaPhuongThiTranDAO;
import com.laptrinhjavaweb.mapper.XaPhuongThiTranMapper;
import com.laptrinhjavaweb.model.XaPhuongThiTran;

public class XaPhuongThiTranDAO extends AbstractDAO<XaPhuongThiTran> implements IXaPhuongThiTranDAO {

	@Override
	public ArrayList<XaPhuongThiTran> findAllByMaQH(String maqh) {
		String sql = "Select * from xaphuongthitran where maqh= ?";
		return query(sql, new XaPhuongThiTranMapper(), maqh);
	}

	

}
