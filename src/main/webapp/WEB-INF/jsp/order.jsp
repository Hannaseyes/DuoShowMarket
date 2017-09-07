<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 购物车页面 -->
<!DOCTYPE html>
<html>
<head>
<title>购物车</title>
	<%@ include file="common_link.jsp" %>
</head>
<script type="text/javascript">
function goPay(goodsId,status,orderNumber){
	var warn ="付款";
	if (status=="0"){
		 warn="付款";
	}else if (status=="1"){
		 warn="确认收货";
	}else if (status=="2"){
		window.location.href="user/commentGoods?goodsId="+goodsId+"&orderNumber="+orderNumber;
		return;
	}else if (status=="3"){
		return;
	}
	
	if(confirm("确定要"+warn+"吗？")){
		status=Number(status)+1;
		$.ajax({
			url : "user/pay",
			type : "post",
			data : {
				"orderNumber" : orderNumber,
				"status" : status
			},
			dataType : "text",
			success : function(data) {
				alert(warn+"成功ｂ（￣▽￣）ｄ");
				window.location.reload();
			}
		});
	}
}
</script>
<body>
	<div class="header2 text-center">
	 <%@ include file="common_head.jsp" %>
	</div>
<!--header//-->
<div class="cart">
	 <div class="container">
			 <ol class="breadcrumb">
		  <li><a href="index/index">主页</a></li>
		  <li class="active">我的订单</li>
		 </ol>
		<div class="col-md-9 cart-items">
			<h2>我的订单</h2>
			<div class="cart-header">
			<c:if test="${!empty orderList}">
				<c:forEach items="${orderList}" var="order">
					<div class="cart-sec">
					<c:forEach items="${order.goods}" var="goods">
							<h4><span>${goods.name}</span></h4>
					</c:forEach>
					    <div class="cart-item-info">
							<h3><span>订单编号：${order.orderNumber}</span></h3>
							<h4><span>订单总价：${order.totalPrice}</span></h4>
							<h4><span>订单状态：${order.statusStr}</span></h4>
							<input class="btn btn-primary" 
							value="<c:if test='${order.statusStr=="待收货"}'>确认收货</c:if><c:if test='${order.statusStr=="待付款"}'>去付款</c:if><c:if test='${order.statusStr=="待评价"}'>去评价</c:if><c:if test='${order.statusStr=="已完成"}'>已完成</c:if>"			
							 onclick="goPay('${order.goodsId}','${order.status}','${order.orderNumber}');">
					    </div>
					    <div class="clearfix"></div>
						<div class="delivery">
							 <span>收货地址：${order.address}</span>
							 <div class="clearfix"></div>
						</div>						
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${empty orderList}">
				没有您的订单，快去购买喜欢的商品吧ヾ(◍°∇°◍)ﾉﾞ！
			</c:if>
			</div>
		</div>
	</div>
</div>
<%@ include file="common_bottom.jsp" %>
</body>
</html>

