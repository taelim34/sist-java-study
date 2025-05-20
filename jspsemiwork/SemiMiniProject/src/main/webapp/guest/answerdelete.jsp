<%@page import="data.dto.GuestAnswerDto"%>
<%@page import="data.dao.GuestAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	
	String idx=request.getParameter("idx");

	GuestAnswerDao dao=new GuestAnswerDao();
	
	dao.deleteGuestAnswer(idx);
	
	//response.sendRedirect("../index.jsp?main=guest/guestlist.jsp");
%>
</body>
</html>