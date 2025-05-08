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
	//세션이 있는지 확인후 없으면 꽝~~
	String msg=(String)session.getAttribute("msg");
	String travel=request.getParameter("travel");
	
	if(msg==null || !msg.equals("happy"))
	{%>
		<h3 style="color: red;">시간초과로 꽝입니다</h3>
	<%}else{%>
		<h3>축!!! <%=travel %>상품 당첨</h3>
	<%}


%>

<a href="sessionStart.jsp">다시선택하기</a>
</body>
</html>