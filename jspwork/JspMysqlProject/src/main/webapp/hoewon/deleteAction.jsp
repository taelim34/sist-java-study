<%@page import="hoewon.hoewonDao"%>
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
	String num=request.getParameter("num");
	String pass=request.getParameter("pass");
	
	hoewonDao dao=new hoewonDao();
	
	boolean check=dao.isPassCheck(num, pass);
	
	//true면 삭제후 목록으로
	//false면 경고창 back
	if(check==true)
	{
		dao.deleteHoewon(num);
		%>
			<script type="text/javascript">
				alert("삭제되었습니다\n목록으로 이동합니다");
				location.href='hoewonList.jsp';
			</script>
		<%
	}else{
			%>
			<script type="text/javascript">
				alert("비밀번호가 맞지 않습니다");
				history.back();
			</script>
		<%
	}
	
	
%>
</body>
</html>