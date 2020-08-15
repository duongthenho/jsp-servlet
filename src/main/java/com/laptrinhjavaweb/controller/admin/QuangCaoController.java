package com.laptrinhjavaweb.controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/admin-slide-image"})
public class QuangCaoController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2686801510274002166L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String message = request.getParameter("message");
		if(message !=null) {
			request.setAttribute("message", message);
		}
		 
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/slideimage.jsp");
		rd.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
