<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="fb.css"/>
</head>
<body>
<!-- enctype="multipart/form-data" -->
<form action="/maileba/AddProductsServlet" method="post" enctype="multipart/form-data">
    <div class="passage">
    <p>请留下您的个人信息</p>
    姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：
        <input name="receiverName" id="name" type="text"/><br>
    电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话：
        <input name="receiverPhone" id="tel" type="text"/><br>
    商品名称：
    	<input name="name" id="name" type="text"/><br>
    商品价格：
        <input name="money" id="price" type="text"/><br>
    商品简介:<textarea name="description" id="jj" cols="30" rows="10"></textarea><br>
    
     <br>上传图片：
        <input name="imgurl" id="tu" type="file"/><br/>
    <input name="fb" id="fb" type="submit" value="发布"/>
    <input name="cz" id="cz" type="reset"/><br/>
    <font color="red">${msg }</font>
    </div>
</form>
</body>
</html>