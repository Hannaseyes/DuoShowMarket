<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>朵Show-奢侈品专卖-精致生活、专注唯一、潮人选择、贵族风范！</title>
<%@ include file="common_link.jsp"%>
<script>

function single(id) {
	// 跳转商品详情
	window.location.href="page/single?id="+id;
}
function addCart(id) {
	var goodsNumber = $("#goodsNumber"+id).val();
 	if(Number(goodsNumber)<1 || goodsNumber==null || Number(goodsNumber)>999) {
		alert("请输入正确的购买数量ヾ(ﾟ∀ﾟゞ)");
		return;
	}
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

// 预加载内容
$(document).ready(
	function() {
		var userId = $("#userId").html();
		$("#tab2").hide();
		$("#tab3").hide();
		$(".tabs-menu a").click(
			function(event) {
				event.preventDefault();
				var tab = $(this).attr("href");
				$(".tab-grid1,.tab-grid2,.tab-grid3").not(tab)
						.css("display", "none");
				$(tab).fadeIn("slow");
			});
		$("ul.tabs-menu li a").click(function() {
			$(this).parent().addClass("active a");
			$(this).parent().siblings().removeClass("active a");
		});

	//查询最新商品
	$.ajax({
		url : "goods/listNewGoods",
		type : "post",
		dataType : "json",
		success : function(newGoodsListJson) {	
            for ( var i = 0; i < newGoodsListJson.length; i++) {
                //alert(newGoodsListJson[i].name);
                var html = "";
                html+='<div id="tab1" class="tab-grid1">';
                html+='<div class="product-grid">';
                html+='<div class="more-product-info">';
                html+='<span>新</span>';
                html+='</div>';
                html+='<div class="product-img b-link-stripe b-animate-go  thickbox">';
                html+='<img src="'+newGoodsListJson[i].picture+'" class="img-responsive" alt="" />';
                html+='<div class="b-wrapper">';
                html+='<h4 class="b-animate b-from-left  b-delay03">';
                html+='<button class="btns" onclick="single('+newGoodsListJson[i].id+');">详情</button>';
                html+='</h4>';
                html+='</div>';
                html+='</div>';
                html+='</div>';						
                html+='<div class="product-info simpleCart_shelfItem">';
                html+='<div class="product-info-cust">';
                html+='<h5>商品名称：</h5>';
                html+='<h4>'+newGoodsListJson[i].name+'</h4>';
                html+='<h5>官方价格：</h5>';
                html+='<span class="item_price">'+newGoodsListJson[i].price+'CNY</span>';
                html+='<h5>购买数量：</h5>';
                html+='<input id=goodsNumber'+newGoodsListJson[i].id+' type="text" class="item_quantity" value="1" />';
               
                html+='<input onclick="addCart('+newGoodsListJson[i].id+');" type="button" class="item_add" value="加入购物车">';
                html+='</div>';
                html+='<div class="clearfix"></div>';
                html+='</div>';
                html+='</div>';
                $("#newGoodsList").append(html);
            }      
		}
	});

	//查询推荐品牌
	$.ajax({
		url : "user/listRecommendBrand",
		type : "post",
		dataType : "json",
		success : function(recommendBrandListJson) {	
            for ( var i = 0; i < recommendBrandListJson.length; i++) {
            	//alert(recommendBrandListJson[i].name);
            	var html = "";
    			html+='<a href="brand/getBrandGoods?brandId='+recommendBrandListJson[i].id+'">';
				html+='<div class="col-md-4 sections  fashion-grid-a" style="';
				html+='background:url('+recommendBrandListJson[i].picture+') no-repeat;">';
				html+='<h3>'+recommendBrandListJson[i].name+'</h3>';
				html+='</div>';
				html+='</a>';
				$("#recommendBrandList").append(html);
            }      
		}
	});
	
	/* 搜索功能 */
	$("#search").click(function(){
		var searchContent = $("#searchContent").val();
		var searchType = $("#searchType").val();
		if(searchContent!=""&&searchContent!=null){
			window.location.href="index/search?content="+searchContent+"&type="+searchType;
		}else{
			alert("请输入查询内容");
		}
	});
});
//提交建议按钮事件
function adviceAjax() {//ajax加载
	var content = $("#adviceContent").val();
	var userId = $("#userId").html();
	if(userId==null) {
		alert("您还未登录，请登陆后再试╭(╯^╰)╮");
		window.location.href="page/login";
		return;
	}
	if(content=="") {
		alert("请填写内容后再试╮(╯﹏╰）╭");
		return;
	}
	if(content.length<20) {
		alert("您填写的字数太少，请多写点在提交吧( • ̀ω•́ )✧");
		return;
	}
	$.ajax({
		url : "index/adviceCtrl",
		type : "post",
		async: false,
		data : {
			"userId" : userId,
			"adviceContent" : content
		},
		dataType : "text",
		success : function(data) {
			alert("我们已收到您的建议，谢谢您的支持ヾ(◍°∇°◍)ﾉﾞ");
			$("#adviceContent").val("");
		}
	});
}
</script>
</head>
<body style="background:black">
	<!--顶部start-->
	<div class="header">
		<%@ include file="common_head.jsp"%>
	</div>
	<!--顶部end-->
	
	<!-- 用户推荐品牌列表start -->
	<div class="categoires" style="background:black">
		<div class="container" id="recommendBrandList">
		</div>
	</div>
	<!-- 用户推荐品牌列表end -->
	
	<!-- 新品推荐start -->
	<div class="features" id="features" style="background:black">
		<div class="container">
			<div class="tabs-box">
				<ul class="tabs-menu">
					<li><a href="javascript:void(0);">为您推荐</a></li>
				</ul>
				<div class="clearfix"></div>
				<div class="tab-grids col-md-12" id="newGoodsList" >
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!-- 新品推荐end -->
	<div>
		<div class="input-group" style="width:33%;left:33%">
			<select id="searchType">
			  <option value ="brand" selected="selected">品牌名称</option>
			  <option value ="goods">商品名称</option>
			</select>
		    <input type="text" class="form-control" id="searchContent">
		    <span class="btn btn-primary" id="search">搜索</span>
		</div>
	</div>
	<!-- 建议模块 start -->
	<div class="fotter">
		<div class="container">
			<div class="col-md-6 contact">
				<form> 
					<textarea onFocus="if(this.value == '建议...') this.value='';"
						onBlur="if(this.value == '') this.value='建议...';"
						name="adviceContent" id="adviceContent" >建议...</textarea>
					<div class="clearfix"></div>
					<input type="button" class="btn btn-primary" value="提交" onclick="adviceAjax();">
				</form>

			</div>
			<div class="clearfix"></div>
		</div>
		<div class="clearfix"></div>
	</div>
	<!-- 建议模块 end -->

</body>
</html>