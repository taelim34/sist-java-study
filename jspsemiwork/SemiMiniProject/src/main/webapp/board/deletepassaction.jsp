<%@page import="data.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String num=request.getParameter("num");
	String pass=request.getParameter("pass");
	
	BoardDao dao=new BoardDao();
	
	boolean flag=dao.deleteData(num, pass);
	
	if(flag)
	{
		dao.deleteBoard(num);
		response.sendRedirect("../index.jsp?main=board/boardlist.jsp");
	}else{
		%>
			<script type="text/javascript">
				alert("비밀번호가 틀렸습니다 다시 입력해주세요");
			</script>
		<%
	}
	
%>
</body>
</html>