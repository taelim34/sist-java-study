<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Black+Han+Sans&family=East+Sea+Dokdo&family=Gowun+Batang&family=Nanum+Myeongjo&family=Stylish&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<h3>ex5_oneInclude 하기</h3>
<%
  request.setCharacterEncoding("utf-8"); //한글경로일경우
%>
<jsp:include page="./ex5_oneInclude.jsp">
	<jsp:param value="오늘은 Jsp 1일차!!" name="msg"/>
	<jsp:param value="../image/Food/1.jpg" name="imgname"/>
	<jsp:param value="홍길동" name="name"/>
	<jsp:param value="서울시 강서구" name="addr"/>
</jsp:include>
</body>
</html>