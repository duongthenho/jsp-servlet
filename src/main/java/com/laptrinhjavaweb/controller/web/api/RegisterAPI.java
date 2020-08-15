package com.laptrinhjavaweb.controller.web.api;

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

@WebServlet(urlPatterns = {"/api-register"})
public class RegisterAPI extends HttpServlet {

	/**
	 * 
	 */
	@Inject
	private IUserService userService;
	
	private static final long serialVersionUID = -2521629074601844942L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		// "of" doc JSON tu client roi chuyen thanh ProductModel  
		UserModel userModel = HttpUtil.of(request.getReader()).toModel(UserModel.class);
		
		String message = userService.findUserNumberPhoneAndEmail(userModel);
		if(message == "OK") {
			Long userId = userService.save(userModel);
			message ="Bạn đã đăng kí thành công";
			System.out.println(userId);
		}//roi lai xuat lai JSON

		mapper.writeValue(response.getOutputStream(), message);
	}
}
