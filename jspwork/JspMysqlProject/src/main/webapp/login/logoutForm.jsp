<%@page import="login.loginDao"%>
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
	//세션에 저장한 아이디를 읽어온다
	String id=(String)session.getAttribute("idok");
	//아이디에 해당하는 이름을 dao로 부터 얻기
	loginDao dao=new loginDao();
	String name=dao.getName(id);
%>
<br><br>
<div style="margin: 100px 200px;">
<b><%=name %> 님이 로그인 중 입니다</b>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<button type="button" class="btn btn-danger btn-sm"
onclick="location.href='logoutAction.jsp'">로그아웃</button>
<br>

<img alt="" src="../image/logoImg/img2.jpg">
</div>
</body>
</html>