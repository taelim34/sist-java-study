<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="uploadboard.UploadDao"%>
<%@page import="uploadboard.UploadDto"%>
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
	a{
		text-decoration: none;
		color: black;
	}
</style>
</head>
<%
	//db선언
	UploadDao dao=new UploadDao();
	
	//List가져오기
	//List<UploadDto> list=dao.getAllData();
	
	
	//페이징 처리
	//전체갯수
	int totalCount=dao.getTotalCount();
	
	int perPage=5;  //한페이지에 보여줄 글의 갯수
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
	List<UploadDto> list=dao.getPagingList(startNum, perPage);
	
	
%>
<body>
<div style="margin: 100px 100px; width: 800px;">
	<b><%=totalCount %>개의 글이 있습니다</b>
	<table class="table table-bordered">
		<caption align="top"><b>게시판형 목록보기</b>
			<button type="button" class="btn btn-warning"
			onclick="location.href='addForm.jsp'" style="margin-left: 650px;">글쓰기</button>
			<button type="button" class="btn btn-success" onclick="location.href='imageList.jsp'">앨범형 게시판</button>
		</caption>
		
		<tr class="table-success">
			<th width="100">번호</th>
			<th width="350">제목</th>
			<th width="130">작성자</th>
			<th width="180">작성일</th>
			<th width="100">조회수</th>
		</tr>
		<%
		//날짜형식
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		for(int i=0;i<list.size();i++)
		{
			UploadDto dto=list.get(i); //i번째 dto얻기
			%>
			
			<tr>
				<td><%=no-i %></td>
				<!-- 제목클릭시 content 보기로 간다 -->
				<td>
					<a href="detailView.jsp?num=<%=dto.getNum() %>&currentPage=<%=currentPage%>">
						<%=dto.getSubject() %>
					</a>
				</td>
				<td><%=dto.getWriter() %></td>
				<td><%=sdf.format(dto.getWriteday()) %></td>
				<td><%=dto.getReadcount() %></td>
			</tr>
			<%
		}
		
		%>
	</table>
	
	<!-- 페이지 번호 출력 -->
	<div style="width: 800px;">
	<ul class="pagination justify-content-center">
		<%
			//이전
			if(startPage>1)
			{%>
					<li class="page-item">
						<a class="page-link" href="boardList.jsp?currentPage=<%=startPage-1%>"
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
							<a class="page-link" href="boardList.jsp?currentPage=<%=pp%>"><%=pp %></a>
						</li>
					<%}else{%>
						<li class="page-item">
							<a class="page-link" href="boardList.jsp?currentPage=<%=pp%>"><%=pp %></a>
						</li>
					<%}
				}
				
				//다음
				if(endPage<totalPage)
				{%>
					<li class="page-item">
						<a class="page-link" href="boardList.jsp?currentPage=<%=endPage+1%>"
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