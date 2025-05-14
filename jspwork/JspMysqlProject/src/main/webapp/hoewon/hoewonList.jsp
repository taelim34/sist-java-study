<%@page import="java.text.SimpleDateFormat"%>
<%@page import="hoewon.hoewonDto"%>
<%@page import="java.util.List"%>
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
<%
	hoewonDao dao=new hoewonDao();
	
	List<hoewonDto> list=dao.getAlldatas();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>
<body>
	<!-- 번호    회원명     비밀번호     아이디    가입날짜  수정/삭제-->
	<div style="margin: 100px 100px; width: 800px;">
		<button type="button" class="btn btn-info"
		onclick="location.href='../hlog/loginForm.jsp'"
		style="margin-left: 400px;">Login</button>
		<table class="table table-bordered">
			<tr>
				<th>번호</th>
				<th>회원명</th>
				<th>비밀번호</th>
				<th>아이디</th>
				<th>가입날짜</th>
				<th>수정/삭제</th>
			</tr>
			<%
				for(int i=0;i<list.size();i++)
				{
					hoewonDto dto=list.get(i);
					%>
						<tr>
							<td><%=list.size()-i %></td>
							<td><%=dto.getName() %></td>
							<td><%=dto.getPass() %></td>
							<td><%=dto.getMid() %></td>
							<td><%=sdf.format(dto.getGaipday()) %></td>
							<td>
								<button type="button" class="btn btn-success" 
								onclick="location.href='updateForm.jsp?num=<%=dto.getNum()%>>'">수정</button>
								<button type="button" class="btn btn-danger" 
								onclick="location.href='deletePassForm.jsp?num=<%=dto.getNum()%>'">삭제</button>
							</td>
						</tr>
					
				<%}
			%>
		</table>
	</div>
	
</body>
</html>