package com.laptrinhjavaweb.controller.admin.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.laptrinhjavaweb.model.BillModel;
import com.laptrinhjavaweb.service.IBillService;
import com.laptrinhjavaweb.utils.HttpUtil;

@WebServlet(urlPatterns = {"/api-admin-bill"})

public class BillAPI extends HttpServlet{
	
	@Inject
	private IBillService billService;
	
	private static final long serialVersionUID = -915988021506484384L;
	//them
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
	}
	//sua
	protected void doPut(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		BillModel billModel = HttpUtil.of(request.getReader()).toModel(BillModel.class);
		billService.updateStatus("Đã gửi hàng",billModel.getIds());
		mapper.writeValue(response.getOutputStream(), "{}");
	}
	//xoa
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}
	
}
