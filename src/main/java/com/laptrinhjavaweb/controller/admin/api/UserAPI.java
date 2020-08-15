package com.laptrinhjavaweb.controller.admin.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.laptrinhjavaweb.model.UserModel;
import com.laptrinhjavaweb.service.IUserService;
import com.laptrinhjavaweb.utils.HttpUtil;

@WebServlet(urlPatterns = {"/api-admin-user"})

public class UserAPI extends HttpServlet{
	
	@Inject
	private IUserService userService;
	
	private static final long serialVersionUID = -915988021506484384L;
	//them
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		UserModel userModel = HttpUtil.of(request.getReader()).toModel(UserModel.class);
		userService.updateExceptStatusAndRole(userModel);
		mapper.writeValue(response.getOutputStream(), userModel.getId());
	}
	//sua
	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		UserModel userModel = HttpUtil.of(request.getReader()).toModel(UserModel.class);
		if(userModel.getType().equals("1")){
			userModel.setStatus(1);
		}
		else if(userModel.getType().equals("2")){
			userModel.setStatus(2);
		}
		else if(userModel.getType().equals("3")){
			userModel.setRoleId((long) 1);
		}
		else if(userModel.getType().equals("4")){
			userModel.setRoleId((long) 2);
		}
		userService.updateStatusOrRole(userModel);
		mapper.writeValue(response.getOutputStream(), userModel.getId());

	}
	//xoa
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}
	
}
