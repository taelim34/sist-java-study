<%@page import="uploadboard.UBoardAnswerDto"%>
<%@page import="uploadboard.UBoardAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
UBoardAnswerDao dao=new UBoardAnswerDao();
UBoardAnswerDto dto=new UBoardAnswerDto();

String idx=request.getParameter("idx");
String nickname=request.getParameter("nickname");
String content=request.getParameter("content");

dto.setIdx(idx);
dto.setNickname(nickname);
dto.setContent(content);

dao.updateAnswer(dto);
%>