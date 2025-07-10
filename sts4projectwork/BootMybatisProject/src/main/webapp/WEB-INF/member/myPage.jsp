<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Hi+Melody&family=Nanum+Myeongjo&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>Insert title here</title>
<style type="text/css">
  body{
    width: 100%;
    margin: 0 ;
  }
  
    .container {
      display: flex;
      flex-direction: column; /* 세로로 쌓기 */
      align-items: center;     /* 가로 정렬 중앙 */
      justify-content: center; /* 세로 정렬 중앙 */
      height: 100%;
    }
</style>
<script type="text/javascript">
$(function(){ 
	
	//버튼클릭시 파일열기
	$("button.btnnewphoto").click(function(){
		$("#newphoto").trigger("click");
		
	});
	
	$("#newphoto").change(function(){
		
		var num=$(this).attr("num");
		console.log(num);
		
		var form=new FormData();
		form.append("photo",$("#newphoto")[0].files[0]);  //선택한 1개만 추가
		form.append("num",num);
		
		console.dir(form);
		
		$.ajax({
			
			type:"post",
			dataType:"html",
			url:"updatephoto",
			processData:false,
			contentType:false,
			data:form,
			success:function(){
				
				location.reload();
			}
		});
	});
	
	$(".btnupdate").click(function(){
		// 1. 클릭한 버튼에서 data-* 속성값 가져오기
	    var num = $(this).data("num");
	    var name = $(this).data("name");
	    var hp = $(this).data("hp");
	    var email = $(this).data("email");
	    
	    // 2. 모달의 각 입력 필드에 값 채우기
	    $("#updateName").val(name);
	    $("#updateHp").val(hp);
	    $("#updateEmail").val(email);
	    
	 	// 3. 실제 DB 수정을 위해 모달의 '수정하기' 버튼에 num값 저장하기
	    $("#mypageUpdate").attr("data-num", num);
	});
	
	$("#mypageUpdate").click(function(){
		
	 	var num = $(this).attr("data-num");
	    var name = $("#updateName").val();
	    var hp = $("#updateHp").val();
	    var email = $("#updateEmail").val();
		
	    
	    $.ajax({
	    	
	    	type:"post",
			dataType:"html",
			url:"update",
			data:{"num":num,"name":name,"hp":hp,"email":email},
			success:function(){
				alert("정보 수정이 완료되었습니다");
				
				location.reload();
			}
	    	
	    });
	});
	
	$("#btndelete").click(function(){
		
		var num = $(this).attr("data-num");
		
		if(confirm("정말 탈퇴하시겠습니까?")){
			
			$.ajax({
				
				type:"get",
				dataType:"html",
				url:"delete",
				data:{"num":num},
				success:function(){
					alert("탈퇴성공");
					
					location.reload();
				}
			});
		}
	});
	
});
</script>
</head>
<body>

<div class="container">
   <jsp:include page="../../layout/header.jsp"></jsp:include>
   
<div  style="margin: 200px; width: 600px;">
       <table class="table table-bordered">
          <c:forEach  var="dto" items="${list }">
          
          <c:if test="${sessionScope!=null && sessionScope.myid==dto.id }">
          
            <tr>
               <td style="width: 220px;" align="center" rowspan="5">
                  <img alt="" src="../membersave/${dto.photo }" width="200px;">
                  <br>
                  <input type="file" id="newphoto" style="display: none;" num="${dto.num }"><br>
                  <button type="button" class="btn btn-info btnnewphoto">사진수정</button>
               </td>
               <td>아이디:  ${dto.id }</td>
               <td rowspan="4" valign="middle" align="center">
                  <button type="button" class="btn btn-outline-warning btn-sm btnupdate"
                  data-bs-toggle="modal" data-bs-target="#MyUpdateModal"
                  data-num="${dto.num}"data-name="${dto.name}"
                  data-hp="${dto.hp}"data-email="${dto.email}">수정</button>
                  <br><br>
                  <button type="button" class="btn btn-outline-danger btn-sm"
                  id="btndelete" data-num="${dto.num }">탈퇴</button>
               </td>
            </tr>
            <tr>
              <td>${dto.name }</td>
            </tr>
            <tr>
              <td>${dto.hp }</td>
            </tr>
            <tr>
              <td>${dto.email }</td>
            </tr>
            <tr>
              <td>${dto.gaipday }</td>
            </tr>
            
           </c:if> 
            
           
          </c:forEach>
       </table>
    </div>
</div>


<!-- 모달 -->
<div class="modal fade" id="MyUpdateModal" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <div class="modal-header">
        <h4 class="modal-title fw-bold">수정</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <div class="modal-body px-4 py-4">
        
        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="updateName" placeholder="이름 입력" required>
            <label for="updateName">이름</label>
        </div>
        
        <div class="form-floating mb-4">
             <input type="text" class="form-control" id="updateHp" placeholder="전화번호 입력" required>
             <label for="updateHp">전화번호</label>
        </div>
        
        <div class="form-floating mb-4">
             <input type="text" class="form-control" id="updateEmail" placeholder="이메일 입력" required>
             <label for="updateEmail">이메일</label>
        </div>
        
        <button type="button" class="btn btn-primary w-100 py-2 fs-5" id="mypageUpdate">수정</button>
      </div>
      
    </div>
  </div>
</div>
</body>
</html>