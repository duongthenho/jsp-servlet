package com.laptrinhjavaweb.dao.impl;

import java.util.ArrayList;

import com.laptrinhjavaweb.dao.ICartDAO;
import com.laptrinhjavaweb.mapper.CartMapper;
import com.laptrinhjavaweb.model.CartModel;

public class CartDAO extends AbstractDAO<CartModel> implements ICartDAO {

	@Override
	public ArrayList<CartModel> findAllByUserIdAndBillId(Long userId, Long billId) {
		StringBuilder sql = new StringBuilder("select c.id, product_id, image, name, code, price, amount");
		sql.append(" from cart as c, product as p where c.product_id= p.id and billId=?");
		if(userId != null) {
			sql.append(" and user_id = ?");
			return query(sql.toString(), new CartMapper(), userId,billId);
		}
		return query(sql.toString(), new CartMapper(), billId);
	}

	@Override
	public Boolean productExists(CartModel cartModel) {
		String sql ="select * from cart where user_id=? and product_id=? and billId = ?;";
		ArrayList<CartModel> cart = query(sql, new CartMapper(), cartModel.getUserId(),cartModel.getProductId(),(long)0);
		return cart.isEmpty() ? false : true;
	}

	@Override
	public Long save(CartModel cartModel) {
			String sql="insert into cart(user_id,product_id,amount,billId) values(?,?,?,?);";
			return insert(sql, cartModel.getUserId(),cartModel.getProductId(),cartModel.getAmount(),(long)0);
	}
	@Override
	public void update(CartModel cartModel) {
		String sql ="update cart set amount = (amount +?) where user_id =? and product_id =? and billId=?;";
		update(sql,cartModel.getAmount(),cartModel.getUserId(),cartModel.getProductId(),(long)0);
		
	}

	@Override
	public void updateAmount(CartModel cartModel) {
		String sql ="update cart set amount = ? where user_id =? and product_id =? and billId=?;";
		update(sql,cartModel.getAmount(),cartModel.getUserId(),cartModel.getProductId(),(long)0);
	}

	@Override
	public void delete(Long id) {
		String sql ="delete from cart where id = ?;";
		update(sql,id);
	}

	@Override
	public void updateBillId(Long billId) {
		String sql ="update cart set billId = ? where billId=0;";
		update(sql,billId);
	}

	

	
}
