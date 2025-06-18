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
	<h2>get방식 폼</h2>
	<form action="read1" method="get">
		이름: <input type="text" name="name"><br>
		나이: <input type="text" name="age"><br>
		주소: <input type="text" name="addr"><br>
		<button type="submit" class="btn btn-success">get방식 전송</button>
	</form>
	
	<h2>post방식 폼</h2>
	<form action="read2" method="post">
		상품: <input type="text" name="sang"><br>
		카테고리: <input type="text" name="category"><br>
		가격: <input type="text" name="price"><br>
		<button type="submit" class="btn btn-success">post방식 전송</button>
	</form>
	
	<h2>post방식 폼_map로 읽기</h2>
	<form action="read3" method="post">
		상품: <input type="text" name="sang"><br>
		카테고리: <input type="text" name="category"><br>
		가격: <input type="text" name="price"><br>
		<button type="submit" class="btn btn-success">post방식 전송</button>
	</form>
</body>
</html>