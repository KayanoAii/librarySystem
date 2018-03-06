<%@page import="com.LibrarySystem.model.*"%>

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
	<link rel="stylesheet" type="text/css" href="css/Index_q.css">
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
	  <form name="form" action="SearchServlet" > 
	     <div class="bar_3_all">
	      	<input type="text" class="bar_3" name="searchItem">
	    	<input type="radio" name="field" value="name" checked="checked">书名
	    	<input type="radio" name="field" value="author">作者
	      	<input type="submit" value="搜 索" class="bar_4">
	    </div> 
     </form> 
 <!--   --> 
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
  <div class="top_top" style="border:none;"></div>
  <div class="tuijian-body" style="border:1px solid #E1E4E7;">
  <%
  ArrayList<Bookbean> list=(ArrayList)request.getAttribute("list");
  if(list!=null){
    	System.out.println(list.size());
    	Bookbean ub=null;
    	
  		for(int i=0;i<list.size();i++){
			ub=(Bookbean)list.get(i);
			String bookName=ub.getName();
			System.out.println(bookName);
			String author=ub.getAuthor();
			System.out.println(author);
			String ISBN=ub.getISBN();
			String image=ub.getImage();
			int num=ub.getNumber();
	%> 
  <form name="form<%=i%>"  action="BookDetail.jsp" onsubmit="return setOnebook">
  	<div class="tuijian-cell" style="margin-top:100px;">
  	  <div style="float:left;">
  	  	<input class="tuijian-cell-input" type="image" src="img/<%=image%>">
  	  </div><br/>
  	  <div style="float:left;">
  		<div class="introduce"><%=bookName%></div>
  		<div class="author"><%=author%></div>
  		<div class="value"><%=ub.getCategory()%></div>
  		<input type="submit"  value="图书详情" class="detailbutton">  
  	  </div>
        <input type="hidden" name="ISBN"  value=<%=ISBN %>>
        <input type="hidden" name="author" value=<%=author%>>
        <input type="hidden" name="bookname" value=<%=bookName%> >
        <input type="hidden" name="num" value=<%=num%> >
        <input type="hidden" name="press" value=<%=ub.getPress() %> >
        <input type="hidden" name="yearofpublication" value=<%=ub.getYearofpublication() %> >
        <input type="hidden" name="image1" value="<%=image %>" >
  	</div>
  	</form>
  	 <% }}%>
  	
  </div>
  

  </body>
</html>
