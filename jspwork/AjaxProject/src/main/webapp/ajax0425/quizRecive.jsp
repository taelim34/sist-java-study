<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String selFoodImage=request.getParameter("selFoodImage");
	String chuScore1=request.getParameter("chuScore1");
	String chuScore2=request.getParameter("chuScore2");
	String chuScore3=request.getParameter("chuScore3");
	
	JSONObject ob=new JSONObject();
	
	ob.put("selFoodImage", selFoodImage);
	ob.put("chuScore1", chuScore1);
	ob.put("chuScore2", chuScore2);
	ob.put("chuScore3", chuScore3);

%>

<%=ob.toString()%>