<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
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
<style type="text/css">
	a{
		text-decoration: none;
		color: black;
	}
</style>
</head>
<%
	//db선언
	UploadDao dao=new UploadDao();
	
	//List가져오기
	List<UploadDto> list=dao.getAllData();
%>
<body>
<div style="margin: 100px 100px; width: 800px;">
	<b><%=list.size() %>개의 글이 있습니다</b>
	<table class="table table-bordered">
		<caption align="top"><b>게시판형 목록보기</b>
			<button type="button" class="btn btn-warning"
			onclick="location.href='addForm.jsp'" style="margin-left: 650px;">글쓰기</button>
			<button type="button" class="btn btn-success" onclick="location.href='boardList.jsp'">목록형 게시판</button>
		</caption>
		
		<tr>
			<td colspan="3">
				<h2>전체글보기</h2>
				<span><%=list.size() %>개의 글</span>
			</td>
		</tr>
		
		<tr>
		<%
		//날짜형식
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		for(int i=0;i<list.size();i++)
		{
			UploadDto dto=list.get(i); //i번째 dto얻기
			if(i%3 == 0)
			{
			%>
			<tr>
			<%
			}
			%>
			<td>
				<a href="detailView.jsp?num=<%=dto.getNum() %>">
					<img src="../save/<%=dto.getImgname()%>" style="width: 220px; height: 200px;">
				</a>
				<br>
				<b><%=dto.getSubject() %></b><br>
				<span style="font-size: 10pt; color: gray;" ><%=dto.getWriter() %></span><br>
				<span style="font-size: 10pt; color: gray;"><%=sdf.format(dto.getWriteday()) %>  조회 <%=dto.getReadcount() %></span>
			</td>
				<%
			if (i % 3 == 2 || i == list.size() - 1) 
			{
			    %>
		  			</tr>
			    <%
			  }
			}
			%>
			
	</table>
</div>
</body>
</html>