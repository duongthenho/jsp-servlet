package com.laptrinhjavaweb.service;

import java.util.ArrayList;

import com.laptrinhjavaweb.model.UserModel;
import com.laptrinhjavaweb.paging.Pageble;

public interface IUserService {
	UserModel findByUserNameAndPasswordAndStatus(String userName, String password, Integer status);
	Long save(UserModel model);
	String findUserNumberPhoneAndEmail(UserModel model);
	ArrayList<UserModel> findAll(Pageble pageble);
	int getTotalItem();
	UserModel findOne(Long id);
	void updateStatusOrRole (UserModel userModel);
	void updateExceptStatusAndRole (UserModel userModel);
}
