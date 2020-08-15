package com.laptrinhjavaweb.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.laptrinhjavaweb.model.XaPhuongThiTran;

public class XaPhuongThiTranMapper implements RowMapper<XaPhuongThiTran> {

	@Override
	public XaPhuongThiTran mapRow(ResultSet rs) {
		try {
			XaPhuongThiTran xptt = new XaPhuongThiTran();
			xptt.setXaid(rs.getString("xaid"));
			xptt.setName(rs.getString("name"));
			xptt.setType(rs.getString("type"));
			xptt.setMaqh(rs.getString("maqh"));
			return xptt;
		}
		catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

}
