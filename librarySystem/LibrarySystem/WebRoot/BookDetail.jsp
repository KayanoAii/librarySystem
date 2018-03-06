<%@page import="com.LibrarySystem.model.Bookbean"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">  
    <title>Detail</title>
	<link rel="stylesheet" type="text/css" href="css/bookdetail.css">
	<script type="text/javascript" language="javascript" src="js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(
			function(){
				$(".bar_5_li_1").hover(
					function(){
						$(this).find("ul").stop(true,true).slideDown(500);
					},	
					function(){
						$(this).find("ul").stop(true,true).slideUp("fast");
					}
				)
		});
	</script>
  </head>
  
  <body>
  
  <div class="bar">
    <div class="bar_1">Library</div>
    <div class="bar_2" ><a href="CategorySearchServlet">首页</a></div>
    <div class="bar_2"><a href="CategorySearchServlet">资源</a></div>
    <div class="bar_3_all">
      <input type="text" class="bar_3">
      <input type="submit" value="搜 索" class="bar_4">
    </div>
     <div class="bar_5">
	    	<ul>
		    	<li class="bar_5_li_1"><img id="userimg" class="bar_5_img" src="img/pic.png">
		    	<ul class="bar_5_ul_2">
			    	<li class="bar_5_li_2"><a href="PersonInfoShowServlet">个人信息</a></li>
			    	<li class="bar_5_li_2"><a href= "PersonBookShowServlet">借阅详情</a></li>
		    	</ul>
		    	</li>
	    	</ul>
	    </div>
  </div>
  <%String bookname=request.getParameter("bookname");
  		String author=request.getParameter("author");
  		String press=request.getParameter("press");
  		String yearofpublication=request.getParameter("yearofpublication");
  		String ISBN=request.getParameter("ISBN");
  		String num=request.getParameter("num");
  		String image=request.getParameter("image1");
  		%>
  <div class="top_top"></div>
  <div class="detail-top">
  </div> 
  <div class="detail-body">
  	<div class="detail-body-top">
  		<div class="detail-body-top-img">
  			<img class=".tuijian-cell-img" src="img/<%=image %>">
  		</div>
  		
  		<div class="detail-title">
  			<%=bookname %>
  					</div>
  		<div class="detail-middle-1">
  			<div class="detail-middle-2">作者：</div><div class="detail-middle-3"><%=author %></div>
  		</div>
  		<div class="detail-middle-1">
  			<div class="detail-middle-2">出版社：</div><div class="detail-middle-3"><%=press%></div>
  		</div>
  		<div class="detail-middle-1">
  			<div class="detail-middle-2">出版年：</div><div class="detail-middle-3"><%=yearofpublication %></div>
  		</div>
  		<div class="detail-middle-1">
  			<div class="detail-middle-2">页数：</div><div class="detail-middle-3">224</div>
  		</div>
  		<div class="detail-middle-1">
  			<div class="detail-middle-2">ISBN：</div><div class="detail-middle-3"><%=ISBN %></div>
  		</div>
  		<div class="detail-middle-1">
  			<div class="detail-middle-2">可借数：</div><div class="detail-middle-3"><%=num %></div>
  		</div>
  
  		<div class="detail-bottom">
  			<form action="BorrowOrReturnServlet">
  			<input type="button" class="detail-button-1" value="阅读">
  			<input type="hidden" name="ISBN" value="<%=ISBN %>">
  			<input type="submit" name="borrowOrReturn"class="detail-button-2" value="借阅">
  			</form>
  			<div class="comment">
  				<img src="img/comment.png">
  				评论
  			</div>
  		</div>
  	</div>
  	<div class="detail-body-bottom">
  		<div class="detail-bottom-title">
  			图书简介
  		</div>
  		<div class="line"></div>
  		<div class="detail-bottom-body">
  			每个屋子里都藏着特有的寂静
  		</div>
  	</div>
  	
  	<div class="detail-body-bottom">
  		<div class="detail-bottom-title">
  			图书评论（）
  		</div>
  		<div class="line"></div>
  		<div class="detail-bottom-body">
  		</div>
  	</div>
  </div>
  
  </body>
</html>
