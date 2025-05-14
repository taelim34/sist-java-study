<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Black+Han+Sans&family=East+Sea+Dokdo&family=Gowun+Batang&family=Nanum+Myeongjo&family=Stylish&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	i.camera{
		cursor: pointer;
		margin-left: 20px;
		font-size: 2em;
		color: gray;
	}
	
	#showimg{
		position: absolute;
		left: 530px;
		top: 50px;
		max-width: 150px;
	}
</style>
</head>
<script type="text/javascript">
$(function(){
	
		$("i.camera").click(function(){
			$("#photo").trigger("click");
		})
});

function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#showimg').attr('src', e.target.result); 
		}
		reader.readAsDataURL(input.files[0]);
	}
}
</script>
<body>
<%
	//로그인상태
	String loginok=(String)session.getAttribute("loginok");
	String id=(String)session.getAttribute("mid");

	if(loginok!=null){%>
			<!-- 이미지 미리보기 -->
			<img src="" id="showimg">
			<form action="guestProc.jsp" method="post"
			enctype="multipart/form-data">
				<input type="hidden" name="myid" value="<%=id%>">
				<table class="table table-bordered" style="width: 510px;">
					<caption align="top"><b>회원방명록</b></caption>
					<tr height="150">
						<td>
							<b>사진을 선택해주세요(1개)</b>
							<i class="bi bi-camera-fill camera"></i>
							<input type="file" name="photo" id="photo"
							style="display: none;" onchange="readURL(this)">
							<br>
							<textarea style="width: 400px; height: 100px;"
							required="required" name="content"></textarea>
							<button type="submit" class="btn btn-outline-success"
							style="width: 80px; height: 100px; float: right;">저장</button>
						</td>
					</tr>
				</table>
			</form>
	<%}else{%>
			<b>먼저 로그인을 해주세요</b>
	<%}
%>
</body>
</html>