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
</head>
<body>
<%
	hoewonDao dao=new hoewonDao();
	//세션에 저장된 id 
	String id=(String)session.getAttribute("mid");
	
	//아이디에 해당하는 이름반환
	String name=dao.getHoewonName(id);
%>
<div style="margin: 200px 200px;">
	<b><%=name %>님 로그인중</b>
	<button type="button" class="btn btn-danger btn-sm"
	onclick="location.href='logoutProc.jsp'">Logout</button>

	<img src="../image/logoImg/img2.jpg">
</div>
</body>
</html>