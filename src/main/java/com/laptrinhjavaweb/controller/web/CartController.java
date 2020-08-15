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
import com.laptrinhjavaweb.model.CartModel;
import com.laptrinhjavaweb.model.CategoryModel;
import com.laptrinhjavaweb.model.UserModel;
import com.laptrinhjavaweb.service.ICartService;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.service.ITinhThanhPhoService;
import com.laptrinhjavaweb.utils.SessionUtil;

@WebServlet(urlPatterns = { "/cart" })
public class CartController extends HttpServlet {

	@Inject
	private ICartService cartService;

	@Inject
	private ICategoryService categoryService;
	
	@Inject
	private ITinhThanhPhoService tinhThanhPhoService;
	


	private static final long serialVersionUID = 2686801510274002166L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		CategoryModel category = new CategoryModel();
		category.setListResult(categoryService.findAll());
		request.setAttribute("categories", category);
		CartModel cart = new CartModel();
		UserModel user = (UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL");
		cart.setListResult(cartService.findAllByUserIdAndBillId(0L, user.getId()));
		request.setAttribute(SystemConstant.MODEL, cart);
		
		request.setAttribute(SystemConstant.TTP, tinhThanhPhoService.findAll());
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/web/cart/cart.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		String matp = request.getParameter("thanhpho");
//		request.setAttribute(SystemConstant.QH, quanHuyenService.findAllByMaTP(matp));
//		response.sendRedirect(request.getContextPath()+"/cart");
	}
}
