package com.laptrinhjavaweb.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.model.UserModel;
import com.laptrinhjavaweb.utils.SessionUtil;

public class AuthorizationFilter implements Filter {
	
	private ServletContext context;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.context = filterConfig.getServletContext();
		
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		String url = request.getRequestURI();
//		if(url.startsWith("/zio.com/admin")) {
//			UserModel model = (UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL");
//			if(model != null) {
//				if(model.getRole().getCode().equals(SystemConstant.ADMIN)) {
//					filterChain.doFilter(servletRequest, servletResponse);
//				}
//				else if(model.getRole().getCode().equals(SystemConstant.USER)){
//					response.sendRedirect(request.getContextPath()+"/dang-nhap?action=login&message=not_permission&alert=danger");
//				}
//			}
//			else {
//				response.sendRedirect(request.getContextPath()+"/dang-nhap?action=login&message=not_login&alert=danger");
//			}
//		}else {
//			//cho url di thoai mai
//		filterChain.doFilter(servletRequest, servletResponse);
//		}
		if(url.startsWith("/zio.com/template")||url.startsWith("/zio.com/dang-")||url.startsWith("/zio.com/thoat")||url.startsWith("/zio.com/api-register")) {
			filterChain.doFilter(servletRequest, servletResponse);
		}
		else {
			UserModel model = (UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL");
			if(model == null) {
				response.sendRedirect(request.getContextPath()+"/dang-nhap?action=login&message=not_login&alert=danger");
			}
			else {
				if(url.startsWith("/zio.com/admin")) {
					if(model.getRole().getCode().equals(SystemConstant.ADMIN)) {
						filterChain.doFilter(servletRequest, servletResponse);
					}
					else if(model.getRole().getCode().equals(SystemConstant.USER)){
						response.sendRedirect(request.getContextPath()+"/dang-nhap?action=login&message=not_permission&alert=danger");
					}
				}
				else {
					filterChain.doFilter(servletRequest, servletResponse);
				}
			}
		}
	}

	@Override
	public void destroy() {
		
	}

}
