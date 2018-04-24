package cn.itzf.ml.web.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.itzf.ml.dao.UserDao;
import cn.itzf.ml.entity.User;
import cn.itzf.ml.service.UserService;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		UserService us = new UserService();
		UserDao uDao = new UserDao();
		
		try {
			if(us.login(username, password)){
				User user = uDao.findUserByUserNameAndPassword(username, password);
				HttpSession session=request.getSession();
				session.setAttribute("user", user);
				response.sendRedirect("dlsuccess.jsp");
			}else{
				request.setAttribute("msg", "用户名或密码错误，请重新输入");
				request.getRequestDispatcher("/denglu.jsp").forward(request,response);
				return;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
