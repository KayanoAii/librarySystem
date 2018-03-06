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
  
  <div class="top_top"></div>
  <div class="tuijian-top">
  	<div class="tuijian-bar-left">精选推荐</div>
  	<div class="tuijian-bar-right">查看全部书目</div>
  </div> 
  <div class="tuijian-body">  	
  	<%
  
  ArrayList<Book> chart=(ArrayList<Book>)request.getAttribute("bookChart");
  	if(chart!=null){
    	System.out.println("char的size"+chart.size());
    	Book chBook=null;
    	
  		for(int i=0;i<chart.size();i++){
  			chBook=(Book)chart.get(i);
  			String ISBN=chBook.getISBN();
			String bookName=chBook.getName();
			String author=chBook.getAuthor();
			String press=chBook.getPublisher();
			String yearofpublication=chBook.getPublicationDate();
			String category=chBook.getCatagory();
			String image=chBook.getImage();
			int num=chBook.getInventoryCount();
	%> 

  <form name="form<%=i%>"  action="BookDetail.jsp" >
  	<div class="tuijian-cell">
  		<!--  <img class="img" src="img/63303367_p0.jpg">-->
  		<input class="tuijian-cell-input" type="image" name="image"src="img/<%=image%>">
  		<div class="introduce"><%=bookName%></div>
  		<div class="author"><%=author%></div>
  		<div class="value"><%=category%></div>
        <input type="hidden" name="ISBN"  value=<%=ISBN %>>
        <input type="hidden" name="author" value=<%=author%>>
        <input type="hidden" name="bookname" value=<%=bookName%> >
        <input type="hidden" name="num" value=<%=num%> >
        <input type="hidden" name="press" value=<%=press %> >
        <input type="hidden" name="yearofpublication" value=<%=yearofpublication %> >
        <input type="hidden" name="image1" value=<%=image %>>
        <input type="submit"  value="图书详情" class="detailbutton">
  	</div>
  	</form>
  	 <% }}%>
  </div>
  
  <div class="search-top" id="aim">
  	<div class="search-bar-left">分类</div>
  </div>
  <div class="search-bar-bottom">
  	<ul>
  		<li><a href="CategorySearchServlet?categoryflag=人文社科">人文社科</a></li>
  		<li><a href="CategorySearchServlet?categoryflag=职场成长">职场成长</a></li>
  		<li><a href="CategorySearchServlet?categoryflag=生活方式">生活方式</a></li>
  		<li><a href="CategorySearchServlet?categoryflag=文化艺术">文化艺术</a></li>
  		<li><a href="CategorySearchServlet?categoryflag=技能学习">技能学习</a></li>
  		<li><a href="CategorySearchServlet?categoryflag=商业经济">商业经济</a></li>
  		<li><a href="CategorySearchServlet?categoryflag=心理情感">心理情感</a></li>
  	</ul>
  </div>
 <div class="tuijian-body">
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
  	<div class="tuijian-cell">
  		<!--  <img class="img" src="img/63303367_p0.jpg">-->
  	  		<input class="tuijian-cell-input" type="image" src="img/<%=image%>">
  		<div class="introduce"><%=bookName%></div>
  		<div class="author"><%=author%></div>
  		<div class="value"><%=ub.getCategory()%></div>
        <input type="hidden" name="ISBN"  value=<%=ISBN %>>
        <input type="hidden" name="author" value=<%=author%>>
        <input type="hidden" name="bookname" value=<%=bookName%> >
        <input type="hidden" name="num" value=<%=num%> >
        <input type="hidden" name="press" value=<%=ub.getPress() %> >
        <input type="hidden" name="yearofpublication" value=<%=ub.getYearofpublication() %> >
        <input type="submit"  value="图书详情" class="detailbutton">  
  	</div>
  	</form>
  	 <% }}%>
  	
  </div>
  </body>
</html>
