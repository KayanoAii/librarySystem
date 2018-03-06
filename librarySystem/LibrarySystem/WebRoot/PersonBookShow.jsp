<%@page import="com.LibrarySystem.model.Gadget"%>
<%@page import="com.LibrarySystem.model.OperateToDB"%>
<%@page import="com.LibrarySystem.model.LendInfobean"%>
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
	<link rel="stylesheet" type="text/css" href="css/PersonBookShow.css">
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
		function checkForReturn(form){
			var returnT=form.returntime.value;
			if(returnT.equals(null))
				return false;
			else return true;
		}
		function checkAll(checkbox){
			var checkall = document.getElementsByName("checkbox");
			for(var j=0;j<checkall.length;j++){
				if(checkall[j].type="checkbox"){
					checkall[j].checked=checkbox;
				}
			}
		}
	</script>
  </head>
  <body>
	  <%  ArrayList<LendInfobean> list=(ArrayList<LendInfobean>)request.getAttribute("list");%>
	  <div class="bar">
	    <div class="bar_1">Library</div>    
	    <div class="bar_2" ><a href="CategorySearchServlet">首页</a></div>
    	<div class="bar_2"><a href="CategorySearchServlet">资源</a></div>
	    <form name="form" action="SearchServlet" > 
	     <div class="bar_3_all">
	      	<input type="text" class="bar_3" name="searchItem">
	      	<input type="submit" value="搜 索" class="bar_4">
	   	 </div> 
	    </form> 
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
	  	&nbsp;你的借阅
	  </div>
	  <div class="lend_body">
	  	<div class="lend_body1">
	  		<img src="img/pic.png">
	  	</div>
	  	<div class="lend_body2">
	  		<div class="lend_body2-1">借阅图书</div>
	  		<div class="lend_body2-2">共&nbsp;&nbsp;&nbsp;<input type="text" value="<%=list.size()%>">本书籍</div>
	  	</div>
	  	
	  	<div class="lend_body3">
		  	<table>
			  	<thead>
   					<th width="23"><input name="checkbox" type="checkbox" value="" onClick="checkAll(this.checked)"/></th>
					<th width="421">书名</th>
					<th width="121">借书时间</th>
					<th width="91">应还时间</th>
					<th width="91">操作</th>
				</thead>
			  	<%
				    for(int i=0;i<list.size();i++){
				    	LendInfobean e=list.get(i);
				    	String bookName=e.getBookname();
				    	String ISBN=e.getISBN();
				    	String userName=e.getUsername();
				    	String borrowtime=e.getBorrowT();
				    	String shouldT=Gadget.plusDay(30, borrowtime);
				    	String returnT=e.getReturnT();
			    %>
			    <form name="form<%=i %>" onsubmit="return checkForReturn()" action="BorrowOrReturnServlet">
				   <tbody>  
					   <tr>
   						<td class="checkBox"><input name="checkbox" type="checkbox" value="" /></td>
						<td><%=bookName %></td>
						<td><%=borrowtime %></td>
						<td><%=shouldT %></td>
					    <td> <input type="submit" name="borrowOrReturn" value="还书" class="returnbutton"></td>
					    <td><input type="hidden" name="ISBN" value="<%=ISBN %>"></input></td>
					    <td><input type="hidden" name="username" value="<%=userName  %>"></input></td>
					    <td><input type="hidden" name="returntime" value="<%=returnT %>"></input></td>
					    <td><input type="hidden" name="borrowtime" value="<%=borrowtime %>"></input></td>
					   </tr>
				   </tbody>
				</form>
			    <% }%>
		    </table>
	  	</div>
	  </div> 
	</body>
</html>
