<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Black+Han+Sans&family=East+Sea+Dokdo&family=Gowun+Batang&family=Nanum+Myeongjo&family=Stylish&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>Insert title here</title>
</head>
<body>
	<c:if test="${totalCount==0 }">
		<h3 class="alert alert-info">저장된 자동차 정보가 없습니다</h3>
	</c:if>
	
	<c:if test="${totalCount>0 }">
		<h3 class="alert alert-info">총 ${totalCount }개의 자동차 정보가 있습니다</h3>
	</c:if>
	
	<button type="button" style="width:  150px;"
	onclick="location.href='writeform'" class="btn btn-outline-info">차 정보 입력</button>
	<br><br>
	
	<table class="table table-bordered" style="width: 800px;">
		<tr>
			<th width="80">번호</th>
			<th width="140">자동차명</th>
			<th width="160">차량 가격</th>
			<th width="100">색상</th>
			<th width="120">구입일</th>
			<th width="180">차량 등록일</th>
			<th width="180">수정/삭제</th>
		</tr>
		<c:forEach var="item" items="${list }" varStatus="i">
		<fmt:formatDate var="date" value="${item.carwriteday }" pattern="yyyy-MM-dd HH:mm"/>
			<tr>
				<td>${totalCount-i.index }</td>
				<td>${item.carname }</td>
				<td>${item.carprice }</td>
				<td><span style="color: ${item.carcolor }">${item.carcolor }</span></td>
				<td>${item.carguip }</td>
				<td>${date }</td>
				<td>
					<button type="button" onclick="location.href='updateform?num=${item.num}'">수정</button>
					<button type="button" onclick="if(confirm('정말로 삭제하시겠습니까?')) location.href='delete?num=${item.num}'">삭제</button>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>