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
<form action="insert" method="post">
	<table class="table table-bordered" style="width: 600px;">
	<caption align="top"><b>음식추가폼</b></caption>
		<tr>
			<th>음식이름</th>
			<td>
				<input type="text" class="form-control" name="foodname">
			</td>
		</tr>
		<tr>
			<th>음식가격</th>
			<td>
				<input type="text" class="form-control" name="foodprice">
			</td>
		</tr>
		<tr>
			<th>음식사진</th>
			<td>
				<select class="form-control" name="foodphoto">
					<option value="1.jpg">샌드위치</option>
					<option value="2.jpg">꼬치구이</option>
					<option value="3.jpg">육개장칼국수</option>
					<option value="4.jpg">갈비찜</option>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit" class="btn btn-danger">추가</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>