<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="fbsuccess.css"/>
</head>
<body>
	<div class="box1">
        <img src="${fileList.imgurl} " />
        <h1>${fileList.name}</h1>
        <p>${fileList.description}</p><br/>
        <p>价格：${fileList.money}RMB</p><br/>
        <p>联系电话：${fileList.receiverName} ${fileList.receiverPhone}</p><br/>
        <a id="fh" href="maileba.jsp">返回首页</a>
    </div>

</body>
</html>