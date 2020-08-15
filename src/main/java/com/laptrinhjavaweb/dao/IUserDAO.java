package com.laptrinhjavaweb.dao;

import java.util.ArrayList;

import com.laptrinhjavaweb.model.UserModel;
import com.laptrinhjavaweb.paging.Pageble;

public interface IUserDAO extends GenericDAO<UserModel> {
	UserModel findByUserNameAndPasswordAndStatus(String userName, String password, Integer status);
	Long save (UserModel model);
	String findUserNumberPhoneAndEmail(UserModel model);
	ArrayList<UserModel> findAll(Pageble pageble);
	int getTotalItem();
	UserModel findOne(Long id);
	void updateExceptStatusAndRole(UserModel userModel);
	void updateStatusOrRole(UserModel userModel);
}
