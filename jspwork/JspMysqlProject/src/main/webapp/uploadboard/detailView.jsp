<%@page import="java.text.SimpleDateFormat"%>
<%@page import="uploadboard.UploadDto"%>
<%@page import="uploadboard.UploadDao"%>
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
div.alist span.aday{
	float: right;
	color: gray;
	font-size: 11 pt;
}
div.title{
	border-radius: 10px;
	margin: 100px 100px;
	border: 1px solid gray;
	width: 900px;
	height: 900px;
}
div button.btn{
	float: right;
	margin-right: 10px;
	margin-top: 30px;
}
</style>
<script type="text/javascript">
	$(function(){
		
		//처음시작시 댓글목록 호출
		list();
		
		//insert
		var num=$("#num").val();
		console.log(num);
		
		$("#btnSend").click(function(){
			
			var nickname=$("#nickname").val().trim();
			var content=$("#content").val().trim();
			
			if(nickname==''){
				alert("닉네임을 입력후 저장해주세요");
				return;
			}
			
			if(content==''){
				alert("댓글내용을 입력후 저장해주세요");
				return;
			}
			
			//ajax로 insert해보기
			$.ajax({
				type:"post",
				url:"insertAnswer.jsp",
				dataType:"text",
				data:{
					"num": num,
					"nickname":nickname,
					"content": content,
				},
				success:function(){
					alert("댓글이 등록되었습니다!");
					$("#nickname").val("");
				    $("#content").val("");
				    list();
				},
				statusCode:{
					404:function(){
						alert("파일이 없다");
					},500:function(){
						alert("서버오류.. 코드 다시한번 볼것!!")
					}
				}
			});
			
		});
		
		//댓글 삭제
			$(document).on("click",".adel",function(){
				
				if (!confirm("정말 이 댓글을 삭제하시겠습니까?")) {
			        return;
			    }
				
				var idx=$(this).attr("idx");
				$.ajax({
					type:"post",
					url:"deleteAnswer.jsp",
					dataType:"html",
					data:{"idx":idx},
					success:function(){
						list();	
					},
					statusCode:{
						404:function(){
							alert("파일이 없습니다")
						},
						500:function(){
							alert("서버오류...코드다시볼것!!")
						}
					}
			});
		});
			
		//수정창안보이게
		$("div.aupdateForm").hide();
		
		//댓글 수정폼 나오게 하기
			$(document).on("click",".mod",function(){
				
				$(".aform").hide();
				$("div.aupdateForm").show();
				var idx=$(this).attr("idx");
				$.ajax({
					type:"get",
					url:"dtoAnswer.jsp",
					dataType:"json",
					data:{"idx":idx},
					success:function(res){
							$("#unickname").val(res.nickname);
							$("#ucontent").val(res.content);
							$("#idx").val(res.idx);
					},
					statusCode:{
						404:function(){
							alert("파일이 없습니다")
						},
						500:function(){
							alert("서버오류...코드다시볼것!!")
						}
					}
			});
		});
		
		//댓글 수정
		$(document).on("click","#btnuSend",function(){
				
				var nickname = $("#unickname").val().trim();
           		var content = $("#ucontent").val().trim();
           		var idx=$("#idx").val().trim();
           		
				$.ajax({
					type:"get",
					url:"updateAnswer.jsp",
					dataType:"html",
					data:{
						"idx":idx,
						"nickname":nickname,
						"content":content
					},
					success:function(){
						alert("수정완료");
						list();
						$("div.aupdateForm").hide();
						$(".aform").show();
					},
					statusCode:{
						404:function(){
							alert("파일이 없습니다")
						},
						500:function(){
							alert("서버오류...코드다시볼것!!")
						}
					}
			});
		});
			
			
	});
	
	function list()
	{
		//댓글 출력
		console.log("list num="+$("#num").val());
		
		$.ajax({
			
			type:"get",
			url:"listAnswer.jsp",
			dataType:"json",
			data:{"num": $("#num").val()},
			success:function(res){
				
				//댓글갯수 출력
				$("b.acount>span").text(res.length);
				
				var s="";
				$.each(res,function(idx,item){
					
					s+="<div>"+"<i class='bi bi-person-circle'></i>"
					s+=item.nickname+": "+item.content;
					s+="<span class='aday'>"+item.writeday+"</span>&nbsp;&nbsp;&nbsp;";
					s+="<i class='bi bi-trash adel' idx='"+item.idx+"'></i>";
					s+="<i class='bi bi-pencil-square mod' idx='"+item.idx+"'></i>";
					s+="</div>"
				});
				
				$("div.alist").html(s);
			}
		});
	}
	
	
	
</script>
</head>
<%
	String num=request.getParameter("num");

	UploadDao dao=new UploadDao();
	UploadDto dto=dao.getData(num);
	
	dao.updateReadcount(num);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	//현재 페이지 번호
	String currentPage=request.getParameter("currentPage");
%>
<body>
<input type="hidden" id="num" value="<%=num %>">
<div class="title">
	<button type="button" class="btn btn-success" 
	onclick="location.href='boardList.jsp?currentPage=<%=currentPage%>'">목록</button>
	<button type="button" class="btn btn-danger" 
	onclick="location.href='deletePassForm.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>'">삭제</button>
	<button type="button" class="btn btn-warning" 
	onclick="location.href='updateForm.jsp?num=<%=dto.getNum() %>&currentPage=<%=currentPage%>'">수정</button>
	<table style="width: 800px; margin: 50px;">
		<tr>
			<td>
				<h2><%=dto.getSubject() %></h2>
				<b><%=dto.getWriter() %></b>
				<br>
				<span style="color: gray; font: 9pt;"><%=sdf.format(dto.getWriteday()) %>  조회수: <%=dto.getReadcount() %></span>
				<hr>
			</td>
		</tr>
		<tr>
			<td>
				<%=dto.getContent().replace("\n", "<br>") %>
				<br>
				<img alt="" src="../save/<%=dto.getImgname() %>">
			</td>
		</tr>
		<tr>
			<td>
				<b class="acount">댓글<span>0</span></b>
				<div class="alist">
					댓글목록
				</div>
				<!-- 입력창 -->
				<div class="aform input-group">
					<input type="text" id="nickname" class="form-control"
					style="width: 100px;" placeholder="닉네임">
					<input type="text" id="content" class="form-control"
					style="width: 300px; margin-left: 10px;" placeholder="댓글메세지">
					<button type="button" id="btnSend"
					class="btn btn-info" style="margin-left: 10px;">저장</button>
				</div>
				
				<!-- 수정창 -->
				<div class="aupdateForm input-group">
					<input type="hidden" id="idx" value="">
					<input type="text" id="unickname" class="form-control"
					style="width: 100px;" placeholder="닉네임">
					<input type="text" id="ucontent" class="form-control"
					style="width: 300px; margin-left: 10px;" placeholder="댓글메세지">
					<button type="button" id="btnuSend"
					class="btn btn-info" style="margin-left: 10px;">수정</button>
				</div>
			</td>
		</tr>
	</table>
</div>
</body>
</html>