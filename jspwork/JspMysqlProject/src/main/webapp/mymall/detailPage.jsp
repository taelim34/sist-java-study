<%@page import="mysql.db.MymallDao"%>
<%@page import="mysql.db.MymallDto"%>
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
div {
	margin-left: 80px;
	margin-top: 80px;
}
</style>
</head>
<%
	MymallDto dto=new MymallDto();
	MymallDao dao=new MymallDao();
	
	String num=request.getParameter("num");
	
	dto=dao.getData(num);
%>
<body>
<div>
	<h2 class="alert alert-success" style="width: 800px;"><%=dto.getNum() %>번 상품 상세보기</h2>
	<table class="table table-bordered" style="width: 800px;">
		<tr>
			<th>상품이미지</th>
			<td><img src="../image/쇼핑몰사진/<%=dto.getPhoto()%>.jpg"> </td>
		</tr>
		<tr>
			<th>상품명</th>
			<td><%=dto.getSangpum() %></td>
		</tr>
		<tr>
			<th>가격</th>
			<td><%=dto.getPrice() %>원</td>
		</tr>
		<tr>
			<th>색상</th>
			<td style="background-color: <%=dto.getColor() %>"></td>
		</tr>
		<tr>
			<th>입고일</th>
			<td><%=dto.getIpgoday() %></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><%=dto.getWriteday() %></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" class="btn btn-info">수정</button>
				<button type="button" class="btn btn-danger">삭제</button>
				<button type="button" class="btn btn-success"
				onclick="location.href='mallList.jsp'">목록</button>
			</td>
		</tr>
	</table>
</div>

</body>
</html>