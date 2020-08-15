package com.laptrinhjavaweb.dao.impl;

import java.io.InputStream;
import java.util.ArrayList;

import com.laptrinhjavaweb.dao.IProductDAO;
import com.laptrinhjavaweb.mapper.ProductMapper;
import com.laptrinhjavaweb.model.ProductModel;
import com.laptrinhjavaweb.paging.Pageble;

public class ProductDAO extends AbstractDAO<ProductModel> implements IProductDAO {
	
	
	@Override
	public ArrayList<ProductModel> findAll(Pageble pageble) {
		StringBuilder sql = new StringBuilder("select * from product");
		if(pageble.getId() != null) {
			sql.append(" where categoryid ='"+pageble.getId()+"'");
		}
		if(pageble.getSorter() != null) {
			sql.append(" order by "+pageble.getSorter().getSortName()+" "+pageble.getSorter().getSortBy());
		}
		if(pageble.getOffset() != null && pageble.getLimit() != null) {
			sql.append(" limit "+pageble.getOffset()+", "+ pageble.getLimit());
		}
		return query(sql.toString(), new ProductMapper());
	}
	
	@Override
	public Long save(ProductModel productModel) {
		
		String sql="Insert into product (name, code,price,categoryid) values ( ?, ?, ?, ?)";
		return insert(sql,productModel.getName(),productModel.getCode(),productModel.getPrice(),productModel.getCategoryId());
	
	}

	
	
	@Override
	public ProductModel fineOne(Long id) {
		String sql = "select * from product where id =?";	
		ArrayList<ProductModel> product = query(sql, new ProductMapper(), id);
		return product.isEmpty()?null : product.get(0);
	}

	@Override
	public void update(ProductModel productModel) {
		String sql = "update product set name = ?, code = ?, price = ?, categoryid = ? where id = ?";
		update(sql,productModel.getName(), productModel.getCode(),
				productModel.getPrice(),productModel.getCategoryId(),productModel.getId());
	}

	@Override
	public void delete(long id) {
		String sql1="delete from cart where product_id =?;";
		update(sql1,id);
		String sql="delete from product where id =?;";
		update(sql,id);
	}

	@Override
	public int getTotalItem(Long categoryId) {
		String sql = "select count(*) from product where categoryid= ?";
		return count(sql, categoryId);
	}

	@Override
	public int getTotalItem() {
		String sql = "select count(*) from product";
		return count(sql);
	}

	@Override
	public void updateImage(InputStream is, Long id) {
		String sql="update product set image=? where id =?;";
		update(sql,is,id);
	}

	@Override
	public ArrayList<ProductModel> findByKey(String key, Pageble pageble) {
		StringBuilder sql = new StringBuilder("select * from product");
		if(key != null) {
			sql.append(" where name like '%"+key+"%' or code like '%"+key+"%' ");
		}
		if(pageble.getSorter() != null) {
			sql.append(" order by "+pageble.getSorter().getSortName()+" "+pageble.getSorter().getSortBy());
		}
		if(pageble.getOffset() != null && pageble.getLimit() != null) {
			sql.append(" limit "+pageble.getOffset()+", "+ pageble.getLimit());
		}
		return query(sql.toString(), new ProductMapper());
	}


	
}
