<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{
    margin:0;
    padding:0;
}
body{
    background: #E3EEEC;
    font-family: "Bookman", Georgia, "Times New Roman", serif;
}
.zc{
    width: 600px;
    height: 600px;
    margin-top: 50px;
    margin-left:400px;
}
h1{
    margin-left: 30px;
    color:#44C1A5;
    margin-bottom: 60px;
}
#username{
    width: 200px;
    height: 30px;
    line-height: 100px;
    color:gray;
    margin-bottom: 30px;

}
#username{
    width: 200px;
    height: 30px;
    line-height: 100px;
    color:gray;
    margin-bottom: 30px;

}
#password{
    width: 200px;
    height: 30px;
    line-height: 100px;
    color:gray;
    margin-bottom: 30px;


}
#email{
    width: 200px;
    height: 30px;
    line-height: 100px;
    color:gray;
    margin-bottom: 30px;

}

#tj{
    width: 100px;
    height: 40px;
    text-align: center;
    line-height: 30px;
    margin-left: 30px;
    font-size: 20px;
    text-decoration: none;

}
</style>
</head>
<body>
	<form action="/maileba/AddUserServlet" method="post">
    <div class="zc">
        <h1>欢迎注册本网站</h1>

            学&nbsp;&nbsp;&nbsp;号 ：
            <input name="username" id="username" type="text" placeholder="填写正确的10位学号" size="10" /><br>
            密&nbsp;&nbsp;&nbsp;码：
            <input name= "password" id="password" type="text" placeholder="6-12位数字和字母组成" size="10" /><br>
            邮&nbsp;&nbsp;&nbsp;箱：
            <input  name="email" id="email" type="text" placeholder="填写正确的邮箱号" size="10" /><br>
           	<input type="submit" id="tj" value="注册"/>&nbsp;
			<input type="reset" id="tj" value="重置">

    </div>
    </form>
</body>
</html>