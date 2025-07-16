<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dongle&family=Nanum+Brush+Script&family=Orbit&family=Song+Myung&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	
	list();
	
	var num=$("#num").val();
	
	$("#btnansweradd").click(function(){
		
		let num = $("#num").val();
        let content = $("#content").val();
		
		if(content.trim().length==0){
			alert("댓글을 입력해주세요");
			return;
		}
		
		$.ajax({
			type:"post",
			url:"ainsert",
			dataType:"html",
			data:{"num":num ,"content":content},
			success:function(){
				alert("댓글 저장 성공");
				$("#content").val("");
				list();
			}
		})
	});
	
	$(document).on("click",".adelete",function(){
		
		let idx = $(this).attr("data-idx");
		
		if(confirm("정말 삭제하시겠습니까")){
		
			$.ajax({
				type:"post",
				url:"adelete",
				dataType:"html",
				data:{"idx":idx},
				success:function(){
					alert("댓글 삭제 성공");
					list();
				}
			});
		}
	});
		
	
	
	
});

function list()
{
	let num = $("#num").val();
    let loginok = "${sessionScope.loginok}";
    let myid = "${sessionScope.myid}";
	
	$.ajax({
		type:"get",
		url:"alist",
		dataType:"json",
		data:{"num":num},
		success:function(res){
			let s="";
			$.each(res,function(i,data){
				s+="<br>"
				s+="<b>"+data.name+"</b>"
				s+="<span>";
				s+=data.content;
				s+="</span>";
				s+="<span class='day'>"+data.writeday+"</span>&nbsp;&nbsp;"
				if(loginok =='yes' && myid==data.myid){
					s+='<i class="bi bi-pencil aupdate" data-idx="'+data.idx+'"></i>';
					s+='&nbsp;&nbsp;';
					s+='<i class="bi bi-trash3 adelete" data-idx="'+data.idx+'"></i>';
				}
				s+="<br>"
			});
			$(".alist").html(s);
			
		}
	})
}


</script>
</head>
<body>
<div class="container">
   <jsp:include page="../../layout/header.jsp"></jsp:include>
   <table class="table table-bordered">
      <tr>
      	<td>
      		<h4><b>${dto.subject }</b></h4>
      		
      		<span style="font-size: 9pt; color: gray;">
      			<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/>
      		</span>
      		<br>
      		<h6>작성자: ${dto.name }(${dto.myid })</h6>
      		
      		<c:if test="${dto.uploadfile!='no' }">
      			<span>
      				<a href="download?clip=${dto.uploadfile }">
      					<i class="bi bi-file-arrow-down-fill fs-3">${dto.uploadfile}</i>
      				</a>
      			</span>
      			<span>조회수: ${dto.readcount }</span>
      		</c:if>
      	</td>
      </tr>
      <tr>
      	<td style="max-height: 800px; height: 300px;">
      		<c:if test="${dto.uploadfile!='no' }">
      			<h6></h6>
      			<img alt="" src="../boardsave/${dto.uploadfile }">
      		</c:if>
      		<br><br>
      		<pre>
      			${dto.content }
      		</pre>
      	</td>
      </tr>
      
      <!-- 댓글 -->
      <tr>
      	<td>
      		<b>댓글 <span class="acount">0</span></b>
      		
      		<div class="alist">리스트</div>
      		<input type="hidden" id="num" value="${dto.num}">
      		<c:if test="${sessionScope.loginok!=null }">
      			<div class="afrom input-group" style="width: 400px;">      				
	      			<input type="text" id="content" class="form-control">
	      			<button type="button" class="btn btn-success" style="width: 60px;" id="btnansweradd">전송</button>
      			</div>
      		</c:if>
      		
      	</td>
      </tr>
      
      <tr>
      	<td>
      		<!-- 글쓰기: 로그인중일때만 보이게 -->
      		<c:if test="${sessionScope.loginok!=null }">
      			<button type="button" class="btn btn-outline-primary"
	      		onclick="location.href=''">글쓰기</button>
      		</c:if>
	      		<button type="button" class="btn btn-outline-primary"
      			onclick="location.href='list?currentPage=${currentPage}'">목록</button>
      		
      		<!-- 수정삭제: 로그인중이면서 세션아이디가 글쓴이와 같은아이디일경우 보이게 -->
      		<c:if test="${sessionScope.myid==dto.myid }">
      		
      		</c:if>
      		<button type="button" class="btn btn-outline-primary"
      		onclick="location.href=''">수정</button>
      		<button type="button" class="btn btn-outline-primary"
      		onclick="location.href=''">삭제</button>
      	</td>
      </tr>
   </table>
   
</div>
</body>
</html>