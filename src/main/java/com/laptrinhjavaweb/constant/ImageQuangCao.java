package com.laptrinhjavaweb.constant;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.laptrinhjavaweb.model.QuangCao;
import com.laptrinhjavaweb.service.IQuangCaoService;

@WebServlet(urlPatterns = {"/slideimage"})
public class ImageQuangCao extends HttpServlet {

	/**
	 * 
	 */
	@Inject
	private IQuangCaoService quangCaoService;
	
	private static final long serialVersionUID = 3783990604379878528L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String col = request.getParameter("col");
		QuangCao qc = quangCaoService.findCol(col);
		if(qc.getImage1() != null) {
			request.setAttribute(SystemConstant.MODEL, qc.getImage1());
		}
		else if(qc.getImage2() != null) {
			request.setAttribute(SystemConstant.MODEL, qc.getImage2());
		}
		else if(qc.getImage3() != null) {
			request.setAttribute(SystemConstant.MODEL, qc.getImage3());
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/image/slideimage.jsp");
		rd.forward(request, response);
        
        
	}
	
	
}
