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
	<c:if test="${count==0 }">
		<div class="alert alert-info">
			<b>저장된 정보가 없습니다</b>
		</div>
	</c:if>
	<c:if test="${count>0 }">
		<div class="alert alert-info">
			<b>총 ${count }개의 상품이 입고중 입니다</b>
		</div>
	</c:if>
	<button type="button" class="btn btn-success"
	onclick="location.href='addform'">추가</button>
	<table class="table table-bordered">
		<tr>
			<th>번호</th>
			<th>상품명</th>
			<th>가격</th>
			<th>사진</th>
			<th>입고일</th>
			<th>편집</th>
		</tr>
		<c:forEach var="dto" items="${list }" varStatus="i">
			<tr>
				<td>${i.count }</td>
				<td>${dto.sangpum }</td>
				<td>${dto.price }</td>
				<td>
					<img alt="" src="/photo/${dto.photoname }" style="width: 150px;">
				</td>
				<td>
					<fmt:formatDate value="${dto.ipgoday }" pattern="yyyy-MM-dd"/>
				</td>
				<td>
					<button type="button" class="btn btn-info"
					onclick="location.href='updateform?num=${dto.num}'">수정</button>
					<button type="button" class="btn btn-danger"
					onclick="location.href='delete?num=${dto.num}'">삭제</button>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>