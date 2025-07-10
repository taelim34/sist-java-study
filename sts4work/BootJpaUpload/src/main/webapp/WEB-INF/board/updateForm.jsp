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
<script type="text/javascript">
$(function(){
	
	$("#myphoto").change(function(e){
		const file=e.target.files[0];
		if(file){
			const reader = new FileReader();
			
			reader.onload = function(event){
				
				$("#showimg").attr("src",event.target.result);
			};
			
			reader.readAsDataURL(file);
		}
	});
});
</script>
</head>
<body>
<form action="update" method="post" enctype="multipart/form-data">
	<input type="hidden" name="num" value="${dto.num }">
	<table class="table table-bordered" style="width: 600px;">
	<caption align="top"><b>수정폼</b></caption>
		<tr>
			<th>작성자</th>
			<td>
				<input type="text" class="form-control" name="writer" value="${dto.writer }">
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>
				<input type="text" class="form-control" name="subject" value="${dto.subject }">
			</td>
		</tr>
		<tr>
			<th>사진</th>
			<td>
				<input type="file" class="form-control" name="upload" id="myphoto">
				<img id="showimg" alt="미리보기" style="max-width: 200px;"
            	src="${dto.photo == null || dto.photo == 'no' ? 'no.png' : '../save/'}${dto.photo}">
			</td>
		</tr>
		
		<tr>
			<td colspan="2">
				<textarea style="width: 480px; height: 100px;"
				required="required" name="content" class="form-control">${dto.content }</textarea>
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