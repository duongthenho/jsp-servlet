package com.laptrinhjavaweb.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.laptrinhjavaweb.model.CartModel;

public class CartMapper implements RowMapper<CartModel> {

	@Override
	public CartModel mapRow(ResultSet resultSet) {
		try {
			CartModel cart = new CartModel();
			cart.setId(resultSet.getLong("id"));
			cart.setProductId(resultSet.getLong("product_id"));
			cart.setImage(resultSet.getString("image"));
			cart.setName(resultSet.getString("name"));
			cart.setCode(resultSet.getString("code"));
			cart.setPrice(resultSet.getDouble("price"));
			cart.setAmount(resultSet.getInt("amount"));
			return cart;
		} catch (SQLException e) {
			return null;
		}
	}
}
