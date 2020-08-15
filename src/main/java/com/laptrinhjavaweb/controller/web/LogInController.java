package com.laptrinhjavaweb.controller.web;

import java.io.IOException;
import java.util.ResourceBundle;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.laptrinhjavaweb.model.UserModel;
import com.laptrinhjavaweb.service.IUserService;
import com.laptrinhjavaweb.utils.FormUtitl;
import com.laptrinhjavaweb.utils.SessionUtil;


@WebServlet(urlPatterns = {"/dang-nhap","/thoat"})
public class LogInController extends HttpServlet{
	
	@Inject
	private IUserService userService;

	ResourceBundle resourceBundle = ResourceBundle.getBundle("message");
	private static final long serialVersionUID = 2686801510274002166L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action != null && action.equals("login")) {
			String message = request.getParameter("message");
			String alert = request.getParameter("alert");	
			if(message != null && alert != null) {
				request.setAttribute("message", resourceBundle.getString(message));
				request.setAttribute("alert",alert);
				
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("/views/login.jsp");
			rd.forward(request, response);
		}
		else if(action != null && action.equals("logout")) {
			SessionUtil.getInstance().removeValue(request, "USERMODEL");
			response.sendRedirect(request.getContextPath()+("/dang-nhap?action=login"));
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action != null && action.equals("login")) {
			UserModel model = FormUtitl.toModel(UserModel.class, request);
			model = userService.findByUserNameAndPasswordAndStatus(model.getUserName(), model.getPassword(), 1);
			if(model != null) {
				SessionUtil.getInstance().putValue(request, "USERMODEL", model);
				if(model.getRole().getCode().equals("user")) {
					response.sendRedirect(request.getContextPath()+("/trang-chu"));
				}
				else if(model.getRole().getCode().equals("admin")) {
					response.sendRedirect(request.getContextPath()+("/admin-home"));
				}
			}
			else {
				response.sendRedirect(request.getContextPath()+("/dang-nhap?action=login&message=username_password_invalid&alert=danger"));
			}
		}
	}
}
