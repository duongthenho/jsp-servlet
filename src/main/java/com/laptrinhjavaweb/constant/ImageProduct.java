package com.laptrinhjavaweb.constant;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.laptrinhjavaweb.model.ProductModel;
import com.laptrinhjavaweb.service.IProductService;

@WebServlet(urlPatterns = {"/image"})
public class ImageProduct extends HttpServlet {

	/**
	 * 
	 */
	@Inject
	private IProductService productService;
	
	private static final long serialVersionUID = 3783990604379878528L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		
		ProductModel model = productService.fineOne(Long.parseLong(id));
		request.setAttribute("model",model);
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/image/image.jsp");
		rd.forward(request, response);
        
        
	}
	
	
}
