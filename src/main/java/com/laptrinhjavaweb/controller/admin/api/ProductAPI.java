package com.laptrinhjavaweb.controller.admin.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.laptrinhjavaweb.model.ProductModel;
import com.laptrinhjavaweb.service.IProductService;
import com.laptrinhjavaweb.utils.HttpUtil;

@WebServlet(urlPatterns = {"/api-admin-product"})

public class ProductAPI extends HttpServlet{
	
	@Inject
	private IProductService productService;
	
	private static final long serialVersionUID = -915988021506484384L;
	//them
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		// "of" doc JSON tu client roi chuyen thanh ProductModel  
		ProductModel productModel = HttpUtil.of(request.getReader()).toModel(ProductModel.class);
		//roi luu xuong co so du lieu 
		productModel = productService.save(productModel);
		
		//roi lai xuat lai JSON

		mapper.writeValue(response.getOutputStream(), productModel.getId());
	}
	//sua
	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		ProductModel productModel = HttpUtil.of(request.getReader()).toModel(ProductModel.class);
		productModel = productService.update(productModel);
		mapper.writeValue(response.getOutputStream(), productModel.getId());

	}
	//xoa
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		ProductModel productModel = HttpUtil.of(request.getReader()).toModel(ProductModel.class);
		productService.delete(productModel.getIds());
		mapper.writeValue(response.getOutputStream(), "{}");
	}
	
}
