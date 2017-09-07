<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>朵SHOW-商品详情</title>
<%@ include file="common_link.jsp"%>
<script src="js/simpleCart.min.js"></script>
<link rel="stylesheet" href="css/etalage.css">
<script src="js/jquery.etalage.min.js"></script>
<script>
	$(document).ready(function() {
		$(".megamenu").megamenu();
	});
</script>
</head>
<body>
	<!--header-->
	<div class="header2 text-center">
		<%@ include file="common_head.jsp"%>
	</div>
	<!--header//-->
	<!--Single Page starts Here-->
	<div class="product-main">
		<div class="container">
			<ol class="breadcrumb">
				<li><a href="index/index">主页</a></li>
				<li class="active">商品详情</li>
			</ol>
			<div class="ctnt-bar cntnt">
				<div class="content-bar">
					<div class="single-page">
						<script>
							$(document).ready(function($) {
								$('#etalage').etalage({
									thumb_image_width : 300,
									thumb_image_height : 400,
									source_image_width : 700,
									source_image_height : 800,
									show_hint : true,
									click_callback : function(image_anchor,instance_id) {
										alert('Callback example:\nYou clicked on an image with the anchor: "'
												+ image_anchor
												+ '"\n(in Etalage instance: "'
												+ instance_id
												+ '")');
									}
								});
								
								$('.dropdownlist').change(function() {
									etalage_show($(this).find('option:selected').attr('class'));
								});
							});
						</script>
						<!--//details-product-slider-->
						<div class="details-left-slider">
							<ul id="etalage">
								<li>
									<img class="etalage_thumb_image" src="${goods.picture}" />
									<img class="etalage_source_image" src="${goods.picture}" />
								</li>
							</ul>
						</div>
						<div class="details-left-info">
							<h3>${goods.name}</h3>
							<p>￥ ${goods.price}</p>
							<p class="qty">购买数量:</p>
							<input min="1" type="number" id="quantity" name="quantity"
								value="1" class="form-control input-small">
							<div class="btn_form">
								<a href="cart.html">添加到购物车</a>
							</div>
							<div class="flower-type">
								<p>类型:<a href="#">${brandType.brandType}</a></p>
								<p>品牌:<a href="#">${brand.name}</a></p>
							</div>
							<h5>介绍:</h5>
							<p class="desc">${goods.introduce}</p>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<%@ include file="common_bottom.jsp" %>
</body>
</html>