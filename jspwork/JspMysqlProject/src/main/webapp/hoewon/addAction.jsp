<%@page import="hoewon.hoewonDao"%>
<%@page import="hoewon.hoewonDto"%>
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
	request.setCharacterEncoding("utf-8");

	String mid=request.getParameter("mid");
	String pass=request.getParameter("pass");
	String name=request.getParameter("name");
	String hp=request.getParameter("hp");
	
	hoewonDto dto=new hoewonDto();
	
	dto.setMid(mid);
	dto.setPass(pass);
	dto.setName(name);
	dto.setHp(hp);
	
	hoewonDao dao=new hoewonDao();
	
	dao.insertHoewon(dto);
	
	response.sendRedirect("hoewonList.jsp");
%>
</body>
</html>