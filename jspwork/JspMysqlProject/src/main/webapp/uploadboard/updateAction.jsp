<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="uploadboard.UploadDao"%>
<%@page import="uploadboard.UploadDto"%>
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
	
	ServletContext context=getServletContext();
	String realFolder=context.getRealPath("save");

	System.out.println(realFolder);

	int filesize=1024*1024*5;

	MultipartRequest multi=null;
	
	try{
		multi=new MultipartRequest(request,realFolder,filesize,"utf-8",new DefaultFileRenamePolicy());
		
		String num=multi.getParameter("num");
		String subject=multi.getParameter("subject");
		String content=multi.getParameter("content");
		String pass=multi.getParameter("pass");
		String imgname=multi.getFilesystemName("photo");
	
		
		UploadDto dto=new UploadDto();
		dto.setNum(num);
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setImgname(imgname);

		UploadDao dao=new UploadDao();
		
		boolean flag=dao.isEqualPass(num, pass);
		
		if(flag)
		{
			dao.updateUpload(dto);
			response.sendRedirect("detailView.jsp?num="+num);
		}else
		{%>
			<script type="text/javascript">
			alert("비밀번호가 틀립니다");
			history.back();
			</script>

		<%}

	}catch(Exception e){
		
	}
	
	
%>
</body>
</html>