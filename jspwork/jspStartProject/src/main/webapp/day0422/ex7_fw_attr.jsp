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
<h3>request에 vector 저장후 불러오기 연습</h3>
<%
	Vector<StudentInfoDto> list=new Vector<>();
	list.add(new StudentInfoDto("조태민","강남구",88));
	list.add(new StudentInfoDto("김태민","강서구",98));
	list.add(new StudentInfoDto("김유진","해운대구",68));
	list.add(new StudentInfoDto("조우진","미사구",99));
	list.add(new StudentInfoDto("김민정","강동구",77));
	
	//데이터 Vector를 request에 저장
	request.setAttribute("list", list);
	
	//forward:url안바뀜
	//redirect:url바뀜
	//<jsp:> 액션태그
	
	
	
%>

<jsp:forward page="ex7_forward.jsp"/>
</body>
</html>