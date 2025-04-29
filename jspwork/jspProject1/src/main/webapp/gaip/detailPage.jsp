<%@page import="java.text.SimpleDateFormat"%>
<%@page import="gaip.GaipDto"%>
<%@page import="gaip.GaipDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Black+Han+Sans&family=East+Sea+Dokdo&family=Gowun+Batang&family=Nanum+Myeongjo&family=Stylish&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
<style type="text/css">
button{
	float: right;
	margin: 10px
}
div{
	margin-left: 130px;
	margin-top: 70px;
}


</style>
</head>
<%
  GaipDao dao=new GaipDao();
  GaipDto dto=new GaipDto();
  String num=request.getParameter("num");
  dto = dao.getData(num);
%>
<body>
<div style="width: 600px;">
	<h2><%=dto.getName() %>님의 가입정보</h2>
	<table class="table table-bordered" style="width: 600px;">
		<tr>
			<th class="table-success">연령대</th>
			<td><%=dto.getAge() %>대</td>
		</tr>
		<tr>
			<th class="table-success">생년월일</th>
			<td><%=dto.getBirth() != null ? dto.getBirth().substring(0, 10) : "입력 안 됨" %></td>
		</tr>
		<tr>
			<th class="">가능한 언어</th>
			<td><%="no".equals(dto.getLang())?"가능한 언어 없음":dto.getLang() %></td>
		</tr>
		<tr>	
			<th class="table-success">연락처</th>
			<td><%=dto.getHp()%></td>
		</tr>
	</table>
	<button class="btn btn-danger"
	onclick="confirmDelete(<%=dto.getNum()%>)">삭제</button>

	<button class="btn btn-warning"
	onclick="location.href='updateForm.jsp?num=<%=dto.getNum() %>'">수정</button>
	<button class="btn btn-success"
	onclick="location.href='gaipList.jsp'">목록</button>
	
</div>
<script type="text/javascript">
	function confirmDelete(num) {
	    if (confirm("정말 삭제하시겠습니까?")) {
	        location.href='delete.jsp?num='+num;
	    }
	}
</script>
</body>
</html>