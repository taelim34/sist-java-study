<%@page import="org.json.simple.JSONObject"%>
<%@page import="uploadboard.UBoardAnswerDto"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="uploadboard.UBoardAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String idx=request.getParameter("idx");

UBoardAnswerDao dao=new UBoardAnswerDao();
UBoardAnswerDto dto=dao.getAnswerData(idx);
 

JSONObject ob=new JSONObject();
	
ob.put("idx", dto.getIdx());
ob.put("nickname", dto.getNickname());
ob.put("content", dto.getContent());
	
%>
<%=ob.toString() %>