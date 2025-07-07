<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Black+Han+Sans&family=East+Sea+Dokdo&family=Gowun+Batang&family=Nanum+Myeongjo&family=Stylish&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>Insert title here</title>
</head>
<body>
<form action="update" method="post" enctype="multipart/form-data">
	<input type="hidden" name="num" value="${dto.num }"> 
	<table class="table table-bordered" style="width: 600px;">
	<caption align="top"><b>수정폼</b></caption>
		<tr>
			<th>이름</th>
			<td>
				<input type="text" class="form-control" name="sangpum" value="${dto.sangpum }">
			</td>
		</tr>
		<tr>
			<th>가격</th>
			<td>
				<input type="text" class="form-control" name="price" value="${dto.price }">
			</td>
		</tr>
		<tr>
			<th>사진</th>
			<td>
				<input type="file" class="form-control" name="photo">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit" class="btn btn-danger">수정</button>
				<button type="button" class="btn btn-info"
				onclick="location.href='list'">목록</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>