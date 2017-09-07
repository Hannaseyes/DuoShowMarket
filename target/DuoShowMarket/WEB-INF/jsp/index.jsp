<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>朵Show-奢侈品专卖-精致生活、专注唯一、潮人选择、贵族风范！</title>
<%@ include file="common_link.jsp"%>
<script>
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
                html+='<img src="images/bs1.jpg" class="img-responsive" alt="" />';
                html+='<div class="b-wrapper">';
                html+='<h4 class="b-animate b-from-left  b-delay03">';
                html+='<button class="btns">了解详情</button>';
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
                html+='<input type="text" class="item_quantity" value="1" />';
                html+='<input type="button" class="item_add" value="加入购物车">';
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
		data : {"userId":userId},
		success : function(recommendBrandListJson) {	
            for ( var i = 0; i < recommendBrandListJson.length; i++) {
            	//alert(recommendBrandListJson[i].name);
            	var html = "";
    			html+='<a href="#">';
				html+='<div class="col-md-4 sections fashion-grid-a">';
				html+='<h4>'+recommendBrandListJson[i].name+'</h4>';
				html+='</div>';
				html+='</a>';
				$("#recommendBrandList").append(html);
            }      
		}
	});
	
	//提交建议按钮事件
	function adviceAjax() {//ajax加载
		var title = $("#adviceTitle").val();
		var email = $("#adviceEmail").val();
		var content = $("#adviceContent").val();
		$.ajax({
			url : "index/adviceCtrl",
			type : "post",
			data : {
				"adviceTitle" : title,
				"adviceEmail" : email,
				"adviceContent" : content
			},
			dataType : "text",
			success : function(data) {
				alert("提交建议成功，感谢您的反馈！");
				$("#adviceTitle").val("");
				$("#adviceEmail").val("");
				$("#adviceContent").val("");
			}
		});
	}
	
	/* 搜索功能 */
	$("#search").click(function(){
		var searchContent = $("#searchContent").val();
		var searchType = $("#searchType").val();
		if(searchContent!=""&&searchContent!=null){
			$.ajax({
				url : "index/search",
				type : "post",
				dataType : "json",
				data : {"content":searchContent,"type":searchType}
			});
		}else{
			alert("请输入查询内容");
		}
	});
	
});
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
					<li><a href="#tab1">新品推荐</a></li>
				</ul>
				<div class="clearfix"></div>
				<div class="tab-grids" id="newGoodsList">
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!-- 新品推荐end -->
	<div>
		<div class="input-group" style="width:33%;left:33%">
<!-- 	   	 	<div class="input-group-btn">
		        <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
		        	请选择查询类型<span class="caret"></span>
		        </button>
		        <ul class="dropdown-menu">
		            <li><a href="#">品牌名称</a></li>
		            <li><a href="#">商品名称</a></li>
		        </ul>
		    </div> -->
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
					<input type="button" value="提交" onclick="adviceAjax()">
				</form>

			</div>
			<div class="clearfix"></div>
		</div>
		<div class="clearfix"></div>
	</div>
	<!-- 建议模块 end -->

</body>
</html>