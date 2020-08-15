package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;

import javax.inject.Inject;

import com.laptrinhjavaweb.dao.ICartDAO;
import com.laptrinhjavaweb.model.CartModel;
import com.laptrinhjavaweb.service.ICartService;

public class CartService implements ICartService {
	
	@Inject
	private ICartDAO cartDAO;
	
	@Override
	public ArrayList<CartModel> findAllByUserIdAndBillId(Long userId, Long billId) {
		return cartDAO.findAllByUserIdAndBillId(userId,billId);
	}

	@Override
	public Long save(CartModel cartModel) {
		if(!cartDAO.productExists(cartModel)) {
			return cartDAO.save(cartModel);
		}
		cartDAO.update(cartModel);
		return null;
	}

	@Override
	public Long update(CartModel cartModel) {
		cartDAO.updateAmount(cartModel);
		return null;
	}

	@Override
	public void delete(long[] ids) {
		for(long id:ids) {
			cartDAO.delete(id);
		}
	}

	@Override
	public void updateBillId(Long billId) {
		cartDAO.updateBillId(billId);
		
	}

}
