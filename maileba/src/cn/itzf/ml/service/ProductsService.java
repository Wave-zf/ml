package cn.itzf.ml.service;

import java.sql.SQLException;
import java.util.List;

import cn.itzf.ml.dao.ProductsDao;
import cn.itzf.ml.entity.Products;

public class ProductsService {
	
	ProductsDao productsDao = new ProductsDao();
	
	public void addProducts(Products products) {
		try {
			productsDao.addProducts(products);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	//����������Ʒ
	public List<Products> findList(){
		try {
			return productsDao.findAll();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	//��������
	public List<Products> searchlist(String name){
		try {
			return productsDao.searchByName(name);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	

}
