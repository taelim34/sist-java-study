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
<button type="button" class="btn btn-outline-primary"
onclick="location.href='form'">글작성하기</button>
<h3 class="alert alert-info">총 ${count }개의 글이 있습니다</h3>

<!-- 목록형: 번호 제목 작성자 작성일 제목누르면 디테일로 이동 -->
<table class="table table-bordered">
	<c:forEach var="dto" items="${list }" varStatus="i">
	<tr>
		<td width="100">
			<a href="detailpage?num=${dto.num }">
				<img alt="" src="../save/${dto.photo }" style="width: 150px;">
			</a>
			
			<c:if test="${dto.photo.equals('no') }">
				<a href="detailpage?num=${dto.num }">
					<img alt="" src="../no.png" style="width: 150px;">
				</a>
			</c:if>
		</td>
		<td>
			<a href="detailpage?num=${dto.num }">
					<h2>${dto.subject }</h2>
			</a>
			<br>
			${dto.content }
			<br>
			<br><br><br>
			<span style="color: gray;">작성자:${dto.writer }<br>${dto.writeday }</span>
			<button type="button" class="btn btn-danger" style="float: right;"
			onclick="remove(${dto.num})">삭제</button>
			<button type="button" class="btn btn-success" style="float: right;"
			onclick="location.href='updateform?num=${dto.num}'">수정</button>
		</td>
	</tr>

	</c:forEach>
</table>
<script type="text/javascript">
	function remove(num){
		if(confirm("정말 삭제하시겠습니까?")){
			
			alert(num);
			location.href="delete?num="+num;
		}
	}
</script>
</body>
</html>