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
<h3 class="alert alert-success">총 ${count }개의 자동차 정보가 있습니다</h3>
<br>
<button type="button" class="btn btn-success"
onclick="location.href='carform'">글쓰기</button><br><br>
<table class="table table-bordered" style="width: 800px;">
	<tr class="table-warning">
		<th>번호</th>
		<th width="100">자동차명</th>
		<th>가격</th>
		<th>색상</th>
		<th>구입일</th>
		<th>작성일</th>
		<th>편집</th>
	</tr>
	<c:forEach var="list" items="${list }" varStatus="i">
		<tr>
			<td>${i.count }</td>
			<td>${list.carname }</td>
			<td>${list.carprice }</td>
			<td style="background-color:${list.carcolor } ">${list.carcolor }</td>
			<td>${list.guipday }</td>
			<td><fmt:formatDate value="${list.writeday }" pattern="yyyy-MM-dd HH:mm"/></td>
			<td align="center">
				<button type="button" class="btn btn-success"
				onclick="location.href='updateform?num=${list.num}'">수정</button>
				<button type="button" class="btn btn-danger"
				onclick="location.href='delete?num=${list.num}'">삭제</button>
			</td>
		
	</c:forEach>
</table>
</body>
</html>