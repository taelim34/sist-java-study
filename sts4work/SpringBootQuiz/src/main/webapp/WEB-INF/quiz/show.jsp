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
<h3 class="alert alert-info">음식정보</h3>
<table class="table table-bordered">
	<tr>
		<td>
			이름: ${foodDto.fname }
		</td>
	</tr>
	<tr>
		<td>
			가격: ${foodDto.fprice }
		</td>
	</tr>
	<tr>
		<td>
			사진: 
			<c:forEach var="photo" items="${photoList }">
				<img alt="" src="image/Food/${photo }" style="width: 300px;">
			</c:forEach>
		</td>
	</tr>
</table>
</body>
</html>