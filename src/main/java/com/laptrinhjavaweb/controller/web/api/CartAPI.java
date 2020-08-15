package com.laptrinhjavaweb.controller.web.api;

import java.io.IOException;
import java.text.DecimalFormat;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.laptrinhjavaweb.model.CartModel;
import com.laptrinhjavaweb.service.ICartService;
import com.laptrinhjavaweb.utils.HttpUtil;

@WebServlet(urlPatterns = {"/api-cart"})
public class CartAPI extends HttpServlet{
	
	@Inject
	private ICartService cartService;
	
	
	
	private static final long serialVersionUID = -915988021506484384L;
	//them
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		// "of" doc JSON tu client roi chuyen thanh ProductModel  
		CartModel cart = HttpUtil.of(request.getReader()).toModel(CartModel.class);
		//roi luu xuong co so du lieu 
		Long cartId = cartService.save(cart);
		//roi lai xuat lai JSON
		
		mapper.writeValue(response.getOutputStream(),cartId);
	}
	//sua
	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		// "of" doc JSON tu client roi chuyen thanh ProductModel  
		CartModel cart = HttpUtil.of(request.getReader()).toModel(CartModel.class);
		Long cartId = cartService.update(cart);
		DecimalFormat df = new DecimalFormat("###,###.#");
		mapper.writeValue(response.getOutputStream(), df.format(cart.getTotalMoney())+" VNĐ");
	}
	//xoa
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		// "of" doc JSON tu client roi chuyen thanh ProductModel  
		CartModel cart = HttpUtil.of(request.getReader()).toModel(CartModel.class);
		cartService.delete(cart.getIds());
		mapper.writeValue(response.getOutputStream(), "{}");
	}
	
}
