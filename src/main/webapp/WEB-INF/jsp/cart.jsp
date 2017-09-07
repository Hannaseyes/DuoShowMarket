<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 购物车页面 -->
<!DOCTYPE html>
<html>
<head>
<title>购物车</title>
	<%@ include file="common_link.jsp" %>
	<script>
	$(document).ready(function(c) {
		var allTotalPrice = 0.00;
		$('.totalPrice').each(function(key,value){
			allTotalPrice = Number(Number(allTotalPrice) + Number($(this).html())).toFixed(2);
			$('#allTotalPrice').html(allTotalPrice);
			$('#finalPrice').html(Number(allTotalPrice-Number($('#preference').html())).toFixed(2));
		});	
			
		$('.quantity').click(function() {
			var finalPrice = 0.00;
			var num = $(this).val();
			var total=Number(Number(num)*Number($(this).siblings('span').html())).toFixed(2);
			$(this).siblings('h4').html(total);
			$('.totalPrice').each(function(key,value){
					finalPrice=Number(finalPrice+ Number($(this).html())).toFixed(2);
					$('#finalPrice').html(finalPrice);
				});
		});
		
		$('.close1').on('click', function(c){
			$('.cart-header').fadeOut('slow', function(c){
				$('.cart-header').remove();
			});
		});
	});
	function addOrder(){
		if(confirm("确定要提交订单吗？")){
			var goodsId = "";
			$('.goodsId').each(function (){
				goodsId = goodsId+$(this).text()+",";
			});
			var allTotalPrice = $("#allTotalPrice").text();
			if(allTotalPrice=="0.00"){
				alert("请添加购物车后再提交订单(^_−)☆");
				return;
			}
			var	finalPrice = $("#finalPrice").text();
			var address = $("#address option:selected").val();
			
			$.ajax({
				url : "user/addOrder",
				type : "post",
				data : {
					"goodsId" : goodsId,
					"allTotalPrice" : allTotalPrice,
					"finalPrice" : finalPrice,
					"address" : address
				},
				dataType : "text",
				success : function(data) {
					alert("付款成功！");
					window.location.reload();
				}
			});
		}
	}
	function deleteCartGoods(goodsId) {
		if(confirm("确定将此商品从购物车移除吗？")) {
			$.ajax({
				url : "user/deleteCartGoods",
				type : "post",
				data : {
					"goodsId" : goodsId
				},
				dataType : "text",
				success : function(data) {
					alert("移除成功ｂ（￣▽￣）ｄ");
					window.location.reload();
				}
			});
		}
	}
	</script>
</head>
<body>
	<div class="header2 text-center">
	 <%@ include file="common_head.jsp" %>
	</div>
<!--header//-->
<div class="cart">
	<div class="container">
		<ol class="breadcrumb">
			<li><a href="index/index">主页</a></li>
			<li class="active">购物车</li>
		</ol>
			
		<div class="col-md-9 cart-items">
			<h2>我的购物车</h2>
				<c:if test="${!empty cart}">
					<c:forEach items="${cart}" var="goods">
						<div class="cart-header">
							<div onclick="deleteCartGoods(${goods.id});" class="close1"> </div>
							<div class="cart-sec">
								<div class="cart-item cyc">
									<img src="${goods.picture}"/>
								</div>
								<div class="cart-item-info">
									<h3>${goods.name}<br>商品编号: <span class="goodsId">${goods.id}</span></h3>
									商品单价: <span>${goods.price}</span>
									<p class="qty">数量:</p>
									<input min="1" max="${goods.surplus}" type="number" id="quantity" name="quantity" value="${goods.goodsNumber}" class="quantity form-control input-small">
									<span>价格:</span>
									<h4 class="totalPrice">${goods.price * goods.goodsNumber}</h4>人民币
								</div>
								<div class="clearfix"></div>
								<div class="delivery">
									 <span>库存剩余${goods.surplus}件</span>
									 <div class="clearfix"></div>
								</div>									
							</div>
						</div>
					</c:forEach>		
				</c:if>
			<c:if test="${empty cart}">
				您的购物车空空如也，快去添加喜欢的商品吧ヾ(◍°∇°◍)ﾉﾞ！
			</c:if>
		</div>
		 
		<div class="col-md-3 cart-total">
			<a class="continue" href="index/index">继续购物</a>
			<div class="price-details">
				<h3>价格详情</h3>
				<span>商品价格</span>
				<span class="total" id="allTotalPrice">0.00</span>
				<span>优惠</span>
				<span class="total" id="preference">0.00</span>
				<div class="clearfix"></div>				 
			</div>	
			<h4 class="last-price">总计</h4>
			<span class="total final" id="finalPrice">0.00</span>
			<div class="clearfix"></div>
			<span class="h4">收货地址</span>
			<select id="address">
				<c:forEach items="${addressList}" var="address">
					<option>${address.address}</option>
				</c:forEach>
			</select>
			<a class="order" href="javascript:void(0);" onclick="addOrder();">付款</a>
		</div>
	</div>
</div>
<%@ include file="common_bottom.jsp" %>
</body>
</html>

