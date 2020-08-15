package com.laptrinhjavaweb.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.laptrinhjavaweb.model.QuanHuyen;

public class QuanHuyenMapper implements RowMapper<QuanHuyen> {

	@Override
	public QuanHuyen mapRow(ResultSet rs) {
		
		try {
			QuanHuyen qh = new QuanHuyen();
			qh.setMatp(rs.getString("matp"));
			qh.setName(rs.getString("name"));
			qh.setType(rs.getString("type"));
			qh.setMaqh(rs.getString("maqh"));
			return qh;
		} catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
		
	}

}
