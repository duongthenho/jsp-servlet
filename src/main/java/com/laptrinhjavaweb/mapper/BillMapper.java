package com.laptrinhjavaweb.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.laptrinhjavaweb.model.BillModel;

public class BillMapper implements RowMapper<BillModel> {

	@Override
	public BillModel mapRow(ResultSet resultSet) {
		try {
			BillModel bill = new BillModel();
			bill.setId(resultSet.getLong("id"));
			bill.setFullName(resultSet.getString("fullname"));
			bill.setNumberPhone(resultSet.getString("numberphone"));
			bill.setEmail(resultSet.getString("email"));
			bill.setAddress(resultSet.getString("address"));
			bill.setTotalMoney(resultSet.getString("totalmoney"));
			bill.setStatus(resultSet.getString("status"));
			bill.setUserId(resultSet.getLong("user_id"));
			return bill;
		} catch (SQLException e) {
			return null;
		}
	}
}
