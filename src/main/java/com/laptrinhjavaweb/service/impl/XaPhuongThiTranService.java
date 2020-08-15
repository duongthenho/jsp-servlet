package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;

import javax.inject.Inject;

import com.laptrinhjavaweb.dao.IXaPhuongThiTranDAO;
import com.laptrinhjavaweb.model.XaPhuongThiTran;
import com.laptrinhjavaweb.service.IXaPhuongThiTranService;

public class XaPhuongThiTranService implements IXaPhuongThiTranService {

	@Inject
	private IXaPhuongThiTranDAO XaPhuongThiTranDAO;
	
	@Override
	public ArrayList<XaPhuongThiTran> findByMaQH(String maqh) {
		return XaPhuongThiTranDAO.findAllByMaQH(maqh);
	}

}
