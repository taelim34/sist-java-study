<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Hi+Melody&family=Nanum+Myeongjo&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String num=request.getParameter("num");
%>
<body>
<div>
	<form action="board/deletepassaction.jsp" method="post">
		<input type="text" name="num" value="<%= num%>">
		<h3>비밀번호</h3>
		<input type="password" name="pass" required="required">
		<button type="submit" class="btn btn-danger">삭제</button>
	</form>
</div>
</body>
</html>