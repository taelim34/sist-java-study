<%@page import="hoewon.hoewonDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Black+Han+Sans&family=East+Sea+Dokdo&family=Gowun+Batang&family=Nanum+Myeongjo&family=Stylish&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#wrap{
	position: absolute;
	left: 50%;
	top:50%;
	transform: translate(-50%,-50%);
}
</style>
</head>
<%
	String num=request.getParameter("num");
%>
<body>
<div id="wrap">
	<form action="deleteAction.jsp">
		<h4>비밀번호</h4>
		<input type="text" name="num" value="<%=num%>">
		<input type="password" class="form=control"
		name="pass" style="width: 150px;" required="required">
		<br>
		<button type="submit" class="btn btn-danger btn-sm">삭제</button>
	</form>
</div>
</body>
</html>