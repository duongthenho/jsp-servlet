package com.laptrinhjavaweb.service.impl;

import java.io.InputStream;
import java.util.ArrayList;

import javax.inject.Inject;

import com.laptrinhjavaweb.dao.IProductDAO;
import com.laptrinhjavaweb.model.ProductModel;
import com.laptrinhjavaweb.paging.Pageble;
import com.laptrinhjavaweb.service.IProductService;

public class ProductService implements IProductService{

	@Inject
	private IProductDAO productDao;
	
	
	@Override
	public ProductModel save(ProductModel productModel) {
		Long productId = productDao.save(productModel);
		return productDao.fineOne(productId);
	}
	@Override
	public ArrayList<ProductModel> findAll(Pageble pageble) {
		return productDao.findAll(pageble) ;
	}
	@Override
	public ProductModel update(ProductModel productModel) {
		productDao.update(productModel);
		return productDao.fineOne(productModel.getId());
	}
	@Override
	public void delete(long[] ids) {
		for(long id:ids) {
			productDao.delete(id);
		}
		
	}
	@Override
	public int getTotalItem(Long categoryId) {
		return productDao.getTotalItem(categoryId);
	}
	@Override
	public ProductModel fineOne(Long id) {
		return productDao.fineOne(id);
	}
	@Override
	public int getTotalItem() {
		return  productDao.getTotalItem();
	}
	@Override
	public void updateImage(InputStream is, Long id) {
		productDao.updateImage(is, id);
	}
	@Override
	public ArrayList<ProductModel> findByKey(String key, Pageble pageble) {
		return productDao.findByKey(key, pageble);
	}


}
