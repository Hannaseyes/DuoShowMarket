<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>评论</title>
		<link href="css/comment.css" rel="stylesheet" type="text/css" />
		<script src="js/jquery.min.js" ></script>
		<script src="js/comment.js" ></script>
	</head>
	<body>
		<form>
			<div class="box">
				<div class="list">
					<a href="javascript:void(0)" class="star1">★</a>
					<a href="javascript:void(0)" class="star2">★</a>
					<a href="javascript:void(0)" class="star3">★</a>
					<a href="javascript:void(0)" class="star4">★</a>
					<a href="javascript:void(0)" class="star5">★</a>
				</div>
				<span class="remark">亲，请客观给出评价~</span>
			</div>
			<div>
				<div><span id="content">评价商品</span></div>
				<textarea id="contents" value="" maxlength="400" contenteditable="true"></textarea>
			</div>
			<div style="margin:0 auto;width:200px;">
				<input type="button" value="提交" name="" onclick="addComment();">
			</div>
			<input type="text" value="${param.userId}" hidden="true" id="userId">;
			<input type="text" value="${param.goodsId}" hidden="true" id="goodsId">
		</form>
	</body>
</html>
