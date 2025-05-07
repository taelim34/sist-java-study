<%@page import="java.text.SimpleDateFormat"%>
<%@page import="booking.BookingDao"%>
<%@page import="booking.BookingDto"%>
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
div {
	position: absolute;
	top: 200px;
	left: 600px;
}
</style>
</head>
<%
  BookingDto dto=new BookingDto();
  BookingDao dao=new BookingDao();
  
  String num=request.getParameter("num");
  
  dto=dao.getData(num);
  
  String [] foodArr =dto.getFoodphoto().split(",");
  String [] foodpriceArr=dto.getFoodprice().split(",");
  
  SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<body>
<div>
  <table class="table table-bordered" style="width: 900px;">
  	<tr>
  	  <th colspan="5"><h2><%=dto.getName() %>님의 예약정보</h2></th>
  	</tr>
    
  	<tr>
  	  <th>성별</th>
  	  <td><%=dto.getGender().equals("m")?"남자":"여자" %></td>
  	</tr>
  	<tr>
  	  <th>선택한 메뉴</th>
  	  <td>
  	    <%for(int i=0;i<foodArr.length;i++){
  	    	String photo = foodArr[i].trim();
  	    	String fName = photo.replaceAll(".jpg", "");
  	    	String price = foodpriceArr[i].trim();
  	    %>	
  	    	<figure style="float: left; margin-right: 10px;">
  	    	<img src="../image/bookingimg/<%=photo %>" style="width: 130px; height: 110px;">
  	    	<figcaption><b><%=fName %> <br>가격:   <%=price %>원</b></figcaption>	    	
  	    	</figure>
  	   <% }%>
  	  </td>
  	</tr>
  	<tr>
  	<%
  	int totalPrice =0;
  	for(String price : foodpriceArr)
  	{
  		totalPrice+= Integer.parseInt(price.trim());
  	}
  	%>
  	  <th>총가격</th>
  	  <td><b><%=totalPrice %></b>원</td>
  	</tr> 
  	<tr>
  	<tr>
  	  <th>인원수</th>
  	  <td><%=dto.getInwon() %>명</td>
  	</tr>
  	  <th>예약시간</th>
  	  <td><%=dto.getBookday().replaceAll("T", " ") %>분</td>
  	</tr>
  	<tr>
  	  <th>주문시간</th>
  	  <td><%=sdf.format(dto.getWriteday()) %>분</td>
  	</tr>
  	<tr>
  	  <th>메세지</th>
  	  <td><%=dto.getMessage() %></td>
  	</tr>
  	<tr>
  	  <td colspan="5" align="center"><button type="button" onclick="location.href='bookingList.jsp'"
  	  class="btn btn-warning">돌아가기</button>
  	  <button type="button" class="btn btn-info" onclick="location.href='bookingUpdateForm.jsp?num=<%=num%>'">수정하기</button>
  	  <button type="button" onclick="if(confirm('정말 예약을 취소하시겠습니까?')) location.href='deleteBooking.jsp?num=<%=num %>'"
  	  class="btn btn-danger">예약취소</button></td>
  	</tr>
  </table>
</div>
</body>
</html>