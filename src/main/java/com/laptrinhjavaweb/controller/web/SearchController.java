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
import com.laptrinhjavaweb.model.CategoryModel;
import com.laptrinhjavaweb.model.ProductModel;
import com.laptrinhjavaweb.paging.PageRequest;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.service.IProductService;


@WebServlet(urlPatterns = {"/search"})
public class SearchController extends HttpServlet{

	@Inject
	private ICategoryService categoryService;
	
	@Inject
	private IProductService productService;
	
	private static final long serialVersionUID = 2686801510274002166L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

			CategoryModel category = new CategoryModel();
			category.setListResult(categoryService.findAll());
			request.setAttribute("categories", category);
			String key = request.getParameter("key");
			
			ProductModel model = new ProductModel();
			model.setListResult(productService.findByKey(key, new PageRequest(null, null, null, null)));
			request.setAttribute(SystemConstant.MODEL, model);
			request.setAttribute("key", key);
			RequestDispatcher rd = request.getRequestDispatcher("/views/web/search.jsp");
			rd.forward(request, response);
		
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}
}
