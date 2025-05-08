<%@page import="mysql.db.MymallDao"%>
<%@page import="mysql.db.MymallDto"%>
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
	
	String sangpum=request.getParameter("sangpum");
	String photo=request.getParameter("photo");
	String color=request.getParameter("color");
	int price=Integer.parseInt(request.getParameter("price"));
	String ipgoday=request.getParameter("ipgoday");
	String num=request.getParameter("num");
	
	MymallDto dto=new MymallDto();
	
	dto.setNum(num);
	dto.setSangpum(sangpum);
	dto.setPhoto(photo);
	dto.setColor(color);
	dto.setPrice(price);
	dto.setIpgoday(ipgoday);
	
	MymallDao dao=new MymallDao();
	dao.updateSangpum(dto);
	
	response.sendRedirect("detailPage.jsp?num="+dto.getNum());
%>
</body>
</html>