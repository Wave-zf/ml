<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="denglu.css"/>
</head>
<body>
	<form action="/maileba/LoginServlet" method="post">
        <div class="dl">
            <h1>欢迎登录本网站</h1>

            学&nbsp;&nbsp;&nbsp;号 ：
            <input name="username" id="xuehao" type="text" placeholder="填写正确的10位学号" size="10" />
            	<font color="red">${msg }</font><br>
            密&nbsp;&nbsp;&nbsp;码：
            <input name= "password" id="mima" type="password" placeholder="6-12位数字和字母组成" size="10" /><br>

            <input type="submit" id="dl" value="登录">



        </div>
    </form>

</body>
</html>