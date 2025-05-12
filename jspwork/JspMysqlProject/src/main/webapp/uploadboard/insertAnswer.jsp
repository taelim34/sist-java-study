<%@page import="uploadboard.UBoardAnswerDao"%>
<%@page import="uploadboard.UBoardAnswerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="uploadboard.UBoardAnswerDao"/>
<jsp:useBean id="dto" class="uploadboard.UBoardAnswerDto"/>
<jsp:setProperty property="*" name="dto"/>
<%
request.setCharacterEncoding("UTF-8");

dao.insertAnswer(dto);
%>