<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>注册新用户</title>
<%@ include file="common_link.jsp"%>
<script>
	$(document).ready(function() {
		$(".megamenu").megamenu();
	});
	function registrationAjax() {//ajax加载
		var username = $("#username").val();
		var password = $("#password").val();
		$.ajax({
			url : "registrationCtrl",
			type : "post",
			data : {
				"username" : username,
				"password" : password
			},
			dataType : "text",
			success : function(data) {
				alert("注册成功，欢迎您，尊贵的朵SHOW会员！");
				$("#password").val("");
				$("#username").val("");
				$("#password2").val("");
				window.location.href = 'login';
			}
		});

	}
</script>
</head>
<body>
	<!--header-->
	<div class="header2 text-center">
		<%@ include file="common_head.jsp"%>
	</div>
	<!--header//-->
	<div class="registration-form">
		<div class="container">
			<ol class="breadcrumb">
				<li><a href="index/index">主页</a></li>
				<li class="active">注册</li>
			</ol>
			<h2>注册新用户</h2>
			<div class="col-md-6 reg-form">
				<div class="reg">
					<p>欢迎注册朵Show用户！</p>
					<p>
						已注册, <a href="page/login">点此登陆</a>
					</p>
					<form>
						<ul>
							<li class="text-info">用户名:</li>
							<li><input id="username" name="username" type="text"
								value=""></li>
						</ul>
						<ul>
							<li class="text-info">密码:</li>
							<li><input id="password" name="password" type="password"
								value=""></li>
						</ul>
						<ul>
							<li class="text-info">再次输入密码:</li>
							<li><input id="password2" type="password" value=""></li>
						</ul>
						<input class="btn" type="button" value="注册" onclick="registrationAjax()">
						<p class="click">
							注册表示您同意我们的使用条款，解释权归朵Show所有。
						</p>
					</form>
				</div>
			</div>
			<div class="col-md-6 reg-right">
				<h3>注册用户完全免费</h3>
				<p>我们的用户注册完全免费，不会在注册过程中收取任何费用，您只需要输入您的用户名和密码即可轻松注册，
				朵Show向用户保证不会泄露任何用户的个人信息，包括用户名、密码、邮箱、收货地址等。</p>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<%@ include file="common_bottom.jsp"%>
</body>
</html>
