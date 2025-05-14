<%@page import="java.text.SimpleDateFormat"%>
<%@page import="guest.guestDto"%>
<%@page import="java.util.List"%>
<%@page import="guest.guestDao"%>
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
<style type="text/css">
.board{
	border: 1px solid gray;
	border-radius: 10px 10px;
	width: 500px;
	height: 120px;
	font-size: 15pt;
	background-color: #cee3ee;
	margin-left: 20px;
}
.board>h4{
	color: gray;
}
.idimg{
	width: 30px;
	height: 30px;
}
</style>
</head>
<%
guestDao dao=new guestDao();
int totalCount=dao.totalCount();

int perPage=3;  //한페이지에 보여줄 글의 갯수
int perBlock=5; //한블럭당 보여질 페이지의 갯수
int startNum; //db에서 가져올 글의 시작번호(mysql:0 오라클:1번)
int startPage; //각 블럭당 보여질 시작페이지
int endPage; //각 블럭당 보여질 끝페이지
int currentPage; //현재 페이지
int totalPage; //총 페이지

int no;  //각 페이지당 출력할 시작번호

//현재페이지 읽기,단 null일 경우는 1페이지로 준다
if(request.getParameter("currentPage")==null)
	currentPage=1;
else
	currentPage=Integer.parseInt(request.getParameter("currentPage"));


//총페이지수를 구한다
//총글의 갯수/한페이지당 보여질 갯수로 나눔(7/5=1)
//나머지가 1이라도 있으면 무조건 1페이지추가(1+1=2페이지가 필요)
totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

//각 블럭당 보여질 시작페이지
//perBlock=5일경우 현재페이지가 1~5 시작1,끝5
//만약 현재페이지가 13일경우는 시작11,끝15
startPage=(currentPage-1)/perBlock*perPage+1;
endPage=startPage+perBlock-1;

//총페이지가 23개일경우 마지막 블럭은 끝 25가 아니라 23이다
if(endPage>totalPage)
	endPage=totalPage;

//각 페이지에서 보여질 시작번호
//예: 1페이지-->0  2페이지-->5 3페이지-->10...
startNum=(currentPage-1)*perPage;

//각 페이지당 출력할 시작번호
//예를 들어 총글갯수가 23   1페이지: 23   2페이지:18    3페이지:13....
no=totalCount-(currentPage-1)*perPage;

//전체데이터
List<guestDto> list=dao.getAlldatas(startNum, perPage);

%>
<body>
<jsp:include page="guestForm.jsp"/>
<hr width="1000">
<b style="margin-left: 20px;">총 <%=totalCount %>개의 방명록 글이 있습니다</b>
<div style="margin-top: 15px;">
	<%
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
		for(int i=0;i<list.size();i++)
		{
			guestDto dto=list.get(i);
		%>
				<div class="board">
					<h4><%=dto.getMyid() %>
						<img src="../save/<%=dto.getPhoto()%>" class="idimg">
					</h4>
					<span><%=dto.getContent() %></span>
					<span style="color: gray; float: right; margin-top: 50px; font-size: 0.8em;"><%=sdf.format(dto.getWriteday()) %></span>
				</div><br>
	<%}
%>
<!-- 페이지 번호 출력 -->
	<div style="width: 800px;">
	<ul class="pagination justify-content-center">
		<%
			//이전
			if(startPage>1)
			{%>
					<li class="page-item">
						<a class="page-link" href="guestList.jsp?currentPage=<%=startPage-1%>"
						style="color: black;">
							이전
						</a>
					</li>
			<%}
		
				for(int pp=startPage;pp<=endPage;pp++)
				{
					if(pp==currentPage)
					{%>
						<li class="page-item active">
							<a class="page-link" href="guestList.jsp?currentPage=<%=pp%>"><%=pp %></a>
						</li>
					<%}else{%>
						<li class="page-item">
							<a class="page-link" href="guestList.jsp?currentPage=<%=pp%>"><%=pp %></a>
						</li>
					<%}
				}
				
				//다음
				if(endPage<totalPage)
				{%>
					<li class="page-item">
						<a class="page-link" href="guestList.jsp?currentPage=<%=endPage+1%>"
						style="color: black;">
							다음
						</a>
					</li>
				<%}
				
		%>
	</ul>
	</div>

</div>
</body>
</html>