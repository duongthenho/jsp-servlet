package com.laptrinhjavaweb.dao.impl;

import java.util.ArrayList;

import com.laptrinhjavaweb.dao.IUserDAO;
import com.laptrinhjavaweb.mapper.UserMapper;
import com.laptrinhjavaweb.model.UserModel;
import com.laptrinhjavaweb.paging.Pageble;

public class UserDAO extends AbstractDAO<UserModel> implements IUserDAO {

	@Override
	public UserModel findByUserNameAndPasswordAndStatus(String userName, String password, Integer status) {
		StringBuilder sql = new StringBuilder("select * from user as u ");
		sql.append(" inner join role as r on r.id = u.roleid");
		sql.append(" where username = ? and password =? and status=?");
		ArrayList<UserModel> users = query(sql.toString(), new UserMapper(),userName,password,status);
		return users.isEmpty() ? null : users.get(0);
	}

	@Override
	public Long save(UserModel model) {
		StringBuilder sql = new StringBuilder("insert into user(username, password, fullname,numberphone,email,status,roleid)");
		sql.append(" values(?,?,?,?,?,?,?)");
		return insert(sql.toString(), model.getUserName(),model.getPassword(),model.getFullName(),
				model.getNumberPhone(),model.getEmail(),1,2L);
	}

	@Override
	public String findUserNumberPhoneAndEmail(UserModel model) {
		String sql1 ="select * from user where username= ?";
		ArrayList<UserModel> users1 = query(sql1, new UserMapper(), model.getUserName());
		if(users1.isEmpty()==false) {
			return "Tên tài khoản '"+model.getUserName()+"' đã tồn tại";
		}
		String sql2 ="select * from user where numberphone= ?";
		ArrayList<UserModel> users2 = query(sql2, new UserMapper(), model.getNumberPhone());
		if(users2.isEmpty()==false) {
			return "Số điện thoại '"+model.getNumberPhone()+"' đã tồn tại";
		}
		String sql3 ="select * from user where email= ?";
		ArrayList<UserModel> users3 = query(sql3, new UserMapper(), model.getEmail());
		if(users3.isEmpty()==false) {
			return "Địa chỉ email '"+model.getEmail()+"' đã tồn tại";
		}
		return "OK";
	}

	@Override
	public ArrayList<UserModel> findAll(Pageble pageble) {
		StringBuilder sql = new StringBuilder("select * from user as u inner join role as r on r.id = u.roleid");
		if(pageble.getSorter() != null) {
			sql.append(" order by "+pageble.getSorter().getSortName()+ " " + pageble.getSorter().getSortBy());
		}
		if(pageble.getOffset() != null && pageble.getLimit() != null) {
			sql.append(" limit "+pageble.getOffset() +", "+pageble.getLimit());
		}
		return query(sql.toString(), new UserMapper());
	}

	@Override
	public int getTotalItem() {
		String sql = "select count(*) from user ";
		return count(sql);
	}

	@Override
	public UserModel findOne(Long id) {
		String sql = "select * from user as u inner join role as r on r.id = u.roleid where u.id = ? ";
		ArrayList<UserModel> model = query(sql, new UserMapper(), id);
		return model.isEmpty()?null:model.get(0);
	}

	@Override
	public void updateExceptStatusAndRole(UserModel userModel) {
		StringBuilder sql = new StringBuilder("update user set username=?, password=?, fullname=?, ");
		sql.append("numberphone=?, email=?  where id = ?");
		update(sql.toString(),userModel.getUserName(),userModel.getPassword(), userModel.getFullName(),
				userModel.getNumberPhone(), userModel.getEmail(), userModel.getId());
		
	}

	@Override
	public void updateStatusOrRole(UserModel userModel) {
		StringBuilder sql = new StringBuilder("update user set ");
		if(userModel.getStatus() != 0) {
			sql.append(" status =  " + userModel.getStatus());
		}
		if(userModel.getRoleId() != null) {
			sql.append(" roleid =  "+ userModel.getRoleId());
		}
		sql.append(" where id=?");
		update(sql.toString(), userModel.getId());
	}
}
