<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.SmartDto"%>
<%@page import="data.dao.SmartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String num=request.getParameter("num");
	SmartDao dao=new SmartDao();
	
	//dto
	SmartDto dto=dao.getData(num);
	//조회수
	dao.updateReadCount(num);
	//날짜포맷
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<body>
	<div class="content">
		<table class="table table-bordered" style="width: 500px;">
			<tr>
				<td>
					<h3><%=dto.getSubject() %></h3>
					<br>
					<b><%=dto.getWriter() %></b>
					<span><%=sdf.format(dto.getWriteday()) %></span>
					<span>조회수: <%=dto.getReadcount() %></span>
				</td>
			</tr>
			<tr height="200px;">
				<td>
					<%=dto.getContent() %>
				</td>
			</tr>
			
			<tr>
				<td>
					<button type="button" class="btn btn-info"
					onclick="location.href='index.jsp?main=smart/smartform.jsp'">글쓰기</button>
					<button type="button" class="btn btn-info"
					onclick="location.href=''">수정</button>
					<button type="button" class="btn btn-info"
					onclick="location.href=''">삭제</button>
					<button type="button" class="btn btn-info"
					onclick="location.href='index.jsp?main=smart/selist.jsp'">목록</button>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>