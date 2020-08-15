package com.laptrinhjavaweb.dao.impl;

import java.util.ArrayList;

import com.laptrinhjavaweb.dao.IBillDAO;
import com.laptrinhjavaweb.mapper.BillMapper;
import com.laptrinhjavaweb.model.BillModel;
import com.laptrinhjavaweb.paging.Pageble;

public class BillDAO extends AbstractDAO<BillModel> implements IBillDAO {

	@Override
	public Long save(BillModel billModel) {
		String sql="insert into bill(fullname,numberphone,email,address,totalmoney,status,user_id) values(?,?,?,?,?,?,?);";
		return insert(sql, billModel.getFullName(),billModel.getNumberPhone(),billModel.getEmail(),
				billModel.getAddress(),billModel.getTotalMoney(),"Chờ xác nhận", billModel.getUserId());
	}

	@Override
	public ArrayList<BillModel> findAllByUserIdAndStatus(Long userId) {
		String sql = "select * from bill where user_id = ?;";
		return query(sql, new BillMapper(), userId);
	}

	@Override
	public BillModel findOne(Long billId) {
		String sql = "Select * from bill where id = ?";
		ArrayList<BillModel> listBill = query(sql, new BillMapper(), billId);
		return listBill.isEmpty()?null:listBill.get(0);
	}

	@Override
	public void delete(Long id) {
		String sql1 ="delete from cart where BillId = ?;";
		update(sql1,id);
		String sql ="delete from bill where id = ?;";
		update(sql,id);
	}
	@Override
	public ArrayList<BillModel> findAllByStatus(Pageble pageble, String status) {
		StringBuilder sql = new StringBuilder("select * from bill where id !=0 and status=?");
		
		if(pageble.getSorter() != null) {
			sql.append(" order by "+pageble.getSorter().getSortName()+" "+pageble.getSorter().getSortBy());
		}
		if(pageble.getOffset() != null && pageble.getLimit() != null) {
			sql.append(" limit "+pageble.getOffset()+", "+ pageble.getLimit());
		}
		return query(sql.toString(), new BillMapper(), status);
	}

	@Override
	public int getTotalItemByStatus(String status) {
		String sql = "select count(*) from bill where status =?;";
		return count(sql, status);
	}

	@Override
	public void updateStatus(String status,Long id) {
		String sql = "update bill set status = ? where id=?;";
		update(sql,status, id);
		
	}

}
