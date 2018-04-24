package cn.itzf.ml.web.servlet;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.FileUploadBase.FileSizeLimitExceededException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;

import cn.itzf.ml.entity.Products;
import cn.itzf.ml.entity.User;
import cn.itzf.ml.service.ProductsService;


public class AddProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public AddProductsServlet() {
        super();
        
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
//		String receiverName= new String(request.getParameter("receiverName").getBytes("ISO-8859-1"),"utf-8");
//		String receiverPhone= new String(request.getParameter("receiverPhone").getBytes("ISO-8859-1"),"utf-8");
//		String name= new String(request.getParameter("name").getBytes("ISO-8859-1"),"utf-8");
//		String description= new String(request.getParameter("description").getBytes("ISO-8859-1"),"utf-8");
//		double money=Double.parseDouble(request.getParameter("money"));
		
		try {
			ProductsService productsService = new ProductsService();
			
			DiskFileItemFactory factory = new DiskFileItemFactory(1024*10,new File("i:/测试"));
			
			ServletFileUpload upload = new ServletFileUpload(factory);
			//文件中文问题
			upload.setHeaderEncoding("utf-8");
			//文件大小
			upload.setFileSizeMax(100*1024);//每个文件
			upload.setSizeMax(500*1024);//总文件
			//解析
			List<FileItem> list = upload.parseRequest(request);
			
			
			List<Products> fileList = new ArrayList<Products>();
			
			Products products=new Products();
			
			if(list!=null){
				
				for(FileItem item : list){
					
					if(item.isFormField()){
						//取表单内容
						if(item.getFieldName().equals("name")){
							String name = item.getString("UTF-8");
							products.setName(name);
						}
						if(item.getFieldName().equals("receiverName")){
							String receiverName = item.getString("UTF-8");
							products.setReceiverName(receiverName);
						}
						if(item.getFieldName().equals("receiverPhone")){
							String receiverPhone = item.getString("UTF-8");
							products.setReceiverPhone(receiverPhone);
						}
						if(item.getFieldName().equals("description")){
							String description = item.getString("UTF-8");
							products.setDescription(description);
						}
						if("money".equals(item.getFieldName())){
							double money = Double.parseDouble(item.getString("UTF-8"));
							products.setMoney(money);
						}
						
						fileList.add(products);
						//保存到数据库
						
					}else {
						
						//把文件保存到服务器硬盘中
						String uuid = UUID.randomUUID().toString();
						String fileName = item.getName();
						//后缀,随机文件名称防止重复
						fileName = uuid+fileName.substring(fileName.lastIndexOf("."));
						//组键一个目录结构
						String baseDir = this.getServletContext().getRealPath("/upload");
						
						String subDir = makeDirectory(fileName);
						
						String finalDir = baseDir+"/"+subDir;
						
						
						FileUtils.copyInputStreamToFile(item.getInputStream(), new File(finalDir+fileName));
						
						//删除临时文件
						item.delete();
						//吧数据保存到数据库中
						//封装对象
						products.setImgurl("upload"+"/"+subDir+fileName);
						fileList.add(products);
					}	
				}
				
				products.setId(UUID.randomUUID().toString());
				products.setUser((User)request.getSession().getAttribute("user"));
				
				System.out.println(products);
				
				productsService.addProducts(products);
				
				request.setAttribute("fileList", products);
				request.getRequestDispatcher("/fbsuccess.jsp").forward(request, response);
			}
			
		} catch(FileSizeLimitExceededException e){
			request.setAttribute("msg", "每个文件不能超过100KB");
			request.getRequestDispatcher("/upload.jsp").forward(request, response);
		} catch (FileUploadException e) {
			request.setAttribute("msg", "总文件文件不能超过500KB");
			request.getRequestDispatcher("/upload.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("出错了");
		}
	}
	
	/**
	 * 返回新的目录结构
	 */
	private String makeDirectory(String fileName){
		//得到文件名的hascode值
		int code = fileName.hashCode();
		//算出第一层目录名称
		int first = code & 0xF;
		//算出第二层目录名称
		int second = code & (0xF>>1);
		return first+"/"+second+"/";
	}
		
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doPost(request, response);
	}

}
