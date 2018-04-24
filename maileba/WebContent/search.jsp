<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="shouji.css"/>
</head>
<body>
<!--  <table align="center" border="2" width="800px">
	<tr>
		<th><font >编号</font></th>
		<th>商品名称</th>
		<th>商品价格</th>
		<th>商品描述</th>
		<th>卖家昵称</th>
		<th>卖家电话</th>
	</tr>
	<c:forEach items="${ produts}" var="produts" varStatus="varSta">
		<tr>
			<td>${varSta.count}</td>
			<td>${produts.name}</td>
			<td>${produts.money}</td>
			<td>${produts.description}</td>
			<td>${produts.receiverName}</td>
			<td>${produts.receiverPhone}</td>
		</tr>
	</c:forEach>
</table>
-->
<div class="shouji">
    </div>
    <div class="box1">
        <c:forEach items="${ produts}" var="produts" varStatus="varSta">
			<h1>${produts.name}</h1>
			<p>价格：${produts.money}RMB</p>
			<p>${produts.description}</p>
			<p>联系人：${produts.receiverName}</p>
			<p>电话：${produts.receiverPhone}</p>
	</c:forEach>
    </div>
</body>
</html>