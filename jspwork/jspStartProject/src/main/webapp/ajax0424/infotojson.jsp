<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="oracle.db.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	DbConnect db=new DbConnect();
	Connection conn=db.getConnecton();
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	String sql="select * from info order by num";
	
	String s="[";
	
	try{
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		while(rs.next())
		{
			String num=rs.getString("num");
			String name=rs.getString("name");
			String hp=rs.getString("hp");
			int age=rs.getInt("age");
			String photo=rs.getString("photo");
			
			s+="{";
			s+="\"num\":"+num+",\"name\":\""+name+"\",\"hp\":\""+hp+"\",\"age\":"+age+",\"photo\":\""+photo+"\"";
			s+="},";
		}
		
		//마지막 컴마 제거
		s=s.substring(0,s.length()-1);
	}catch(SQLException e){
		
		
	}finally{
		db.dbClose(rs, pstmt, conn);
		
	}
	
	s+="]";
%>

<%=s %>
