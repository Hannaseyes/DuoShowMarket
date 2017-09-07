<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 购物车页面 -->
<!DOCTYPE html>
<html>
<head>
<title>购物车</title>
	<%@ include file="common_link.jsp" %>
</head>
<body>
	<div class="header2 text-center">
	 <%@ include file="common_head.jsp" %>
	</div>
<!--header//-->
<div class="cart">
	 <div class="container">
			 <ol class="breadcrumb">
		  <li><a href="men.jsp">主页</a></li>
		  <li class="active">购物车</li>
		 </ol>
		 <div class="cart-top">
			<a href="index">返回主页</a>
		 </div>	
			
		 <div class="col-md-9 cart-items">
			 <h2>我的购物车</h2>
				<script>$(document).ready(function(c) {
					$('.close1').on('click', function(c){
						$('.cart-header').fadeOut('slow', function(c){
							$('.cart-header').remove();
						});
						});	  
					});
			   </script>
			 <div class="cart-header">
				 <div class="close1"> </div>
				 <div class="cart-sec">
						<div class="cart-item cyc">
							 <img src=""/>
						</div>
					   <div class="cart-item-info">
							 <h3>口红<span>商品编号: 3578</span></h3>
							 <h4><span>价格 </span>150.00</h4>
							 <p class="qty">数量:</p>
							 <input min="1" type="number" id="quantity" name="quantity" value="1" class="form-control input-small">
					   </div>
					   <div class="clearfix"></div>
						<div class="delivery">
							 <p>折扣50.00</p>
							 <span>一个月售出358件</span>
							 <div class="clearfix"></div>
				        </div>						
				  </div>
			 </div>
			 <script>$(document).ready(function(c) {
					$('.close2').on('click', function(c){
							$('.cart-header2').fadeOut('slow', function(c){
						$('.cart-header2').remove();
					});
					});	  
					});
			 </script>	
		 </div>
		 
		 <div class="col-md-3 cart-total">
			 <a class="continue" href="#">继续购物</a>
			 <div class="price-details">
				 <h3>价格详情</h3>
				 <span>商品价格</span>
				 <span class="total">150.00</span>
				 <span>折扣</span>
				 <span class="total">50.00</span>
				 <span>手续费</span>
				 <span class="total">0.00</span>
				 <div class="clearfix"></div>				 
			 </div>	
			 <h4 class="last-price">总计</h4>
			 <span class="total final">100.00</span>
			 <div class="clearfix"></div>
			 <a class="order" href="#">付款</a>
			 <div class="total-item">
				 <p><a href="#">登录</a>开始你的购物之旅！</p>
			 </div>
			</div>
	 </div>
</div>
<%@ include file="common_bottom.jsp" %>
</body>
</html>

