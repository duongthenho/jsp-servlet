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
import com.laptrinhjavaweb.model.CategoryModel;
import com.laptrinhjavaweb.model.ProductModel;
import com.laptrinhjavaweb.paging.PageRequest;
import com.laptrinhjavaweb.paging.Pageble;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.service.IProductService;
import com.laptrinhjavaweb.sort.Sorter;
import com.laptrinhjavaweb.utils.FormUtitl;

@WebServlet(urlPatterns = { "/admin-product" })
public class ProductController extends HttpServlet {

	@Inject
	private IProductService productService;

	@Inject
	private ICategoryService categoryService;

	private static final long serialVersionUID = 2686801510274002166L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProductModel model = FormUtitl.toModel(ProductModel.class, request);
		String views ="";
		if (model.getType().equals(SystemConstant.LIST)) {
			// tim theo categoryid
			Pageble pageble = new PageRequest(null, model.getPage(), model.getMaxPageItem(),
					new Sorter(model.getSortName(), model.getSortBy()));

			model.setListResult(productService.findAll(pageble));
			model.setTotalItem(productService.getTotalItem());
			model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));
			views = "/views/admin/product/list.jsp";
		} else if (model.getType().equals(SystemConstant.EDIT)) {
			if (model.getId() != null) {
				model = productService.fineOne(model.getId());
			}
			CategoryModel category = new CategoryModel();
			category.setListResult(categoryService.findAll());
			request.setAttribute("categories", category);
			views=  "/views/admin/product/edit.jsp";
		}
		request.setAttribute(SystemConstant.MODEL, model);
		RequestDispatcher rd = request.getRequestDispatcher(views);
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
