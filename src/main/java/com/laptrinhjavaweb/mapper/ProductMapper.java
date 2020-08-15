package com.laptrinhjavaweb.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.laptrinhjavaweb.model.ProductModel;

public class ProductMapper implements RowMapper<ProductModel> {

	@Override
	public ProductModel mapRow(ResultSet resultSet) {
		
		try {
			ProductModel product = new ProductModel();
			product.setId(resultSet.getLong("id"));
			product.setImage(resultSet.getBlob("image"));
			product.setName(resultSet.getString("name"));
			product.setPrice(resultSet.getDouble("price"));
			product.setCode(resultSet.getString("code"));
			product.setCategoryId(resultSet.getLong("categoryid"));
			return product;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

}
