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
<style type="text/css">
    .container {
      display: flex;
      flex-direction: column; /* 세로로 쌓기 */
      align-items: center;     /* 가로 정렬 중앙 */
      justify-content: center; /* 세로 정렬 중앙 */
      height: 100%;
    }
</style>
</head>
<body>
<div class="container">
   <jsp:include page="../../layout/header.jsp"></jsp:include>
   <div>
   <br><br><br>
   <c:if test="${sessionScope.myid!=null}">
	   <button type="button" class="btn btn-info"
	   onclick="location.href='addform'">글쓰기</button>
   </c:if>
   
   <br><br>
   <table class="table table-bordered" style="width: 1000px;">
   	<tr>
   		<th width="80">번호</th>
   		<th width="500">제목</th>
   		<th width="120">작성자</th>
   		<th width="80">조회</th>
   		<th width="280">등록일</th>
   	</tr>
   	
   	<c:if test="${totalCount==0}">
   		<tr>
   			<th colspan="5" align="center">등록된 글이 없습니다</th>
   		</tr>
   	</c:if>
   	<c:if test="${totalCount>0}">
   		<c:forEach var="dto" items="${list }">
   			<tr>
	   			<td>${no }</td>
	   			<c:set var="no" value="${no-1 }"></c:set>
	   			<td>
	   				<a>${dto.subject }</a>
	   				<c:if test="${dto.uploadfile!=null }">
	   					<i class="bi bi-paperclip"></i>
	   				</c:if>
	   			</td>
	   			<td>${dto.name }</td>
	   			<td>${dto.readcount }</td>
	   			<td>${dto.writeday }</td>
	   		</tr>
   		</c:forEach>
   	</c:if>
   </table>
   </div>
   
   <!--페이지 번호 출력  -->
     <div style="width: 800px;">
     <ul class="pagination justify-content-center">
     
     <!-- 이전 -->
        <c:if test="${startPage>1 }">
           <li class="page-item">
        	    <a class="page-link" href="list?currentPage=${startPage-1 }"
        	    style="color: black;">
        	      이전
        	    </a>
        	  </li>
        </c:if>
        
        <!-- 페이지번호-->
        <c:forEach  var="pp" begin="${startPage }" end="${endPage }">
          <c:if test="${pp==currentPage }">
              <li class="page-item active">
       				  <a class="page-link" href="list?currentPage=${pp }">${pp }</a>
       	      </li>
          </c:if>
          <c:if test="${pp!=currentPage }">
              <li class="page-item">
       				  <a class="page-link" href="list?currentPage=${pp }">${pp }</a>
       	      </li>
          </c:if>
        </c:forEach>
       <!-- 다음 -->
       <c:if test="${endPage<totalPage }">
          <li class="page-item">
        	    <a class="page-link" href="list?currentPage=${endPage+1 }"
        	    style="color: black;">
        	      다음
        	    </a>
        	  </li>
       </c:if>
       </ul>
    </div>
   
</div>

</body>
</html>