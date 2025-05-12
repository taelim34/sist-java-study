<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="uploadboard.UBoardAnswerDto"%>
<%@page import="java.util.List"%>
<%@page import="uploadboard.UBoardAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
UBoardAnswerDao dao=new UBoardAnswerDao();

JSONArray arr=new JSONArray();
String num=request.getParameter("num");
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");

List<UBoardAnswerDto> list=dao.getAnswerList(num);

for(UBoardAnswerDto dto:list)
{
	JSONObject ob=new JSONObject();
	
	ob.put("num", dto.getNum());
	ob.put("idx", dto.getIdx());
	ob.put("nickname", dto.getNickname());
	ob.put("content", dto.getContent());
	ob.put("writeday", sdf.format(dto.getWriteday()));
	
	//arr에 추가
	arr.add(ob);
}
%>
<%=arr.toString() %>

