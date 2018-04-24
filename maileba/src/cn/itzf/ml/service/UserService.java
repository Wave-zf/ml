package cn.itzf.ml.service;

import java.sql.SQLException;

import cn.itzf.ml.dao.UserDao;
import cn.itzf.ml.entity.User;

public class UserService {
	
	UserDao ud = new UserDao();
	
	public void adduser(User user) throws SQLException{
		ud.addUser(user);
	}
	
	public boolean login(String username,String password) throws SQLException{
		boolean flag = false;
		
		if(null!= ud.findUserByUserNameAndPassword(username, password)
				&& !"".equals(ud.findUserByUserNameAndPassword(username, password))){
			
			flag = true;
		}
		return flag;
		
		
	}

}
