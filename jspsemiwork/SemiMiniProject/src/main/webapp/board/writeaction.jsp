<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- uesBean으로 dao,dto선언후 모든데이터 읽기 -->
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dao" class="data.dao.BoardDao"/>
<jsp:useBean id="dto" class="data.dto.BoardDto"/>
<jsp:setProperty property="*" name="dto"/>
<%
	//insert
	dao.insertReboard(dto);
	//insert된 num값
	int num=dao.getMaxNum();
	//content로 바로이동
	response.sendRedirect("../index.jsp?main=board/content.jsp?num="+num);
%>