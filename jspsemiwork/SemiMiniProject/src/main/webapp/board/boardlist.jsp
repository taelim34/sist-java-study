<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Hi+Melody&family=Nanum+Myeongjo&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>Insert title here</title>
</head>
<%
	BoardDao dao=new BoardDao();
	List<BoardDto> list=dao.getAllDatas();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	
%>
<body>
<div class="write">
	<button type="button" class="btn btn-outline-info"
	onclick="location.href='index.jsp?main=board/writeform.jsp'">새 글쓰기</button>
</div>

<div class="board">
	<table class="table table-hover">
		<caption align="top"><b><%=list.size() %>개의 게시글이 있습니다</b></caption>
		<thead>
		<tr>
			<th width="80">번호</th>
			<th width="380">제목</th>
			<th width="120">작성자</th>
			<th width="180">작성일</th>
			<th width="80">조회수</th>
		</tr>
		</thead>
		<%
			if(list.size()==0)
			{%>
				<tr>
					<td colspan="5" align="center">
						<b>등록된 게시글이 없습니다</b>
					</td>
				</tr>
			<%}else{
				
				for(int i=0;i<list.size();i++)
				{
					BoardDto dto=list.get(i);
				%>
					<tr>
						<td><%=list.size()-i %></td>
						<td>
						<!-- 답글인경우 공백_1레벨당 2칸 or 3칸 -->
						<%
							for(int j=1;j<=dto.getRelevel();j++)
							{%>
								&nbsp;&nbsp;&nbsp;
							<%}
						%>
						<!-- 답글이면 답글이미지 출력 -->
						<%
							if(dto.getRelevel()>0)
							{%>
								<img alt="" src="image/re.png"><b>[답글]</b>
							<%
							}
						//원글이 없는경우
						int regroup = dto.getRegroup();
   						int restep = dto.getRestep();
    					int relevel = dto.getRelevel();
						boolean parentDeleted=false;
						
						if(relevel>0)
						{
							BoardDto parent=dao.getParent(regroup, restep, relevel);
							if (parent == null) {
					            parentDeleted = true;
					        }
						}
						
						if (parentDeleted) {
							%>
							        <span style="color: red;">[원글이 삭제된 답글]</span>
							<%
							    }
						%>
							
						
						<a href="index.jsp?main=board/content.jsp?num=<%=dto.getNum()%>">
						<%=dto.getSubject() %></a>
						</td>
						<td><%=dto.getWriter() %></td>
						<td><%=sdf.format(dto.getWriteday()) %></td>
						<td><%=dto.getReadcount() %></td>
					</tr>
				<%}
			}
		%>
	</table>
</div>
</body>
</html>