<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">   
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="css/login_q.css">
  </head>
  
  <body>
  <%
    String flag=(String)request.getAttribute("flag");
    if(flag!=null&&flag=="passError"){
    	out.println("<script>alert('密码错误，请检查')</script>");
    }
    if(flag!=null&&flag=="nameError"){
    	out.println("<script>alert('用户名错误，请检查')</script>");
    }
    if(flag!=null&&flag=="success"){
    	out.println("<script>alert('注册成功')</script>");
    }
    if(flag!=null&&flag=="fail"){
    	out.println("<script>alert('注册失败')</script>");
    }
  %>
  <canvas id="Mycanvas"></canvas>
  <div class="top_top"> B O O K</div>
  <div class="top_butttom">welcome to library system</div>
  <div class="mid_left" style="border-bottom:3px solid #0F88EB;" >登录</div>
  <div class="mid_right"><a href="Register.jsp">注册</a></div>
  
  <form class="login" onsubmit="return isEmpty()" method="post" action="LoginServlet">
    <input type="text" class="login_" placeholder="账号" id="username" name="username">
    <input type="password" class="login_" placeholder="密码" id="userpass" name="userpass">
    <input typee="text" class="login_" placeholder="验证码">
    <input type="submit" value="登    录" class="sub">
  </form>
  </body>
  
  <script>
	//定义画布宽高和生成点的个数
	var WIDTH = window.innerWidth, HEIGHT = window.innerHeight, POINT = 35;
	
	var canvas = document.getElementById('Mycanvas');
	canvas.width = WIDTH,
	canvas.height = HEIGHT;
	var context = canvas.getContext('2d');
	context.strokeStyle = 'rgba(0,0,0,0.02)',
	context.strokeWidth = 1,
	context.fillStyle = 'rgba(0,0,0,0.05)';
	var circleArr = [];

	//线条：开始xy坐标，结束xy坐标，线条透明度
	function Line (x, y, _x, _y, o) {
		this.beginX = x,
		this.beginY = y,
		this.closeX = _x,
		this.closeY = _y,
		this.o = o;
	}
	//点：圆心xy坐标，半径，每帧移动xy的距离
	function Circle (x, y, r, moveX, moveY) {
		this.x = x,
		this.y = y,
		this.r = r,
		this.moveX = moveX,
		this.moveY = moveY;
	}
	//生成max和min之间的随机数
	function num (max, _min) {
		var min = arguments[1] || 0;
		return Math.floor(Math.random()*(max-min+1)+min);
	}
	// 绘制原点
	function drawCricle (cxt, x, y, r, moveX, moveY) {
		var circle = new Circle(x, y, r, moveX, moveY)
		cxt.beginPath()
		cxt.arc(circle.x, circle.y, circle.r, 0, 2*Math.PI)
		cxt.closePath()
		cxt.fill();
		return circle;
	}
	//绘制线条
	function drawLine (cxt, x, y, _x, _y, o) {
		var line = new Line(x, y, _x, _y, o)
		cxt.beginPath()
		cxt.strokeStyle = 'rgba(0,0,0,'+ o +')'
		cxt.moveTo(line.beginX, line.beginY)
		cxt.lineTo(line.closeX, line.closeY)
		cxt.closePath()
		cxt.stroke();

	}
	//初始化生成原点
	function init () {
		circleArr = [];
		for (var i = 0; i < POINT; i++) {
			circleArr.push(drawCricle(context, num(WIDTH), num(HEIGHT), num(15, 2), num(10, -10)/40, num(10, -10)/40));
		}
		draw();
	}

	//每帧绘制
	function draw () {
		context.clearRect(0,0,canvas.width, canvas.height);
		for (var i = 0; i < POINT; i++) {
			drawCricle(context, circleArr[i].x, circleArr[i].y, circleArr[i].r);
		}
		for (var i = 0; i < POINT; i++) {
			for (var j = 0; j < POINT; j++) {
				if (i + j < POINT) {
					var A = Math.abs(circleArr[i+j].x - circleArr[i].x),
						B = Math.abs(circleArr[i+j].y - circleArr[i].y);
					var lineLength = Math.sqrt(A*A + B*B);
					var C = 1/lineLength*7-0.009;
					var lineOpacity = C > 0.03 ? 0.03 : C;
					if (lineOpacity > 0) {
						drawLine(context, circleArr[i].x, circleArr[i].y, circleArr[i+j].x, circleArr[i+j].y, lineOpacity);
					}
				}
			}
		}
	}

	//调用执行
	window.onload = function () {
		init();
		setInterval(function () {
			for (var i = 0; i < POINT; i++) {
				var cir = circleArr[i];
				cir.x += cir.moveX;
				cir.y += cir.moveY;
				if (cir.x > WIDTH) cir.x = 0;
				else if (cir.x < 0) cir.x = WIDTH;
				if (cir.y > HEIGHT) cir.y = 0;
				else if (cir.y < 0) cir.y = HEIGHT;
				
			}
			draw();
		}, 16);
	}

</script>

<script>
function isEmpty()
{
	var name = document.getElementById("username").value;
	var pass = document.getElementById("userpass").value;
	if(name=="" || pass=="")
	{
		alert("用户名或密码不可为空！");
		return false;
	}
	return true;
}
</script>
</html>
