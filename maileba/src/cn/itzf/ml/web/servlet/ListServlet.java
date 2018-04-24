package cn.itzf.ml.web.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itzf.ml.entity.Products;
import cn.itzf.ml.service.ProductsService;


public class ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		ProductsService productsService = new ProductsService();
		
		List<Products> list = productsService.findList();
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/maileba.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
