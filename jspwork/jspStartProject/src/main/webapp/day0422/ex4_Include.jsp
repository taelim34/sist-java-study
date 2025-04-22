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
<h2>다른파일 include</h2>
<b>==================================</b>
<h3>1번예제</h3>
<jsp:include page="./ex1HelloJsp.jsp"/>
<b>==================================</b>
<h3>2번예제</h3>
<jsp:include page="./ex2JspArr.jsp"/>
<b>==================================</b>
<h3>3번예제</h3>
<jsp:include page="./ex3ImgArr.jsp"/>
</body>
</html>