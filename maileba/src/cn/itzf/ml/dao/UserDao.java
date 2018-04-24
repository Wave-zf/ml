package cn.itzf.ml.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import cn.itzf.ml.entity.Products;
import cn.itzf.ml.entity.User;
import cn.itzf.ml.util.C3P0Util;

public class UserDao {
	
	//用户注册
	public void addUser(User user)throws SQLException{
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		String sql = "INSERT INTO USER(username,PASSWORD,email) "
				+ "VALUES(?,?,?)";
		qr.update(sql, user.getUsername(), user.getPassword(),user.getEmail());
	}
	
	// 用户登录
	public User findUserByUserNameAndPassword(String username, String password)
			throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		return qr.query("select * from user where username=? and password=?",
				new BeanHandler<User>(User.class), username, password);
	}
	
	
		
		
	
	

}
