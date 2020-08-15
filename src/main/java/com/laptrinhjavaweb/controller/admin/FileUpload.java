package com.laptrinhjavaweb.controller.admin;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.laptrinhjavaweb.service.IProductService;
import com.laptrinhjavaweb.service.IQuangCaoService;




/**
 * Servlet implementation class FileUpload
 */
@WebServlet(urlPatterns = {"/admin-upload"})
@MultipartConfig(maxFileSize = 16177216)
public class FileUpload extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	PrintWriter out;
	@Inject
	private IProductService productService;
	
	@Inject
	private IQuangCaoService quangCaoService;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		
		//update image sanpham
		response.setContentType("text/html;charset=UTF-8");
		out = response.getWriter();
	
		String imageId= request.getParameter("imageId");
		if(imageId != null) {
			Part part = request.getPart("inputFile");
			if(part != null) {
				InputStream is =part.getInputStream();
				productService.updateImage(is, Long.parseLong(imageId));
			}
			response.sendRedirect(request.getContextPath()+("/admin-product?type=list&page=1&maxPageItem=3&sortName=id&sortBy=desc"));
		}
		
		 //update image quang cao
		else {
			Part part1 = request.getPart("inputFile1");
			Part part2 = request.getPart("inputFile2");
			Part part3 = request.getPart("inputFile3");
			
			if(part1.getSubmittedFileName() != "") {
				InputStream is =part1.getInputStream();
				quangCaoService.updateImage("image1", is);
			}
			if(part2.getSubmittedFileName() != "") {
				InputStream is =part2.getInputStream();
				quangCaoService.updateImage("image2", is);
			}
			if(part3.getSubmittedFileName() != "") {
				InputStream is =part3.getInputStream();
				quangCaoService.updateImage("image3", is);
			}
			response.sendRedirect(request.getContextPath()+("/admin-slide-image?message=success"));
		}
	}
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
	}

}
