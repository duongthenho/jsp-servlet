package com.laptrinhjavaweb.service;

import java.io.InputStream;
import java.util.ArrayList;

import com.laptrinhjavaweb.model.ProductModel;
import com.laptrinhjavaweb.paging.Pageble;

public interface IProductService {

	
	ArrayList<ProductModel> findAll(Pageble pageble);
	ProductModel save(ProductModel productModel);
	ProductModel update(ProductModel productModel);
	void delete (long[] ids);
	int getTotalItem(Long categoryId);
	int getTotalItem();
	ProductModel fineOne(Long id);
	void updateImage(InputStream is, Long id);
	ArrayList<ProductModel> findByKey(String key, Pageble pageble);
}
