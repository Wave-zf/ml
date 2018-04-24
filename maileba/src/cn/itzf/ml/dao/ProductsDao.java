package cn.itzf.ml.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.itzf.ml.entity.Products;
import cn.itzf.ml.util.C3P0Util;

public class ProductsDao {
	
	//添加商品
	public void addProducts(Products products) throws SQLException{
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		String sql = "INSERT INTO products VALUES(?,?,?,?,?,?,?,?)";
		qr.update(sql, 
				new Object[]{
						products.getId(), 
						products.getName(),
						products.getMoney(),
						products.getImgurl(),
						products.getReceiverName(),
						products.getReceiverPhone(),
						products.getDescription(),
						products.getUser().getId()
		});
		
	}
	
	//商品列表
	public List<Products> findAll() throws SQLException{
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		return qr.query("select * from products", new BeanListHandler<Products>(Products.class));
	}
	
	//条件查询
	public List<Products> searchByName(String name) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		return qr.query("select * from products where name like ?",new BeanListHandler<Products>(Products.class),"%"+name+"%");
	}
	
	//根据id查询商品
	public Products findBookById(String id) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		return qr.query("select * from products where id=?", new BeanHandler<Products>(Products.class),id);
	}

}
