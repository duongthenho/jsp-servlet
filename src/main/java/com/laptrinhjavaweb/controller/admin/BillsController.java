package com.laptrinhjavaweb.controller.admin;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.model.BillModel;
import com.laptrinhjavaweb.paging.PageRequest;
import com.laptrinhjavaweb.paging.Pageble;
import com.laptrinhjavaweb.service.IBillService;
import com.laptrinhjavaweb.sort.Sorter;
import com.laptrinhjavaweb.utils.FormUtitl;

@WebServlet(urlPatterns = { "/admin-bill" })
public class BillsController extends HttpServlet {

	@Inject
	private IBillService billService;



	private static final long serialVersionUID = 2686801510274002166L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BillModel model = FormUtitl.toModel(BillModel.class, request);
		String views ="";
		Pageble pageble = new PageRequest(null, model.getPage(), model.getMaxPageItem(),
				new Sorter(model.getSortName(), model.getSortBy()));
		if (model.getType().equals("0")) {
			
			//display btn Duyet
			request.setAttribute("Duyet", "OK");

			model.setListResult(billService.findAllByStatus(pageble,"Chờ xác nhận"));
			model.setTotalItem(billService.getTotalItemByStatus("Chờ xác nhận"));
			model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));
		
			views = "/views/admin/bill/list.jsp";
		} 
		else if (model.getType().equals("1")) {
			
			model.setListResult(billService.findAllByStatus(pageble,"Đã gửi hàng"));
			model.setTotalItem(billService.getTotalItemByStatus("Đã gửi hàng"));
			model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));
			views = "/views/admin/bill/list.jsp";
		}
		request.setAttribute(SystemConstant.MODEL, model);
		RequestDispatcher rd = request.getRequestDispatcher(views);
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
