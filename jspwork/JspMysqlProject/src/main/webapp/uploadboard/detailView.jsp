<%@page import="java.text.SimpleDateFormat"%>
<%@page import="uploadboard.UploadDto"%>
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
<style type="text/css">
div.title{
	border-radius: 10px;
	margin: 100px 100px;
	border: 1px solid gray;
	width: 900px;
	height: 900px;
}
textarea {
	width: 750px;
	height: 100px;
	margin-bottom: 30px;
	margin-left: 50px;
	
}
div button.btn{
	float: right;
	margin-right: 10px;
	margin-top: 30px;
}
</style>
</head>
<%
	String num=request.getParameter("num");

	UploadDao dao=new UploadDao();
	UploadDto dto=dao.getData(num);
	
	dao.updateReadcount(num);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<body>
<div class="title">
	<button type="button" class="btn btn-success" onclick="location.href='boardList.jsp'">목록</button>
	<button type="button" class="btn btn-danger" onclick="location.href='deletePassForm.jsp?num=<%=dto.getNum()%>'">삭제</button>
	<button type="button" class="btn btn-warning" onclick="location.href='updateForm.jsp?num=<%=dto.getNum() %>'">수정</button>
	<table style="width: 800px; margin: 50px;">
		<tr>
			<td>
				<h2><%=dto.getSubject() %></h2>
				<b><%=dto.getWriter() %></b>
				<br>
				<span style="color: gray; font: 9pt;"><%=sdf.format(dto.getWriteday()) %>  조회수: <%=dto.getReadcount() %></span>
				<hr>
			</td>
		</tr>
		<tr>
			<td>
				<%=dto.getContent().replace("\n", "<br>") %>
				<br>
				<img alt="" src="../save/<%=dto.getImgname() %>">
			</td>
		</tr>
	</table>
	<textarea></textarea>
</div>
</body>
</html>