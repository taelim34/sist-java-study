<%@page import="java.util.Vector"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="booking.BookingDto"%>
<%@page import="booking.BookingDao"%>
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
table{
	margin: 50px;
}

div {
	position: absolute;
	top: 200px;
	left: 600px;
}

</style>
</head>
<%
  BookingDao dao=new BookingDao();
  Vector<BookingDto> list=dao.getAllBooking();
  SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<body>
<div>
  <table class="table table-bordered" style="width: 800px;">
    <tr>
      <th colspan="5" class="table-success"><h1>예약자 명단</h1></th>
    </tr>
    <tr>
      <th colspan="5">총 <%=list.size() %>팀의 예약이 있습니다</th>
    </tr>
    <tr>
      <th>번호</th>
      <th>예약자명</th>
      <th>인원수</th>
      <th>예약시간</th>
      <th>상세보기</th>
    </tr>
    
    <%
    if(list.size()==0)
    {%>
	  <tr>
	    <td colspan="5" align="center">
	      <h3>예약정보가 없습니다</h3>
	    </td>
	  </tr>
	<%}else{
		for(int i=0;i<list.size();i++)
		{
			BookingDto dto=list.get(i);%>
			
			<tr>
    		   <td><%=list.size()- i %></td>
    		   <td><%=dto.getName() %></td>
    		   <td><%=dto.getInwon() %></td>
    		   <td><%=dto.getBookday().replaceAll("T", " ") %>분</td>
    		   <td>
    		     <button type="button" class="btn btn-warning"
    		     onclick="location.href='bookingView.jsp?num=<%=dto.getNum()%>'">상세보기</button>
    		   </td>
    		 </tr> 
		<%}
	}
    %>
    <tr>
      <td colspan="5" align="center">
      <button type="button" class="btn btn-success" onclick="location.href='bookingForm.jsp'">입력으로 돌아가기</button>
      </td>
    </tr>
  </table>

</div>
</body>
</html>