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
import com.laptrinhjavaweb.paging.Pageble;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.service.IProductService;
import com.laptrinhjavaweb.sort.Sorter;
import com.laptrinhjavaweb.utils.FormUtitl;

@WebServlet(urlPatterns = {"/product"})
public class ProductByCategoryController extends HttpServlet {
	@Inject
	private ICategoryService categoryService;
	
	@Inject
	private IProductService productService;
	/**
	 * 
	 */
	private static final long serialVersionUID = 2686801510274002166L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		CategoryModel category = new CategoryModel();
		category.setListResult(categoryService.findAll());
		request.setAttribute("categories", category);
		
		ProductModel model = FormUtitl.toModel(ProductModel.class, request);
		Pageble pageble = new PageRequest(model.getCategoryId(),model.getPage(), model.getMaxPageItem(),
				new Sorter(model.getSortName(), model.getSortBy()));
		
		model.setListResult(productService.findAll(pageble));
		model.setTotalItem(productService.getTotalItem(model.getCategoryId()));
		model.setTotalPage((int)Math.ceil((double) model.getTotalItem()/model.getMaxPageItem()));
		request.setAttribute(SystemConstant.MODEL, model);
		RequestDispatcher rd = request.getRequestDispatcher("/views/web/product/listByCategory.jsp");
		rd.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
