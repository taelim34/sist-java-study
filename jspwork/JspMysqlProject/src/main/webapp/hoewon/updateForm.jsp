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

</style>
<script type="text/javascript">
	function openId(){
		window.open("idCheck.jsp","","left=100px,top=100px,width=300px,height=150px")
	}
	$(function(){
			
			$("#btnSubmit").click(function(){
					if (frm.mid.value.length==0) {
						alert("아이디를 입력해주세요")
						return false;  //action 호출
					}
			});		
	});
</script>
</head>
<body>
<div style="margin: 100px 100px; width: 500px;">
	<form action="addAction.jsp" method="post" name="frm">
		<table class="table table-bordered">
			<caption align="top"><b>정보 수정</b></caption>
			<tr>
				<th class="table-warning" width="120">아이디</th>
				<td class="input-group">
					<input type="text" name="mid" style="max-width: 120px;" class="form-control"
					required="required" readonly="readonly">
					<button type="button" class="btn btn-danger btn-sm"
					onclick="openId()">ID 입력</button>
				</td>
			</tr>
			
			<tr>
				<th class="table-warning" width="120">비밀번호</th>
				<td>
					<input type="password" name="pass" style="max-width: 150px;" class="form-control"
					required="required">
				</td>
			</tr>
			
			<tr>
				<th class="table-warning" width="120">이름</th>
				<td>
					<input type="text" name="name" style="max-width: 130px;" class="form-control"
					required="required">
				</td>
			</tr>
			
			<tr>
				<th class="table-warning" width="120">핸드폰</th>
				<td>
					<input type="text" name="hp" style="max-width: 200px;" class="form-control"
					required="required">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-success" style="width: 150px;"
					id="btnSubmit">회원가입신청</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>