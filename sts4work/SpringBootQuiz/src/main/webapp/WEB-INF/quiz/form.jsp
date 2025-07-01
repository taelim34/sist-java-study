<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Black+Han+Sans&family=East+Sea+Dokdo&family=Gowun+Batang&family=Nanum+Myeongjo&family=Stylish&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>Insert title here</title>
</head>
<body>

	<h1 class="alert alert-info">quiz</h1>

	<form action="foodshow" method="post">
		<table class="table table-bordered" style="width: 600px;">
			<tr>
				<td>
					<b>음식이름</b>
				</td>
				<td>				
					<input type="text" name="fname" class="form-control" style="width: 300px;">
				</td>
			</tr>
			<tr>
				<td>
					<b>가격</b>
				</td>
				<td>
					<input type="text" name="fprice" class="form-control" style="width: 300px;">
				</td>
			</tr>
			<tr>
				<td>
					<b>음식사진</b>
				</td>
				<td>
					<img alt="" src="image/Food/1.jpg" style="width: 100px;">
					<input type="checkbox" name="fphoto" value="1.jpg">
					<img alt="" src="image/Food/2.jpg" style="width: 100px;">
					<input type="checkbox" name="fphoto" value="2.jpg">
					<img alt="" src="image/Food/3.jpg" style="width: 100px;">
					<input type="checkbox" name="fphoto" value="3.jpg">
					<img alt="" src="image/Food/4.jpg" style="width: 100px;">
					<input type="checkbox" name="fphoto" value="4.jpg">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-danger">저장</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>