<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">  
    <title>Info</title>
	<link rel="stylesheet" type="text/css" href="css/info.css">
	<script type="text/javascript" language="javascript" src="js/jquery-3.2.1.min.js"></script>
	
	<script>
		function submit(){
			alert("a");
			var form=document.getElementsByName("form");
			//form.action="PersonInfoUpdateServlet";
			form.submit();
		}
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
  <% 
  	String sex=(String)request.getParameter("sex");
 	String address=(String)request.getParameter("address");
	String phonenumber=(String)request.getParameter("phonenumber");
	System.out.println("[]"+sex);
  
  %>
  
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
  <div class="all_top"></div>
  <div class="all">
    <div class="top">
      <div class="top_top"></div>
      <div class="pic">
        <img src="img/pic.png">
      </div>
      <form action="PersonInfoUpdateServlet?flag=change3F" name="form" method="post">
      <div class="top_bot">
         <div class="top_bot_name">嘿嘿</div>
         <div class="top_bot_back"><input type="submit" value="保 存"></div>
      </div>
      <div class="info">
         <div>性别:<input type="text" name="sex" value=<%=sex %>></div>
        <hr style="margin-left:40px;margin-right:70px;border:0.5px solid #EBEEF5;"/>
        <div>地址:<input type="text" name="address" value=<%=address %>></div>
        <hr style="margin-left:40px;margin-right:70px;border:0.5px solid #EBEEF5;"/> 
        <div>电话:<input type="text" name="phonenumber" value=<%=phonenumber %>></div> 
      </div>
      </form>
    </div>
  </div>
</html>
