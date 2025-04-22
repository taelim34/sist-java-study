<%@page import="day0422.StudentInfoDto"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Black+Han+Sans&family=East+Sea+Dokdo&family=Gowun+Batang&family=Nanum+Myeongjo&family=Stylish&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<h3>여기는 ex7_forward입니다</h3>
<%
	//request에 저장된 list얻기
	Vector<StudentInfoDto> list=(Vector<StudentInfoDto>)request.getAttribute("list");

	//반복문 이용 출력
	for(StudentInfoDto dto:list)
	{%>
		<h3>
			이름: <%=dto.getStu_name() %><br>
			주소: <%=dto.getStu_addr() %><br>
			점수: <%=dto.getScore() %><br>
		</h3>	
	<%}
%>






</body>
</html>