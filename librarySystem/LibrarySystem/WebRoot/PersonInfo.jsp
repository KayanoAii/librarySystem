<%@page import="javax.swing.text.Document"%>
<%@ page language="java" import="java.util.*,com.LibrarySystem.model.*" pageEncoding="UTF-8"%>
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
	function checkFile(){
		var file = document.getElementById("file_upload").files[0];
		if(file){
		alert(file.name);
		}else{
		alert("nothing!");
		}
		document.getElementById("idhidefile").value=file.name;
		var hidefile1=file.name;
		alert(document.getElementById("idhidefile").value);
		return true;
		}
	</script>
  </head>
  
  <body>
   <% 
   String userName=(String)request.getSession().getAttribute("username");
    ArrayList<Userbean> list=(ArrayList<Userbean>)request.getAttribute("list");  
    	Userbean ub=(Userbean)list.get(0);
    	String image="img/"+ub.getImage();
    	String sex=ub.getUsrsex();
    	String address=ub.getAddress();
    	String phonenumber=ub.getUsrtell();
    
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
		    	<li class="bar_5_li_1"><img id="userimg" class="bar_5_img" src="<%=image%>" >
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
      <img src="<%=image%>">
      <form action="UploadFileServlet"  enctype="multipart/form-data" name="form1"method="post"> 
    	<input type="file" name="fileupload" id="file_upload" accept="image/png,image/gif,image/jpg"> 
 
    	<input type="submit" value="修改图片">
    </form>
      </div>
      
      <div class="top_bot">
         <div class="top_bot_name">嘿嘿</div>
         <div class="top_bot_back">
         <a href="Info_1.jsp?username=<%=userName%>&sex=<%=sex %>&address=<%=address%>&phonenumber=<%=phonenumber%>">编辑个人资料</a>
      </div></div>
     
      <div class="info">
        <div>性别: <%=sex %></div>
        <hr style="margin-left:40px;margin-right:70px;border:0.5px solid #EBEEF5;"/>
        <div>地址: <%=address %></div>
        <hr style="margin-left:40px;margin-right:70px;border:0.5px solid #EBEEF5;"/> 
        <div>电话: <%=phonenumber %></div> 
     
      </div>
     
    </div>
  </div></div></body>
</html>
