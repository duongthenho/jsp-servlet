package com.laptrinhjavaweb.service;

import java.util.ArrayList;

import com.laptrinhjavaweb.model.CartModel;

public interface ICartService {
	ArrayList<CartModel> findAllByUserIdAndBillId(Long userId, Long billId);
	Long save (CartModel cartModel);
	Long update(CartModel cartModel);
	void delete(long ids[]);
	ArrayList<Float> a = new ArrayList<Float>();
	void updateBillId(Long billId);
}
