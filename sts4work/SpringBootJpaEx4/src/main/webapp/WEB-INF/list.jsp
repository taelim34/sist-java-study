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
<h3 class="alert alert-success">목록</h3>
<button type="button" class="btn btn-info"
onclick="location.href='insertform'">상품추가</button>
<table class="table table-bordered" style="width: 800px;">
	<caption align="top"><b>${count }개의 음식이 등록되어 있습니다.</b></caption>
	<tr align="center">
		<th>번호</th>
		<th>음식이름</th>
		<th>가격</th>
		<th>사진</th>
		<th>등록일</th>
		<th>편집</th>
	</tr>
	
	<c:forEach var="dto" items="${list }" varStatus="i">
		<tr align="center">
			<td>${i.count }</td>
			<td>${dto.foodname }</td>
			<td>${dto.foodprice }</td>
			<td>
				<img alt="" src="/Food/${dto.foodphoto }" style="width: 100px;">
			</td>
			<td>${dto.ipgoday }</td>
			<td>
				<button type="button" class="btn btn-success"
				onclick="location.href='update?num=${dto.num}'">수정</button>
				<button type="button" class="btn btn-danger"
				onclick="location.href='delete?num=${dto.num}'">삭제</button>
			</td>
		</tr>
	</c:forEach>

</table>
</body>
</html>