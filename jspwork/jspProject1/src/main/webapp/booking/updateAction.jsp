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
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String num=request.getParameter("num");
String name=request.getParameter("name");
String gender=request.getParameter("gender");
String bookday=request.getParameter("local");
String message=request.getParameter("message");
int inwon=Integer.parseInt(request.getParameter("inwon"));

//메뉴와 가격(,로 연결해서 dto에 넣는다)
String foodphoto="";
String foodprice="";

String [] food=request.getParameterValues("food");

for(String f:food)
{
	  System.out.println(f);
	  //,로 분리해서 앞에가 name,뒤는 price ,추가
	  String [] data=f.split(",");
	  foodphoto+=data[0]+",";
	  foodprice+=data[1]+",";
}

//반복문 나와서 마지막 ,지우기
foodphoto=foodphoto.substring(0, foodphoto.length()-1);
foodprice=foodprice.substring(0, foodprice.length()-1);

BookingDto dto=new BookingDto();

dto.setName(name);
dto.setGender(gender);
dto.setBookday(bookday);
dto.setMessage(message);
dto.setFoodphoto(foodphoto);
dto.setFoodprice(foodprice);
dto.setInwon(inwon);
dto.setNum(num);

BookingDao dao=new BookingDao();
dao.updateBooking(dto);
response.sendRedirect("bookingView.jsp?num="+dto.getNum());

%>
</body>
</html>