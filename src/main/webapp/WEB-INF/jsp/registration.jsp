<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>朵SHOW-注册新用户</title>
<%@ include file="common_link.jsp"%>
<script>
	$(document).ready(function() {
		$(".megamenu").megamenu();
	});
	function registrationAjax() {// ajax加载
		// 获取输入的值
		var username = $("#username").val();
		var password = $("#password").val();
		var rePassword = $("#rePassword").val();
		var address = $("#address").val();
		var preference="";
		// 验证正则
		var usernamereg = /([a-zA-Z0-9]*[a-zA-Z][a-zA-Z0-9]*){5,15}/; 
		var usernamere = new RegExp(usernamereg);
		var passwordreg = /^(?![0-9]+$)(?![a-zA-Z]+$)(?!([^(0-9a-zA-Z)]|[\(\)])+$)([^(0-9a-zA-Z)]|[\(\)]|[a-zA-Z]|[0-9]){6,}$/; 
		var passwordre = new RegExp(passwordreg);
		
		// 设置感兴趣的商品
		$('input[name="preference"]:checked').each(function(){ 
			preference+=$(this).val()+','; 
		}); 
		if (preference.length<3) {
			$("#errorSpan").html("请至少选择三项您感兴趣的商品类型");
		}else if(username==""||password==""||rePassword==""||address==""){
			preference = preference.substring(0,preference.length - 1); 
			$("#errorSpan").html("输入内容不能为空");
		}else if (!usernamere.test(username)){
			$("#errorSpan").html("用户名应为5-15位字母或字母数字组合");
		}else if (!passwordre.test(password)) {
			$("#errorSpan").html("密码应为6位以上字母数字或特殊符号的组合");
		}else if (password != rePassword) {
			$("#errorSpan").html("两次输入密码不一致");
		}else {
			$.ajax({
				url : "user/registrationCtrl",
				type : "post",
				data : {
					"username" : username,
					"password" : password,
					"address" : address,
					"preference" : preference
				},
				dataType : "text",
				success : function(data) {
					alert(data);
					$("#password").val("");
					$("#username").val("");
					$("#rePassword").val("");
					window.location.href = 'page/login';
				}
			});
		}
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
						<div class="form-group">
							<label class="col-lg-2 control-label">用户名:</label>
							<input id="username" name="username" type="text"
								value="" class="form-control">
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">密码:</label>
							<input id="password" name="password" type="password"
								value="" class="form-control">
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">再次输入:</label>
							<input id="rePassword" type="password" value="" class="form-control">
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">收货地址:</label>
							<input id="address" type="text" value="" class="form-control">
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">选择喜好:</label>
							<label class="checkbox-inline">
								<input name="preference" type="checkbox" value="1">皮具
							</label>
							<label class="checkbox-inline">
								<input name="preference" type="checkbox" value="2">服装
							</label>
							<label class="checkbox-inline">
								<input name="preference" type="checkbox" value="3">珠宝
							</label>
							<label class="checkbox-inline">
								<input name="preference" type="checkbox" value="4">名表
							</label>
							<label class="checkbox-inline">
								<input name="preference" type="checkbox" value="5">化妆品
							</label>
						</div>
						<span id="errorSpan" class="text-danger"></span>
						<div class="form-group">
							<input class="btn btn-primary" value="注册" onclick="registrationAjax()">
						</div>
						
						<p class="click">
							注册表示您同意使用条款，解释权归朵Show所有。
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
