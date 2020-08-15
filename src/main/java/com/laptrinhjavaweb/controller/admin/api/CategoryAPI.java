package com.laptrinhjavaweb.controller.admin.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.laptrinhjavaweb.model.CategoryModel;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.utils.HttpUtil;

@WebServlet(urlPatterns = {"/api-admin-category"})

public class CategoryAPI extends HttpServlet{
	
	@Inject
	private ICategoryService categoryService;
	
	private static final long serialVersionUID = -915988021506484384L;
	//them
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		CategoryModel model = HttpUtil.of(request.getReader()).toModel(CategoryModel.class);
		model.setId(categoryService.save(model));
		mapper.writeValue(response.getOutputStream(), model.getId());
	}

	//sua
	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		CategoryModel model = HttpUtil.of(request.getReader()).toModel(CategoryModel.class);
		categoryService.update(model);
		mapper.writeValue(response.getOutputStream(), model.getId());

	}
	//xoa
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		CategoryModel model = HttpUtil.of(request.getReader()).toModel(CategoryModel.class);
		categoryService.delete(model.getId());
		mapper.writeValue(response.getOutputStream(), model.getId());
	}
	
}
