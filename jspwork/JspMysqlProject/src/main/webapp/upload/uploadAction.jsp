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
	ServletContext context=getServletContext();
	String realFolder=context.getRealPath("save");
	
	System.out.println(realFolder);
	
	int filesize=1024*1024*5;
	
	MultipartRequest multi=null;
	
	try{
		multi=new MultipartRequest(request,realFolder,filesize,"utf-8",new DefaultFileRenamePolicy());
		String name=multi.getParameter("name");
		String title=multi.getParameter("subject");
		String uploadFile=multi.getFilesystemName("uploadFile");
		String originalName=multi.getOriginalFileName("uploadFile");%>
		
		<div>
			<h3>이름:  <%=name %></h3>
			<h3>제목:  <%=title %></h3>
			<img src="../save/<%=uploadFile %>">
			<h5>원래파일명: <%=uploadFile %></h5>
			<button type="button" onclick="location.href='uploadForm.jsp'">다시 업로드</button>
		</div>
	<%}catch(Exception e){
		
	}
%>


</body>
</html>