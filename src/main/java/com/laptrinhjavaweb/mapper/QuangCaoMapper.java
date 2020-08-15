package com.laptrinhjavaweb.mapper;

import java.sql.ResultSet;

import com.laptrinhjavaweb.model.QuangCao;

public class QuangCaoMapper implements RowMapper<QuangCao>{

	@Override
	public QuangCao mapRow(ResultSet rs) {
			QuangCao qc= new QuangCao();
			try {
				qc.setImage1(rs.getBlob("image1"));
			} catch (Exception e) {
				
			}
			try {
				qc.setImage2(rs.getBlob("image2"));
			} catch (Exception e) {
				
			}
			try {
				qc.setImage3(rs.getBlob("image3"));
			} catch (Exception e) {
				
			}
			return qc;
	}
	

}
