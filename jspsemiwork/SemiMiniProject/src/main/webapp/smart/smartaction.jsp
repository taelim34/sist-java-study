<%@page import="data.dao.SmartDao"%>
<%@page import="data.dto.SmartDto"%>
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

	String writer=request.getParameter("writer");
	String subject=request.getParameter("subject");
	String content=request.getParameter("content");
	String pass=request.getParameter("pass");


	SmartDto dto=new SmartDto();

	dto.setWriter(writer);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setPass(pass);
	
	SmartDao dao=new SmartDao();
	
	int num=dao.getMaxNum();
	dao.insertSmartBoard(dto);
	
	response.sendRedirect("../index.jsp?main=smart/content.jsp?num="+num);
%>
</body>
</html>