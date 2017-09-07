<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
$(function(){
		/* 获取类型列表和品牌列表 */
		$.ajax({
		url : "brand/brandCtrl",
		type : "post",
		async: false,
		dataType : "json",
		success : function(data) {
	         $.each(data, function (i, item) {
				 $("#type"+item.type).append("<li><a href='products.html'>"+item.name+"</a></li>");
				 $("#brand").append("<div class='col1'><div class='h_nav'><h4><a href='products.html'>"+item.name+"</a></h4></div></div>");
	         	}); 
			}
		});
	}
);
</script>
<div class="container">
	<div class="main-header">
		<div class="carting">
			<ul>
				<c:if test="${!empty users}">
					<c:forEach items="${users}" var="user">
						<li>${user.userName}</li>
						<span id="userId" hidden="hidden">${user.userId}</span>
					</c:forEach>
					<li><a href="user/logoutCtrl">注销</a></li>
				</c:if>
				<c:if test="${empty users}">
					<li><a href="page/login">用户登陆</a></li>
				</c:if>
				<c:if test="${warn=='fail'}">
					<script type="text/javascript">
						alert("用户名或密码不正确！");
					<%session.removeAttribute("warn");%>
					</script>
				</c:if>
				<c:if test="${warn=='login'}">
					<script type="text/javascript">
						alert("您已经登陆，请刷新页面或注销后重试！");
					<%session.removeAttribute("warn");%>
					</script>
				</c:if>
			</ul>
		</div>
		<div class="logo">
			<a href="index"><img src="<%=request.getSession().getServletContext().getRealPath("/")%>images/title.png" /></a>
		</div>
		<div class="box_1" style="background:#FFD000">
			<h3>
				<a href="cart" style="color:#FFD000"> 购物车: <span class="simpleCart_total"></span> (<span
					id="simpleCart_quantity" class="simpleCart_quantity"></span> 件)<img
					src="<%=request.getSession().getServletContext().getRealPath("/")%>images/cart.png" alt="" />
				</a>
			</h3>
			<p>
				<a href="javascript:void(0);" class="simpleCart_empty">购物车空</a>
			</p>
		</div>
	</div>
	
	<!-- 顶部导航栏 -->
	<ul class="megamenu skyblue">
		<li class="active grid"><a class="color1" href="index">朵Show主页</a></li>
		<li class="grid"><a href="#">奢侈品分类</a>
			<div class="megapanel">
				<div class="row">
					<div class="col1">
						<div class="h_nav">
							<h4>皮具</h4>
							<ul id="type1">
								<li><a href="products.html">${brand.name}</a></li>
							</ul>
						</div>
					</div>
					<div class="col1">
						<div class="h_nav">
							<h4>服装</h4>
							<ul id="type2">
								<li><a href="products.html">${brand.name}</a></li>
							</ul>
						</div>
					</div>
					<div class="col1">
						<div class="h_nav">
							<h4>珠宝</h4>
							<ul id="type3">
								<li><a href="products.html">${brand.name}</a></li>
							</ul>
						</div>
					</div>
					<div class="col1">
						<div class="h_nav">
							<h4>名表</h4>
							<ul id="type4">
								<li><a href="products.html">${brand.name}</a></li>
							</ul>
						</div>
					</div>
					<div class="col1">
						<div class="h_nav">
							<h4>化妆品</h4>
							<ul id="type5">
								<li><a href="products.html">${brand.name}</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col2"></div>
					<div class="col1"></div>
					<div class="col1"></div>
					<div class="col1"></div>
					<div class="col1"></div>
				</div>
			</div></li>
		<li><a href="#">奢侈品牌</a>
			<div class="megapanel">
				<div class="row"  id="brand">
				</div>
			</div></li>
		<li class="grid"><a href="about">了解朵Show</a></li>
		<li class="grid"><a href="blog">奢侈品定制</a></li>
	</ul>
</div>
</body>