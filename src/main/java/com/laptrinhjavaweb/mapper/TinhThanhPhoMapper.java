package com.laptrinhjavaweb.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.laptrinhjavaweb.model.TinhThanhPho;

public class TinhThanhPhoMapper implements RowMapper<TinhThanhPho> {

	@Override
	public TinhThanhPho mapRow(ResultSet rs) {
		
		try {
			TinhThanhPho ttp = new TinhThanhPho();
			ttp.setMatp(rs.getString("matp"));
			ttp.setName(rs.getString("name"));
			ttp.setType(rs.getString("type"));
			return ttp;
		} catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
		
	}

}
