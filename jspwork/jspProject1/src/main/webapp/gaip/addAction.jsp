<%@page import="gaip.GaipDao"%>
<%@page import="gaip.GaipDto"%>
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

  String name=request.getParameter("name");
  String age=request.getParameter("age");
  String hp=request.getParameter("hp1")+"-"
  		  +request.getParameter("hp2")+"-"
		  +request.getParameter("hp3");
  String birth=request.getParameter("birth");
  String [] hobby=request.getParameterValues("hobby1");
  
  //dto로 값을 묶어서 
  GaipDto dto=new GaipDto();
  dto.setName(name);
  dto.setAge(age);
  dto.setHp(hp);
  dto.setBirth(birth);
  
  if(hobby != null)
  {
	  String hobbys= String.join(",",hobby);
	  dto.setLang(hobbys);
  }else{
	  dto.setLang("no");
  }
  //insert메서드 호출
  GaipDao dao=new GaipDao();
  dao.insertGaip(dto);
  //목록으로 이동
  response.sendRedirect("gaipList.jsp"); //실제로 브라우저가 이동
  //RequestDispatcher dispatcher = request.getRequestDispatcher("gaipList.jsp");
  //dispatcher.forward(request, response); 브라우저가 변경하지 않음
  
%>
</body>
</html>