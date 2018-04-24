package cn.itzf.ml.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itzf.ml.entity.Products;
import cn.itzf.ml.service.ProductsService;

/**
 * Servlet implementation class SearchServlet
 */
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String name= new String(request.getParameter("name").getBytes("ISO-8859-1"),"utf-8");
		
		ProductsService productsService = new ProductsService();
		
		List<Products> produts = productsService.searchlist(name);
		
		request.setAttribute("produts", produts);
		
		request.getRequestDispatcher("/search.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
