<%@page import="java.util.Date"%>
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
	//세션 저장하는 방법
	session.setAttribute("msg", "Happy day");
	session.setMaxInactiveInterval(60); //60초
%>

<h3>세션값 얻기</h3>
	세션값: <%=session.getAttribute("msg") %><br>
	세션유지시간: <%=session.getMaxInactiveInterval() %>초 <br>
	세션생성시간: <%=session.getCreationTime() %> <br>
	세션생성시간: <%=new Date(session.getCreationTime()) %>
</body>
</html>