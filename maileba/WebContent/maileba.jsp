<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="maileba.css"/>
    <script src="jquery-1.7.1.min.js"></script>
    <script>
        $(document).ready(function(){
        $(".banner1 li").mouseenter(function () {
        $(this).children("ul").show();
    });
            $(".banner1 li").mouseleave(function () {
                $(this).children("ul").hide();
            });
        });
    </script>
    <script src="js/jquery.min.js"></script>
    <script>
        $(function(){
            var $banner=$('.banner');
            var $banner_ul=$('.banner-img');
            var $btn=$('.banner-btn');
            var $btn_a=$btn.find('a')
            var v_width=$banner.width();

            var page=1;

            var timer=null;
            var btnClass=null;

            var page_count=$banner_ul.find('li').length;//把这个值赋给小圆点的个数

            var banner_cir="<li class='selected' href='#'><a></a></li>";
            for(var i=1;i<page_count;i++){
                //动态添加小圆点
                banner_cir+="<li><a href='#'></a></li>";
            }
            $('.banner-circle').append(banner_cir);

            var cirLeft=$('.banner-circle').width()*(-0.5);
            $('.banner-circle').css({'marginLeft':cirLeft});

            $banner_ul.width(page_count*v_width);

            function move(obj,classname){
                //手动及自动播放
                if(!$banner_ul.is(':animated')){
                    if(classname=='prevBtn'){
                        if(page==1){
                            $banner_ul.animate({left:-v_width*(page_count-1)});
                            page=page_count;
                            cirMove();
                        }
                        else{
                            $banner_ul.animate({left:'+='+v_width},"slow");
                            page--;
                            cirMove();
                        }
                    }
                    else{
                        if(page==page_count){
                            $banner_ul.animate({left:0});
                            page=1;
                            cirMove();
                        }
                        else{
                            $banner_ul.animate({left:'-='+v_width},"slow");
                            page++;
                            cirMove();
                        }
                    }
                }
            }

            function cirMove(){
                //检测page的值，使当前的page与selected的小圆点一致
                $('.banner-circle li').eq(page-1).addClass('selected')
                        .siblings().removeClass('selected');
            }

            $banner.mouseover(function(){
                $btn.css({'display':'block'});
                clearInterval(timer);
            }).mouseout(function(){
                $btn.css({'display':'none'});
                clearInterval(timer);
                timer=setInterval(move,3000);
            }).trigger("mouseout");//激活自动播放

            $btn_a.mouseover(function(){
                //实现透明渐变，阻止冒泡
                $(this).animate({opacity:0.6},'fast');
                $btn.css({'display':'block'});
                return false;
            }).mouseleave(function(){
                $(this).animate({opacity:0.3},'fast');
                $btn.css({'display':'none'});
                return false;
            }).click(function(){
                //手动点击清除计时器
                btnClass=this.className;
                clearInterval(timer);
                timer=setInterval(move,3000);
                move($(this),this.className);
            });

            $('.banner-circle li').live('click',function(){
                var index=$('.banner-circle li').index(this);
                $banner_ul.animate({left:-v_width*index},'slow');
                page=index+1;
                cirMove();
            });
        });
    </script>
    
    
    <style>
        body,ul,ol,li,p,h1,h2,h3,h4,h5,h6,form,fieldset,table,td,img,div,dl,dt,dd,input{margin:0;padding:0;}
        body{font-size:12px;}
        img{border:none;}
        li{list-style:none;}
        input,select,textarea{outline:none;}
        textarea{resize:none;}
        a{text-decoration:none;}

        /*清浮动*/
        .clearfix:after{content:"";display:block;clear:both;}
        .clearfix{zoom:1;}
        .banner{width:700px; height:400px; position:relative; overflow:hidden;}
        .banner-btn{ display:none;}
        .banner-btn a{ display:block; line-height:40px; position:absolute;top:120px; width:40px; height:40px;background-color: #000; opacity:0.3; filter:alpha(opacity=30) color: rgb(255, 255, 255);overflow: hidden; z-index:4;}
        .prevBtn{left:5px;}
        .nextBtn{right:5px;}
        .banner-img{ font-size:0; *word-spacing:-1px;/* IE6、7 */ letter-spacing: -3px; position:relative;}
        .banner-img li{ display:inline-block;*display:inline;*zoom:1;/* IE6、7 */ vertical-align: top; letter-spacing: normal;word-spacing: normal; font-size:12px;}
        .banner i{ background:url(http://gtms01.alicdn.com/tps/i1/T1szNBFzlmXXX8QSDI-400-340.png)  no-repeat; width: 15px;height: 23px; cursor:pointer;margin: 8px 0 0 12px; display:block;}
        .banner .nextBtn i{ background-position:-200px -24px;}
        .banner .prevBtn i{ background-position:-200px 0px;}

        .banner-circle{ position:absolute; left:50%; bottom: 15px;height: 13px;text-align: center;font-size: 0;border-radius: 10px; background:rgba(255,255,255,0.3); filter:alpha(opacity:30); }
        .banner-circle li{ border-radius: 10px; margin:2px; display: inline-block; display: -moz-inline-stack; vertical-align: middle;zoom: 1; }
        .banner-circle li a{ display: block;padding-top: 9px;width: 9px;height: 0;border-radius: 50%; background: #B7B7B7;overflow: hidden;}
        .banner-circle .selected a{ background:#F40; }
    </style>
    
</head>
<body>
 <div class="header">
     <div class="logo"></div>
     <div class="search">
             <div class="search-box">
                 <form  action="/maileba/SearchServlet" method="post">
                     <input class="input"  placeholder="搜索你想要的二货" type="text" name="name"/>
                     <button class="submit" type="submit">搜索</button>
                 </form>
             </div>

         </div>
     <div class="button">
     		<c:if test="${empty user }">
				<a href="denglu.jsp">登录</a>
         		<a href="zhuce.jsp">注册</a>
			</c:if>
			<c:if test="${!empty user }">
			   	<p id="welcome">
				欢迎您,${user.username }
				</P>
				<a href="${pageContext.request.contextPath }/LogoutServlet">退出</a>
			</c:if>
     </div>
     <div class="clear:both"></div>
 </div>
<div class="banner1">
    <ul>
        <li><a href="school.html">校园代步</a>
            <ul class="c1">
                <li><a href="school.html">自行车</a></li>
                <li><a href="school.html">电动车</a></li>
            </ul>
          </li>

        <li><a href="shuma.html">数码产品</a>
            <ul class="c1">
                <li><a href="shuma.html">手机</a></li>
                <li><a href="shuma.html">电脑</a></li>
                <li><a href="shuma.html">台式机</a></li>
            </ul>
        </li>
        <li><a href="yundong.html">运动健身</a>
            <ul class="c1">
                <li><a href="yundong.html">篮球</a></li>
                <li><a href="yundong.html">足球</a></li>
                
                <li><a href="yundong.html">哑铃</a></li>
             
                <li><a href="yundong.html">其他</a></li>
            </ul>
        </li>
        <li><a href="cloth.html">衣物鞋帽</a>
            <ul class="c1">
                <li><a href="cloth.html">上衣</a></li>
                <li><a href="cloth.html">帽子</a></li>
                <li><a href="cloth.html">裤子</a></li>
                
                <li><a href="cloth.html">雨伞</a></li>
                <li><a href="cloth.html">鞋</a></li>

            </ul>

        </li>
        <li><a href="tushu.html">图书教材</a>
            <ul class="c1">
                <li><a href="tushu.html">教材</a></li>
                <li><a href="tushu.html">考研</a></li>
                <li><a href="tushu.html">英语四六级</a></li>
                <li><a href="tushu.html">托福、雅思、GRE</a></li>
            </ul>
        </li>
        <li><a href="zl">租赁信息</a>
            <ul class="c1">
                <li><a href="http://zu.changchun.fang.com/
                ">租房</a></li>
                <li><a href="http://cc.58.com/sou/pn1/jh_%E7%A7%9F%E6%BC%94%E5%87%BA%E6%9C%8D/
                ">服装</a></li>
                <li><a href="http://cc.ganji.com/fuzhuangzulin/
                ">道具</a></li>
                <li><a href="http://bj.58.com/
                ">其他</a></li>
            </ul>

        </li>
        <li><a href="live.html">生活娱乐</a>
            <ul class="c1">
                <li><a href="live.html">乐器</a></li>
                <li><a href="live.html">日常用品</a></li>
                <li><a href="live.html">虚拟账号</a></li>
                <li><a href="live.html">会员卡</a></li>
                <li><a href="live.html">化妆品</a></li>
                <li><a href="live.html">其他</a></li>
            </ul>
            </li>
	</ul>

</div>
<div class="bar">
    <div class="leftbar">
        <div class="like">
            <ul>
                <li><a href="">校园动态</a></li>
                <li><a href="">实时新闻</a></li>
                <li><a href="">明星八卦</a></li>
                <li><a href="">成绩查询</a></li>
                <li><a href="">考研交流</a></li>
                <li><a href="">帮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;助</a></li>
                <li><a href="">举&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;报</a></li>
                <li><a href="">用户反馈</a></li>
                <li><a href="">有奖问卷</a></li>
            </ul>
        </div>
        <div class="qiandao">
            <a href="">签到有奖</a>
        </div>
    </div>
 
   
    <div class="middlebar">
    
    <div class="lan">
        <p>购买须知</p>
        <a  href="">查看发布规则</a>
        <div class="iphone">
            <a href="">购买二手iphone注意事项</a>
        </div>
    </div>
        <div class="lan2">
            <a href="">最新发布</a>
        </div>
        <div class="lan3">
            <div align="center" style="width:700px; margin:0 auto">
                <div class="banner">
                    <div class="banner-btn">
                        <a href="javascript:;" class="prevBtn"><i></i></a>
                        <a href="javascript:;" class="nextBtn"><i></i></a>
                    </div>
                    <ul class="banner-img">
                        <li><a href="#"><img src="images/1.jpg"></a></li>
                        <li><a href="#"><img src="images/2.jpg"></a></li>
                        <li><a href="#"><img src="images/3.jpg"></a></li>
                        <li><a href="#"><img src="images/4.jpg"></a></li>
                        <li><a href="#"><img src="images/5.jpg"></a></li>
                        <li><a href="#"><img src="images/6.jpg"></a></li>
                    </ul>
                    <ul class="banner-circle"></ul>
                </div>
            </div>
        </div>
        </div>
        
   <%--  <div class="lan3">
          <table width="700px" border="1px">
                <c:forEach items="${ list}" var="list" varStatus="varSta">
				<tr>
					<th><font >编号</font></th>
					<td>${varSta.count}</td>
				</tr>
                <tr>
				<th>商品名称：</th>
					<td>${list.name}</td>
				</tr>
				<tr>
				<th>商品价格：</th>
					<td>${list.money}</td>
				</tr>
				<tr>
				<th>商品图片：</th>
					<td>${list.name}</td>
				</tr>
                </c:forEach>
            </table>

    </div>
        
    </div> --%>
    <div class="rightbar">
        <div class="fabu">
        	<c:if test="${!empty user }">
        		<a href="fabu.jsp">我要发布</a>
        	</c:if>
        	<c:if test="${empty user }">
        		<p id="dlhfb">登陆后发布</p>
        	</c:if>
        </div>
        <div class="erweima">
       <p>关注我们</p>
        </div>
        <div class="tu">
        </div>
        <div class="ad">
	        <div class="guanggao">
	        	<iframe id="iframe" src="block.html" frameborder=></iframe>
	        </div>
        </div>
    </div>
   
 
</div>
 
</div>
  <div class="clear:both"></div>
<div class="footer">
   <div class="link">
       <a href="">友情链接</a>
       <a  style="margin-left: 500px"href="">吉林工程技术师范学院</a>
       <p>2017-2019 版权归卖了吧所有</p>
   </div>
</div>

</body>
</html>