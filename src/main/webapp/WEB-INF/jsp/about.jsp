<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>朵Show-了解朵Show</title>
	<%@ include file="common_link.jsp" %>
<script type="text/javascript">
	//查询推荐品牌
	$.ajax({
		url : "user/listRecommendBrand",
		type : "post",
		dataType : "json",
		success : function(recommendBrandListJson) {	
            for ( var i = 0; i < recommendBrandListJson.length; i++) {
            	//alert(recommendBrandListJson[i].name);
            	var html = "";
			 	html +='<div class="col-md-3 about-grid">';
			 	html +='<a href="brand/getBrandGoods?brandId='+recommendBrandListJson[i].id+'"><img src="'+recommendBrandListJson[i].picture+'" class="img-responsive" alt=""/></a>';
			 	html +='<h4>${brand.name}</h4>';
			 	html +='<p>'+recommendBrandListJson[i].introduce+'</p>';
			 	html +='</div>';
				$("#recommendBrandList").append(html);
            }      
		}
	});
</script>
</head>
<body>
<!--header-->
<div class="header2 text-center">
	 <%@ include file="common_head.jsp" %>
</div>
<!--header//-->
<div class="about">
	 <div class="container">
			<ol class="breadcrumb">
		  <li><a href="index">主页</a></li>
		  <li class="active">了解朵Show</li>
		 </ol>
		 <h2>朵Show简介</h2>
		 <div class="about-sec">
			 <div class="about-pic"><img src="images/about.jpg" class="img-responsive" alt=""/></div>
			 
			 <div class="about-info">
				 <p>朵Show商城是一个专注于奢侈品交易的电商平台，由烟台大学学生王翰卿创造，商城内所有产品均由国外专业买手从实体店购买正品后以正规途径销售，所有产品均带有实体店发票等有效标识，保证安全可靠。</p>	 
			 <div class="about-pic"><img src="images/qr_code1.jpg" class="img-responsive" alt=""/></div>
			 <div class="about-pic"><img src="images/qr_code2.jpg" class="img-responsive" alt=""/></div>
			 </div>
			
			 <div class="clearfix"></div>
		 </div>
		 <h3>品牌推荐</h3>
		 <div class="about-grids" id="recommendBrandList">
		 </div>
		 </div>
	 </div>


<%@ include file="common_bottom.jsp" %>


</body>
</html>