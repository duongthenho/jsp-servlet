package com.laptrinhjavaweb.dao;

import java.util.ArrayList;

import com.laptrinhjavaweb.model.CartModel;

public interface ICartDAO extends GenericDAO<CartModel> {
	ArrayList<CartModel> findAllByUserIdAndBillId(Long userId, Long billId);
	Boolean productExists(CartModel cartModel);
	Long save(CartModel cartModel);
	void update(CartModel cartModel);
	void updateAmount(CartModel cartModel);
	void delete(Long id);
	void updateBillId(Long billId);
}
