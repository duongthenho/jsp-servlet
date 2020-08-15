package com.laptrinhjavaweb.controller.web.api;

import java.io.IOException;
import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.laptrinhjavaweb.model.QuanHuyen;
import com.laptrinhjavaweb.service.IQuanHuyenService;
import com.laptrinhjavaweb.utils.HttpUtil;

@WebServlet(urlPatterns = {"/api-QH"})
public class QuanHuyenAPI extends HttpServlet{

	/**
	 * 
	 */
	@Inject
	private IQuanHuyenService quanHuyenService;
	
	private static final long serialVersionUID = 942881543584887549L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		// "of" doc JSON tu client roi chuyen thanh ProductModel  
		QuanHuyen qh = HttpUtil.of(request.getReader()).toModel(QuanHuyen.class);
		//roi luu xuong co so du lieu 
		ArrayList<QuanHuyen> listQH = quanHuyenService.findAllByMaTP(qh.getMatp());
		//roi lai xuat lai JSON
		StringBuilder listQH_String = new StringBuilder("<option>-- Chọn --</option>");
		for (int i = 0; i < listQH.size(); i++) {
			listQH_String.append("<option value='"+listQH.get(i).getMaqh()+"'>"+listQH.get(i).getName()+"</option>");
		}
		mapper.writeValue(response.getOutputStream(), listQH_String.toString());
	}
}
