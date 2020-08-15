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
import com.laptrinhjavaweb.model.CartModel;
import com.laptrinhjavaweb.service.IBillService;
import com.laptrinhjavaweb.service.ICartService;

@WebServlet(urlPatterns = {"/admin-detail-bill"})
public class DetailBillController extends HttpServlet{

	/**
	 * 
	 */
	@Inject
	private IBillService billService;
	
	@Inject
	private ICartService cartService;
	
	private static final long serialVersionUID = 2686801510274002166L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String billId =request.getParameter("id");
		request.setAttribute(SystemConstant.MODEL, billService.findOne(Long.parseLong(billId)));
		
		CartModel cart = new CartModel();
		cart.setListResult(cartService.findAllByUserIdAndBillId(null,Long.parseLong(billId)));
		request.setAttribute("cart", cart);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/bill/detail.jsp");
		rd.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
