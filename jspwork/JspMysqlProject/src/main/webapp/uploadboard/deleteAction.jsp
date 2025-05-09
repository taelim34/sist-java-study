<%@page import="java.io.File"%>
<%@page import="uploadboard.UploadDao"%>
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
	//num,pass읽기
	String num=request.getParameter("num");
	String pass=request.getParameter("pass");
	
	//dao
	UploadDao dao=new UploadDao();
	//메서드 isEqualPass  반환값 b얻기
	boolean b=dao.isEqualPass(num, pass);
	
	//b가 참이면 삭제후 목록이동
	//b가 거짓이면 경고창 날리고 back
	if(b)
	{
		//게시글 지우기전에 업로드 이미지 지우기
		String imgname=dao.getData(num).getImgname();
		//업로드 경로
		String uploadpath=getServletContext().getRealPath("/save");
		out.println("imgname: " + imgname);
		out.println("uploadpath: " + uploadpath);
		//파일생성
		File file=new File(uploadpath+"\\"+imgname);
		//파일삭제
		if(file.exists())  //파일이 존재하면 
			file.delete();//파일을 삭제
			
		//db삭제
		dao.deleteUpload(num);
		//목록이동
		response.sendRedirect("boardList.jsp");
	}else{%>
		<script type="text/javascript">
			alert("비밀번호가 맞지 않습니다");
			history.back();
		</script>
	<%}
	
%>
</body>
</html>