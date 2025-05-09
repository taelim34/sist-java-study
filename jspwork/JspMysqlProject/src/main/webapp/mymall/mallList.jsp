<%@page import="mymall.MymallDto"%>
<%@page import="mymall.MymallDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.List"%>
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
<%
  MymallDao dao=new MymallDao();
  List<MymallDto> list=dao.getAllSangPums();
  NumberFormat nf=NumberFormat.getCurrencyInstance();
  SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<body>

<div style="margin: 100px 100px; width: 800px;">
	<h3 class="alert alert-info">MyMall 전체목록</h3>
	<br>
	<button type="button" class="btn btn-warning"
	onclick="location.href='addForm.jsp'">상품추가</button>
		<table class="table table-bordered">
			<tr>
				<th width="80">번호</th>
				<th width="180">상품명</th>
				<th width="80">색상</th>
				<th width="180">가격</th>
				<th width="180">등록일</th>
				<th width="200">상세보기</th>
			</tr>
			
			<%
				if(list.size()==0){
					%>
						<tr>
							<td colspan="5" align="center">
								<b>등록된 상품이 없습니다</b>
							</td>
						</tr>
				<%}else{
					for(int i=0;i<list.size();i++)
					{
						MymallDto dto=list.get(i);
					%>
						<tr>
							<td><%=i+1 %></td>
							<td><%=dto.getSangpum() %></td>
							<td style="background-color: <%=dto.getColor() %>"></td>
							<td><%=nf.format(dto.getPrice()) %></td>
							<td><%=sdf.format(dto.getWriteday()) %></td>
							<td width="200px;"><button type="button" class="btn btn-warning"
							onclick="location.href='detailPage.jsp?num=<%=dto.getNum() %>'">상세보기</button></td>
						</tr>
					<%}
					
				}
			%>
		</table>
</div>
</body>
</html>