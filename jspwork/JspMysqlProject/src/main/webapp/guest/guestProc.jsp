<%@page import="guest.guestDao"%>
<%@page import="guest.guestDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	String realPath=getServletContext().getRealPath("/save");
	System.out.println(realPath);
	
	//업로드크기
	int uploadSize=1024*1024*3;
	
	try{
		
		MultipartRequest multi=new MultipartRequest(request,realPath,uploadSize,"utf-8",new DefaultFileRenamePolicy());
		
		String myid=multi.getParameter("myid");
		String photo=multi.getFilesystemName("photo");
		String content=multi.getParameter("content");
		
		guestDto dto=new guestDto();
		dto.setMyid(myid);
		dto.setPhoto(photo==null?"no.png":photo);
		dto.setContent(content);
		
		guestDao dao=new guestDao();
		dao.insertGuest(dto);
		response.sendRedirect("guestList.jsp");
	}catch(Exception e){
		
	}
%>
</body>
</html>