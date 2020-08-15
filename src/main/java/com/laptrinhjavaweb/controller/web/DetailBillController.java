package com.laptrinhjavaweb.controller.web;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.model.BillModel;
import com.laptrinhjavaweb.model.CartModel;
import com.laptrinhjavaweb.model.CategoryModel;
import com.laptrinhjavaweb.model.UserModel;
import com.laptrinhjavaweb.service.IBillService;
import com.laptrinhjavaweb.service.ICartService;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.utils.SessionUtil;


@WebServlet(urlPatterns = {"/bill-detail"})
public class DetailBillController extends HttpServlet{

	@Inject
	private ICategoryService categoryService;
	
	@Inject
	private IBillService billService;
	
	@Inject
	private ICartService cartService;
	
	private static final long serialVersionUID = 2686801510274002166L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

			CategoryModel category = new CategoryModel();
			category.setListResult(categoryService.findAll());
			request.setAttribute("categories", category);
			
			String billId = request.getParameter("id");
			BillModel bill = billService.findOne(Long.parseLong(billId));
			request.setAttribute(SystemConstant.MODEL,bill);
			
			CartModel cart = new CartModel();
			UserModel user = (UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL");
			cart.setListResult(cartService.findAllByUserIdAndBillId(Long.parseLong(billId),user.getId()));
			request.setAttribute("cart", cart);
			
			RequestDispatcher rd = request.getRequestDispatcher("/views/web/bill/detail.jsp");
			rd.forward(request, response);
		
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}
}
