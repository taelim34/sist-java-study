<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Hi+Melody&family=Nanum+Myeongjo&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>Insert title here</title>
</head>
<body>
<fmt:requestEncoding value="utf-8"/>
<form action="ex2.jsp" method="post" style="width: 300px;">
	<h2>이름을 입력하시오</h2>
	<input type="text" name="irum" class="form-control">
	<h2>가고싶은 나라를 입력하시오</h2>
	<input type="text" name="nara" class="form-control">
	<br>
	<button type="submit" class="btn btn-info">결과확인</button>
</form>

<!-- 이름을 입력시에만 결과가 나오게 -->
<c:if test="${!empty param.irum}">
	<h4>이름: ${param.irum }</h4>
	<h4>가고싶은나라: ${param.nara }</h4>
</c:if>
	<c:choose>
		<c:when test="${param.nara=='캐나다' }">
			<h4>캐나다는 역시 로키산맥이지</h4>
		</c:when>
		<c:when test="${param.nara=='영국' }">
			<h4>캐나다는 역시 로키산맥이지</h4>
		</c:when>
		<c:when test="${param.nara=='일본' }">
			<h4>캐나다는 역시 로키산맥이지</h4>
		</c:when>
		<c:otherwise>
			<h4>${param.nara }는 없는 나라입니다</h4>
		</c:otherwise>
	</c:choose>
</body>
</html>