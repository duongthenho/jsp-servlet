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
import com.laptrinhjavaweb.model.XaPhuongThiTran;
import com.laptrinhjavaweb.service.IXaPhuongThiTranService;
import com.laptrinhjavaweb.utils.HttpUtil;

@WebServlet(urlPatterns = {"/api-XPTT"})
public class XaPhuongThiTranAPI extends HttpServlet{

	/**
	 * 
	 */
	@Inject
	private IXaPhuongThiTranService xaPhuongThiTranService;
	
	private static final long serialVersionUID = 942881543584887549L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		// "of" doc JSON tu client roi chuyen thanh ProductModel  
		XaPhuongThiTran xptt = HttpUtil.of(request.getReader()).toModel(XaPhuongThiTran.class);
		//roi luu xuong co so du lieu tta
		ArrayList<XaPhuongThiTran> listXPTT = xaPhuongThiTranService.findByMaQH(xptt.getMaqh());
		//roi lai xuat lai JSON
		StringBuilder listXPTT_String = new StringBuilder("<option>-- Chọn --</option>");
		for (int i = 0; i < listXPTT.size(); i++) {
			listXPTT_String.append("<option value='"+listXPTT.get(i).getXaid()+"'>"+listXPTT.get(i).getName()+"</option>");
		}
		mapper.writeValue(response.getOutputStream(), listXPTT_String.toString());
	}
}
