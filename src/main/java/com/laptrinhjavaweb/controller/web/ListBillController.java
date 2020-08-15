package com.laptrinhjavaweb.controller.web;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.laptrinhjavaweb.model.BillModel;
import com.laptrinhjavaweb.model.CategoryModel;
import com.laptrinhjavaweb.model.UserModel;
import com.laptrinhjavaweb.service.IBillService;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.utils.SessionUtil;


@WebServlet(urlPatterns = {"/list-bill"})
public class ListBillController extends HttpServlet{

	@Inject
	private ICategoryService categoryService;
	
	@Inject
	private IBillService billService;
	
	private static final long serialVersionUID = 2686801510274002166L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

			CategoryModel category = new CategoryModel();
			category.setListResult(categoryService.findAll());
			request.setAttribute("categories", category);
			
			UserModel user = (UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL");
			BillModel bill = new BillModel();
			bill.setListResult(billService.findAllByUserIdAndStatus(user.getId()));
			request.setAttribute("bills", bill);
			
			RequestDispatcher rd = request.getRequestDispatcher("/views/web/bill/list.jsp");
			rd.forward(request, response);
		
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}
}
