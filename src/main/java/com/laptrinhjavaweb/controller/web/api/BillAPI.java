package com.laptrinhjavaweb.controller.web.api;

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
import com.laptrinhjavaweb.service.ICartService;
import com.laptrinhjavaweb.utils.HttpUtil;

@WebServlet(urlPatterns = {"/api-bill"})
public class BillAPI extends HttpServlet{

	/**
	 * 
	 */
	@Inject
	private IBillService billService;
	
	@Inject
	private ICartService cartService;
	

	
	private static final long serialVersionUID = 5457174642896356663L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
		
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		
		BillModel bill = HttpUtil.of(request.getReader()).toModel(BillModel.class);
		Long billId = billService.save(bill);
		cartService.updateBillId(billId);
		mapper.writeValue(response.getOutputStream(),billId);
	
	}
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		// "of" doc JSON tu client roi chuyen thanh ProductModel  
		BillModel bill = HttpUtil.of(request.getReader()).toModel(BillModel.class);
		billService.delete(bill.getIds());
		mapper.writeValue(response.getOutputStream(), "{}");
	}
}
