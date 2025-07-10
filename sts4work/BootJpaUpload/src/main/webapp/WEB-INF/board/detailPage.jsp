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
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>게시글 상세</title>
<style>
	pre {
		font-family: 'Gowun Batang';
		font-size: 1.2em;
		white-space: pre-wrap; /*내용이 길어질 경우 자동 줄바꿈*/
	}
</style>
</head>
<body>
<div style="margin: 50px 100px;">
	<table class="table table-bordered">
		<caption align="top"><b>게시글 내용 확인</b></caption>
		<tr>
			<th style="width: 100px;">작성자</th>
			<td>${dto.writer}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${dto.subject}</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>
				<fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd HH:mm"/>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<%-- 사진이 'no'가 아닐 경우에만 이미지 태그를 표시 --%>
				<c:if test="${dto.photo ne 'no'}">
					<img alt="" src="../save/${dto.photo}" style="max-width: 400px; margin-bottom: 20px;">
				</c:if>
				
				<br>
				<pre>${dto.content}</pre>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" class="btn btn-success"
				  onclick="location.href='list'">목록</button>
				<button type="button" class="btn btn-info"
				  onclick="location.href='form'">글쓰기</button>
				<button type="button" class="btn btn-warning"
				  onclick="location.href='updateform?num=${dto.num}'">수정</button>
				<button type="button" class="btn btn-danger"
				  onclick="remove(${dto.num})">삭제</button>
			</td>
		</tr>
	</table>
	
	<script type="text/javascript">
		function remove(num){
			if(confirm("정말 삭제하시겠습니까?")){
				
				alert(num);
				location.href="delete?num="+num;
			}
		}
	</script>
</div>

</body>
</html>