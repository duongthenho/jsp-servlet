package com.laptrinhjavaweb.controller.admin;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.model.UserModel;
import com.laptrinhjavaweb.paging.PageRequest;
import com.laptrinhjavaweb.paging.Pageble;
import com.laptrinhjavaweb.service.IUserService;
import com.laptrinhjavaweb.sort.Sorter;
import com.laptrinhjavaweb.utils.FormUtitl;

@WebServlet(urlPatterns = {"/admin-user"})
public class UserController extends HttpServlet{

	@Inject
	IUserService userService;
	private static final long serialVersionUID = 2686801510274002166L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		UserModel model = FormUtitl.toModel(UserModel.class, request);
		String views ="";
		if(model.getType().equals(SystemConstant.LIST)) {
			Pageble pageble = new PageRequest(null, model.getPage(), model.getMaxPageItem(), 
					new Sorter(model.getSortName(),model.getSortBy()));
			model.setListResult(userService.findAll(pageble));
			model.setTotalItem(userService.getTotalItem());
			model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));
			views = "/views/admin/user/list.jsp";
		}
		else if(model.getType().equals(SystemConstant.EDIT)) {
			if(model.getId() != null) {
				model = userService.findOne(model.getId());
			}
			views = "/views/admin/user/edit.jsp";
		}
		request.setAttribute(SystemConstant.MODEL, model);
		RequestDispatcher rd = request.getRequestDispatcher(views);
		rd.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
