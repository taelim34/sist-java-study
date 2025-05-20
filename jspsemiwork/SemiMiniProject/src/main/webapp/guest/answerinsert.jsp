<%@page import="data.dao.GuestAnswerDao"%>
<%@page import="data.dto.GuestAnswerDto"%>
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
	

	String myid=request.getParameter("myid");
	String num=request.getParameter("num");
	String content=request.getParameter("content");
	
	GuestAnswerDto dto=new GuestAnswerDto();
	
	dto.setMyid(myid);
	dto.setNum(num);
	dto.setContent(content);
	
	GuestAnswerDao dao=new GuestAnswerDao();
	dao.insertAnswer(dto);
	
	response.sendRedirect("../index.jsp?main=guest/guestlist.jsp");
	
%>
</body>
</html>