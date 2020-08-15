package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;

import javax.inject.Inject;

import com.laptrinhjavaweb.dao.IBillDAO;
import com.laptrinhjavaweb.model.BillModel;
import com.laptrinhjavaweb.paging.Pageble;
import com.laptrinhjavaweb.service.IBillService;

public class BillService implements IBillService {

	@Inject
	private IBillDAO billAO;
	
	@Override
	public Long save(BillModel billModel) {
		return billAO.save(billModel);
	}

	@Override
	public ArrayList<BillModel> findAllByUserIdAndStatus(Long userId) {
		return billAO.findAllByUserIdAndStatus(userId);
	}

	@Override
	public BillModel findOne(Long billId) {
		return billAO.findOne(billId);
	}
	@Override
	public void delete(long[] ids) {
		for(long id:ids) {
			billAO.delete(id);
		}
	}

	@Override
	public ArrayList<BillModel> findAllByStatus(Pageble pageble, String status) {
		return billAO.findAllByStatus(pageble, status);
	}

	@Override
	public int getTotalItemByStatus(String status) {
		return billAO.getTotalItemByStatus(status);
	}

	@Override
	public void updateStatus(String status, long[] ids) {
		for(long id: ids) {
			billAO.updateStatus(status, id);
		}
		
	}

}
