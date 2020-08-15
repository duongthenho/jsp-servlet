package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;

import javax.inject.Inject;

import com.laptrinhjavaweb.dao.IUserDAO;
import com.laptrinhjavaweb.model.UserModel;
import com.laptrinhjavaweb.paging.Pageble;
import com.laptrinhjavaweb.service.IUserService;

public class UserService implements IUserService {
	@Inject
	IUserDAO userDAO;

	@Override
	public UserModel findByUserNameAndPasswordAndStatus(String userName, String password, Integer status) {
		return userDAO.findByUserNameAndPasswordAndStatus(userName, password, status);
	}

	@Override
	public Long save(UserModel model) {
		return userDAO.save(model);
	}

	@Override
	public String findUserNumberPhoneAndEmail(UserModel model) {
		return userDAO.findUserNumberPhoneAndEmail(model);
	}

	@Override
	public ArrayList<UserModel> findAll(Pageble pageble) {
		return userDAO.findAll(pageble);
	}

	@Override
	public int getTotalItem() {
		return userDAO.getTotalItem();
	}

	@Override
	public UserModel findOne(Long id) {
		return userDAO.findOne(id);
	}

	@Override
	public void updateStatusOrRole(UserModel userModel) {
		if(userModel.getIds() != null) {
			for(long id:userModel.getIds()) {
				userModel.setId(id);
				userDAO.updateStatusOrRole(userModel);
			}
		}
	}

	@Override
	public void updateExceptStatusAndRole(UserModel userModel) {
		userDAO.updateExceptStatusAndRole(userModel);	
	}

}
