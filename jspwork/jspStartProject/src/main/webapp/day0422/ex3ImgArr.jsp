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
		String [] imgArr1={"1","3","4","6","7","12","10","3","5"};
	int n=0;
	
	%>
<table>
	<%
		for(int i=0;i<3;i++)
		{%>
			<tr height="70">
				<%
				  for(int j=0;j<3;j++)
				  {%>
						<td>
						<img src="../image/연예인사진/<%=imgArr1[n]%>.jpg" style="width: 140px;">
						</td>
				  <%
				  n++;
				  }
				
				%>			
			</tr>
		<%}
	%>
</table>

<hr>
<h2>쇼핑몰사진을 4행 5열로 출력해주세요..배열 선언없이 이미지 20개 출력
너비높이 120*160출력</h2>

<table>
  <%
  
  	int s=1;
    for(int i=0;i<4;i++)
    {%>
    	<tr>
    	  <%
    	  	for(int j=0;j<5;j++)
    	  	{%>
    	  		<td>
    	  		  <img src="../image/쇼핑몰사진/<%=s++ %>.jpg" 
    	  		  style="width: 120px; height: 160px">
    	  		</td>
    	  	<%}
    	  %>
    	</tr>
    	
    <%}
  %>
</table>

<h2>만화이미지 20개를 출력해주세요 01~20 5행4열로 출력해주세요</h2>
<table>
<%
	int img=1;
	for(int i=0;i<5;i++)
	{%>
		<tr>
			<%
				for(int j=0;j<4;j++)
				{%>
					<td>
						<img src="../image/만화이미지/<%= img<10?("0"+img++):img++%>.png" 
						style="width: 120px; height: 160px">
					</td>
				<%}
			%>
		</tr>
	<%}
%>
</table>
</body>
</html>