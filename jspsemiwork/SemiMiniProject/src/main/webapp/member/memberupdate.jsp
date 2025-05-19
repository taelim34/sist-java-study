<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Hi+Melody&family=Nanum+Myeongjo&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	
	String name=request.getParameter("name");
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	String num=request.getParameter("num");
	String email1=request.getParameter("email1");
	String email2=request.getParameter("email2");
	
	MemberDto dto=new MemberDto();
	MemberDao dao=new MemberDao();
	
	dto.setName(name);
	dto.setId(id);
	dto.setPass(pass);
	dto.setNum(num);
	dto.setEmail(email1+"@"+email2);
	
	// 비밀번호는 입력했을 때만 업데이트
	if (pass != null && !pass.trim().equals("")) {
	    dto.setPass(pass);
	} else {
	    dto.setPass(dao.getData(num).getPass()); // 기존 비번 유지
	}
	
	dao.updateMember(dto);
	
	response.sendRedirect("../index.jsp?main=member/mypage.jsp");
	
%>
</body>
</html>