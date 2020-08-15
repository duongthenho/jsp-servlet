package com.laptrinhjavaweb.service;

import java.util.ArrayList;

import com.laptrinhjavaweb.model.BillModel;
import com.laptrinhjavaweb.paging.Pageble;

public interface IBillService {
	Long save (BillModel billModel);
	public ArrayList<BillModel> findAllByUserIdAndStatus(Long userId);
	BillModel findOne(Long billId);
	void delete(long ids[]);
	ArrayList<BillModel> findAllByStatus(Pageble pageble, String status);
	int getTotalItemByStatus(String status);
	void updateStatus(String status, long[] ids);
}
