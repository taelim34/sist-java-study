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
	
	MymallDto dto=new MymallDto();
	MymallDao dao=new MymallDao();
	
	dto.setSangpum(sangpum);
	dto.setPhoto(photo);
	dto.setColor(color);
	dto.setPrice(price);
	dto.setIpgoday(ipgoday);
	
	dao.insertSangpum(dto);
	
	response.sendRedirect("mallList.jsp");
%>

</body>
</html>