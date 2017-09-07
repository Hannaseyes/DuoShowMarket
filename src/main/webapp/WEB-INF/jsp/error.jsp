<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=9">
<meta name="viewport" content="width=device-width, initial-scale = 1.0, user-scalable = no">
<meta name="keywords" content="">
<meta name="description" content="">
<title>出错了!</title>
<%@ include file="common_link.jsp"%>
<link rel="stylesheet" href="css/error_404.css" media="all">
</head>
<body>
<!--顶部导航-->

<div class="menu"></div>
<!--顶部导航-->
<div class="error_404">
  <div class="container clearfix">
    <div class="error_pic"></div>
    <div style="margin-top:25%">
        <h2>对不起，您访问的页面不存在！</h2>
      <div class="operate">
        <input class="global_btn btn_89bf43" onClick="location.href='index/index'" type="button" value="返回主页">
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
$(function(){
	 $("#back_top > a").click(function(){
		$("html, body").animate({scrollTop:"0px"},1000);
		return false;
	});
})
</script>
</body>
</html>