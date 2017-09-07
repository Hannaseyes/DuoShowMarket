<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="common_link.jsp" %>
		<link rel="stylesheet" type="text/css" href="css/comment.css" />
		<title>评论</title>
		<script type="text/javascript">
			function addComment(goodsIdStr,orderNumber){
				var goodsArray = goodsIdStr.split(",");
				for (var i = 0; i < goodsArray.length; i++) {
					var content = $("#contents"+goodsArray[i]).val();
					var star = $("input[name='star"+goodsArray[i]+"']:checked").val();
					// 为商品添加评论
	  				$.ajax({
						url : "user/addComment",
						type : "post",
						dataType : "json",
						data : {
							"goodsId" : goodsArray[i],
							"star" : star,
							"content" : content,
							"orderNumber" :orderNumber
							}
					});
				}
  				alert("评价成功，感谢您的反馈(๑´ㅂ`๑)");
  				window.location.href= "user/getOrder";
			}
		</script>
	</head>
	<body>
		<div class="header2 text-center">
	 		<%@ include file="common_head.jsp" %>
		</div>
		<div class="cart">
			<div class="container">
				<form>
					<div class="cart-header">
						<span class="h3">亲，请客观给出评价~</span><br>
					</div>
					<c:forEach items="${goodsList}" var="goods">
						<span id="content" class="h4" >${goods.name}</span>
							<label class="radio-inline">
								<input type="radio" name="star${goods.id}" value="1">差评
							</label>
							<label class="radio-inline">
								<input type="radio" name="star${goods.id}" value="3">中评
							</label>
							<label class="radio-inline">
								<input type="radio" name="star${goods.id}" value="5" checked="checked">好评
							</label>
						<div>
							<div style="width:300px; height:200px;" class="imgDiv"><img src="${goods.picture}" width="100%" height="100%" /></div>
							<div class="imgDiv">
							<textarea id="contents${goods.id}" onFocus="if(this.value == '懒得评价，默认好评...') this.value='';"
								onBlur="if(this.value == '') this.value='懒得评价，默认好评...';" maxlength="200" contenteditable="true">懒得评价，默认好评...</textarea>
							</div>
						</div>
						<br>
					</c:forEach>
					<div style="margin:0 auto;width:200px;">
						<input type="button" class="btn btn-primary" value="提交" name="" onclick="addComment('${goodsIdStr}','${orderNumber}');">
					</div>
				</form>
			</div>
		</div>
	</body>
</html>
