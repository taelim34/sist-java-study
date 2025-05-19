<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Hi+Melody&family=Nanum+Myeongjo&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>Insert title here</title>
</head>
<%
  MemberDao dao=new MemberDao();
  List<MemberDto> list=dao.getAllMembers();
  SimpleDateFormat sdf=new SimpleDateFormat("yyyy년 MM월 dd일 HH시");
  
  String loginok=(String)session.getAttribute("loginok");
  String myid=(String)session.getAttribute("myid");
%>
<body>
  <div style="margin: 200px 100px;  width: 700px;">
    <table class="table table-bordered">
        <%
          for(MemberDto dto:list)
          {
          
        	  
        	  if(loginok!=null && myid.equals(dto.getId())){%>
        	  	
        	  <tr>
        	    <td rowspan="4">
        	      <img alt="" src="image2/title.png" 
        	      style="width: 100px; height: 100px; border-radius: 100px;">
        	    </td>
        	    <td>회원명: <%=dto.getName() %></td>
        	    <td rowspan="4" >
        	      <button type="button" onclick="location.href='./index.jsp?main=member/updateform.jsp?num=<%=dto.getNum()%>'">수정</button>
        	      <button>탈퇴</button>
        	    </td>
        	  </tr>
        	  <tr>
        	    <td>
        	      아이디: <%=dto.getId() %>
        	    </td>
        	  </tr>
        	  <tr>
        	    <td>
        	       이메일: <%=dto.getEmail() %>
        	    </td>
        	  </tr>
        	  <tr>
        	    <td>
        	       가입일: <%=sdf.format(dto.getGaipday()) %>
        	    </td>
        	  </tr>
        	  <%}
          }
          %>
    </table>
  </div>
  
  
  <!-- Modal -->
<div class="modal fade" id="myDelModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">삭제확인</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <b>삭제비밀번호:  </b>
        <input type="password" class="form-control" style="width: 120px;" id="delpass">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
  
  
  
  
</body>
</html>