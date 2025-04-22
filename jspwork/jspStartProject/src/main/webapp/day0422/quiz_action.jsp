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
div{font-family: Black Han Sans;
text-align: center;
width: 800px;
margin: 0 auto;
}
</style>
</head>
<body>
<%
  request.setCharacterEncoding("utf-8");
  String name=request.getParameter("s_name");
  String area=request.getParameter("cbarea");
  String ipsaday=request.getParameter("ipsaday");
  String gift=request.getParameter("gift");
  String food=request.getParameter("food");
  
  String [] lang =request.getParameterValues("lang");
  
  String color=request.getParameter("color");
    
%>

<div style="background-color: <%=color %>">
<h3>사원명: <%=name %></h3>
<h3>근무지역: <%=area==null?"국내":"해외" %></h3>
<h3>입사일: <%=ipsaday %></h3>
<input type="date" value="<%=ipsaday %>">
<h3>명절선물</h3>
<img src="<%=gift %>">
<h3>가장 좋았던 점심메뉴 사진</h3>
<img src="../image/Food/<%=food %>.jpg">
<h3>가능한 IT언어: <%
if(lang==null)
{%>
	<b style="color: red">희망 거주지 선택안함</b>	
<%}else
{
	for(int i=0;i<lang.length;i++)
	{%>
		<b>[<%=lang[i] %>]&nbsp;</b>
	<%}%>
	
	<b>총 <%=lang.length %>개의 언어를 할수있음</b>
	
<%}
%></h3>
</div>
</body>
</html>