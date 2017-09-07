<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 商品列表页面 -->
<!DOCTYPE html>
<html>
<head>
<title>朵SHOW-商品列表</title>
<%@ include file="common_link.jsp" %>
<script src="js/simpleCart.min.js"> </script>
<script>
function brandGoods(brandId){
	window.location.href = "brand/getBrandGoods?brandId="+brandId;
}

function single(id) {
	// 跳转商品详情
	window.location.href="page/single?id="+id;
}

function addCart(id) {
	var goodsNumber = 1;
	// 添加到购物车
	$.ajax({
		url : "user/addCart",
		type : "post",
		dataType : "text",
		data : {
				"id" : id,
				"goodsNumber" : goodsNumber},
		success : function(data) {	
     		alert("添加购物车成功！");
		}
	});
}
</script>
</head>
<body>
<!--header-->
<div class="header2 text-center">
	<%@ include file="common_head.jsp" %>
</div>
<!--header//-->
<div class="product-model">	 
	 <div class="container">
		 <ol class="breadcrumb">
		  <li><a href="index.html">主页</a></li>
		  <li class="active">商品列表</li>
		 </ol>
			<h2>商品列表</h2>			
		 <div class="col-md-9 product-model-sec">
		  	<c:if test="${empty newGoodsList}">
        		对不起，没有找到您想要的商品o(╥﹏╥)o
 			</c:if>
		 	<c:forEach items="${newGoodsList}" var="goods">
					 <div class="product-grid love-grid">
						<div class="more-product"><span> </span></div>						
						<div class="product-img b-link-stripe b-animate-go  thickbox">
							<img src="${goods.picture}" class="img-responsive" alt=""/>
							<div class="b-wrapper">
							<h4 class="b-animate b-from-left  b-delay03">							
							<button class="btns" onclick="single(${goods.id});">详情</button>
							</h4>
							</div>
						</div>					
						<div class="product-info simpleCart_shelfItem">
							<div class="product-info-cust">
								<h4>${goods.name}</h4>
								<span class="item_price">￥${goods.price}</span>
								<input onclick="addCart(${goods.id});" type="button" class="item_add items" value="加入购物车">
							</div>											
							<div class="clearfix"> </div>
						</div>
					</div>
				</c:forEach>
			</div>

			<div class="rsidebar span_1_of_left">
				<section  class="sky-form">
					<div class="product_right">
						<h3 class="m_2">分类</h3>
						
						<c:forEach items="${brandList}" var="brand">
							<div class="tab1" onclick="brandGoods(${brand.id})">
								<ul class="place">								
									<li class="sort">${brand.name}</li>
									<div class="clearfix"> </div>
								</ul>
							</div>
						</c:forEach>					  
					</div>
				</section>      
			 </div>			 
			 <div class="clearfix"></div>
		</div>
	</div>
	<%@ include file="common_bottom.jsp" %>
</body>
</html>