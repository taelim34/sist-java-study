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
<form action="uploadAction.jsp" method="post"
enctype="multipart/form-data">
	<table class="table table-bordered" style="width: 500px;">
		<tr>
			<th>이름</th>
			<td>
				<input type="text" name="name">
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>
				<input type="text" name="subject">
			</td>
		</tr>
		<tr>
			<th>파일</th>
			<td>
				<input type="file" name="uploadFile">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit">업로드</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>