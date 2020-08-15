package com.laptrinhjavaweb.dao;

import java.util.ArrayList;

import com.laptrinhjavaweb.model.BillModel;
import com.laptrinhjavaweb.paging.Pageble;

public interface IBillDAO extends GenericDAO<BillModel>  {
	Long save(BillModel billModel);
	ArrayList<BillModel> findAllByUserIdAndStatus(Long userId);
	BillModel findOne(Long billId);
	void delete(Long id);
	ArrayList<BillModel> findAllByStatus(Pageble pageble, String status);
	int getTotalItemByStatus(String status);
	void updateStatus(String status, Long id);
}
