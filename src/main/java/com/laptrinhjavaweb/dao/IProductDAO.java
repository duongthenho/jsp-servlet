package com.laptrinhjavaweb.dao;

import java.io.InputStream;
import java.util.ArrayList;

import com.laptrinhjavaweb.model.ProductModel;
import com.laptrinhjavaweb.paging.Pageble;

public interface IProductDAO extends GenericDAO<ProductModel> {
	ArrayList<ProductModel> findByKey(String key,Pageble pageble);
	Long save(ProductModel productModel);
	void update(ProductModel productModel);
	void delete (long id);
	ProductModel fineOne(Long id);
	ArrayList<ProductModel> findAll(Pageble pageble);
	int getTotalItem(Long categoryId);
	int getTotalItem();
	void updateImage(InputStream is,Long id);

}
