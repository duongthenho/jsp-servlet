package com.laptrinhjavaweb.utils;

import java.lang.reflect.InvocationTargetException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;

public class FormUtitl {
//	@SuppressWarnings("unchecked")
	public static <T> T toModel(Class<T> tclass, HttpServletRequest request) {
		T object = null;
		try {
			object =  tclass.newInstance();
			BeanUtils.populate(object, request.getParameterMap());
			
		} catch (InstantiationException | IllegalAccessException | InvocationTargetException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return object ;
	}
}
