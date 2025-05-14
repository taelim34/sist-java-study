<%@page import="hoewon.hoewonDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Black+Han+Sans&family=East+Sea+Dokdo&family=Gowun+Batang&family=Nanum+Myeongjo&family=Stylish&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//mid,pass,remember
	String id=request.getParameter("mid");
	String pass=request.getParameter("pass");
	String saveid=request.getParameter("remember"); //체크안하면 null
	
	//dao의 로그인 호출
	//1일경우 세션저장후 메인으로 가기
	//2일경우 '비밀번호가 맞지 않습니다' 이전페이지로
	//3일경우 '가입되지 않은 아이디입니다' 이전페이지로
	hoewonDao dao=new hoewonDao();
	int idx=dao.getLogin(id, pass);
	
	if(idx==1){
		//ssesion에 저장
		session.setAttribute("loginok", "yes");
		session.setAttribute("mid", id);
		session.setAttribute("saveid", saveid==null?"no":"yes");
		
		session.setMaxInactiveInterval(60*60*8); //8시간 유지
		
		response.sendRedirect("../hlog/loginMain.jsp");
	}else if(idx==2){%>
		<script type="text/javascript">
			alert("비밀번호가 맞지 않습니다");
			history.back();
		</script>
	<%}else if(idx==3){%>
		<script type="text/javascript">
			alert("가입되지않은 회원입니다");
			history.back();
		</script>	
	<%}
	
%>
</body>
</html>