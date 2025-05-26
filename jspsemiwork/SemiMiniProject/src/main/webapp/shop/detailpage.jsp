<%@page import="data.dto.ShopDto"%>
<%@page import="data.dao.ShopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Hi+Melody&family=Nanum+Myeongjo&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>Insert title here</title>
</head>
<%
	String shopnum=request.getParameter("shopnum");

	ShopDao dao=new ShopDao();
	ShopDto dto=dao.getData(shopnum);
%>
<body>
<div>
	<table class="table table-bordered">
		<tr>
			<th colspan="2"><%=dto.getCategory() %></th>
		</tr>
		<tr>
			<td style="width: 600px;">
				<img alt="" src="save/<%=dto.getPhoto()%>" style="width: 600px;">
			</td>
			<td align="center">
				<span>상품명: <%=dto.getSangpum() %></span>
				<br>
				<span><%=dto.getPrice() %>원</span>
				<br>
				<input type="number" min="1" max="100" step="1" value="1">
				<br>
				<button class="btn btn-success">장바구니</button>
				<button class="btn btn-success">목록</button>
			</td>
		</tr>
	</table>
</div>
</body>
</html>