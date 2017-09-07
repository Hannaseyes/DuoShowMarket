<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>朵SHOW-欢迎登录</title>
<%@ include file="common_link.jsp" %>
<!-- start menu -->
<link href="css/megamenu.css" rel="stylesheet" type="text/css"
	media="all" />
<script type="text/javascript" src="js/megamenu.js"></script>
<!-- start menu -->
</head>
<body>
	<!--header-->
	<div class="header2 text-center">
		<%@ include file="common_head.jsp" %>
		<div class="clearfix"></div>
	</div>
	<!--header//-->
	<div class="login">
		<div class="container">
			<ol class="breadcrumb">
				<li><a href="index/index">主页</a></li>
				<li class="active">用户登录</li>
			</ol>
			<h2>用户登录</h2>
			<div class="col-md-6 log">
				<p>欢迎登录</p>
				<p>
					如果您还没有朵SHOW账号<a href="page/registration">点此注册</a>
				</p>
				<form action="user/loginCtrl" method="post" class="form-horizontal" id="loginForm">
					<div class="form-group">
						<label class="col-lg-2 control-label">用户名:</label>
						<input id="username" class="form-control" type="text" value="" name="username"
						 placeholder="请输入用户名...">
					</div>
					<div class="form-group">
						<label class="col-lg-2 control-label">密码:</label>
						<input id="password" class="form-control" type="password" value="" name="password" 
						placeholder="请输入密码...">
					</div>
					<div class="form-group">
						<label class="col-lg-2 control-label">验证码:</label>
						<input id="kaptcha" class="form-control" value="" name="kaptcha" 
						placeholder="验证码...">&nbsp;&nbsp;<img src="kaptcha.jpg" />
					</div>
					
					<span id="errorSpan" class="text-danger"></span>
					<div class="form-group">
						<input id="login" value="登录" class="btn btn-primary">
					</div>
				</form>
			</div>
			<div class="col-md-6 login-right">
				<h3>注册您的朵Show账号</h3>
				<p>通过注册朵Show账号，你将可以使用更多我们为您提供的的个性化推荐功能，购买和浏览更多的商品，
					同时可以更方便购买我们的商品，朵Show为您提供精致的服务和优质的商品。
				</p>
				<a class="acount-btn" href="page/registration">注册账号</a>
			</div>
			<div class="clearfix"></div>

		</div>
	</div>
			<%@ include file="common_bottom.jsp" %>
</body>
<script type="text/javascript">
   // 验证表单
   $(function() {
	   $("#login").click(function(){
		   var username = $("#username").val();
		   var password = $("#password").val();
		   var kaptcha = $("#kaptcha").val();
		   if(username!="" && password!="" && kaptcha!=""){
			   $("#loginForm").submit();
		   }else{
			   $("#errorSpan").html("输入不能为空");
		   }
	   });
	   $(".megamenu").megamenu();
   });
</script>
</html>
