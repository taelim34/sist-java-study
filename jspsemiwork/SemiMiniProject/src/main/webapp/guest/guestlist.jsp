<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.GuestAnswerDto"%>
<%@page import="data.dao.GuestAnswerDao"%>
<%@page import="data.dto.GuestDto"%>
<%@page import="data.dao.GuestDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
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
<script type="text/javascript">
	$(function(){
		
		$("div.answer").hide();
		//댓글클릭시 댓글부분이 보였다/안보였다하기
		$("span.answer").click(function(){
			$(this).parent().find("div.answer").slideToggle();
		});
		
		// 댓글 삭제 이벤트
	    $(document).on("click", ".adel", function(){
	    	
	    	var idx = $(this).attr("data-idx");

	        $.ajax({
	            type: "post",
	            url: "guest/answerdelete.jsp",
	            dataType: "text",
	            data: { idx: idx },
	            success: function(res) {
	                // 성공 후 해당 댓글 요소를 제거하거나 새로고침
	                alert("댓글이 삭제되었습니다.");
	                location.reload(); // 또는 댓글만 다시 불러오기
	            }
	        });
	    });
	        
	});
</script>
</head>
<%
  GuestDao dao=new GuestDao();
  //int tcount=dao.getTotalCount();
  
//페이징처리
  //전체갯수
  int totalCount=dao.getTotalCount();
  int perPage=3; //한페이지에 보여질 글의 갯수
  int perBlock=5; //한블럭당 보여질 페이지의 갯수
  int startNum; //db에서 가져올 글의 시작번호(mysql:0 오라클:1번)
  int startPage; //각블럭당 보여질 시작페이지
  int endPage;//각블럭당 보여질 끝페이지
  int currentPage; //현재페이지
  int totalPage; //총페이지
  
  int no; //각페이지당 출력할 시작번호
  
  //현재페이지 읽기,단 null일경우는 1페이지로 준다
  if(request.getParameter("currentPage")==null)
	  currentPage=1;
  else
	  currentPage=Integer.parseInt(request.getParameter("currentPage"));
  
  
  //총페이지수를 구한다
  //총글의 갯수/한페이지당 보여질개수로 나눔(7/5=1)
  //나머지가 1이라도 있으면 무저건 1페이지추가(1+1=2페이지가 필요)
  totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
  
  //각블럭당 보여질 시작페이지
  //perBlock=5일경우 현재페이지가 1~5 시작1,끝5
  //만약 현재페이지가 13일경우는 시작11,끝15
  startPage=(currentPage-1)/perBlock*perBlock+1;
  endPage=startPage+perBlock-1;
  
  //총페이지가 23개일경우 마지막 블럭은 끝 25가 아니라 23이다
  if(endPage>totalPage)
	  endPage=totalPage;
  
  //각페이지에서 보여질 시작번호
  //예: 1페이지-->0  2페이지-->5 3페이지-->10...
  startNum=(currentPage-1)*perPage;
  
  //각페이지당 출력할 시작번호
  //예를들어 총글갯수가 23   1페이지: 23  2페이지:18  3페이지: 13.....
  no=totalCount-(currentPage-1)*perPage;
  
  //전체데이타
  List<GuestDto> list=dao.getList(startNum, perPage);
  
  //세션 loginok
  String loginok=(String)session.getAttribute("loginok");
  String sessionid=(String)session.getAttribute("myid");
  
%>
<body>
<jsp:include page="guestform.jsp"/>
<hr width="1000">
<div style="width: 500px; margin: 50px 100px;">
<h6 class="alert alert-warning"><%=totalCount %>개의 방명록 글이 있습니다</h6>
<br><br>

<%

  //HoewonDao hdao=new HoewonDao();
  for(GuestDto dto:list){
	  
	  //아이디에 해당하는 이름 얻기
	  //String name=hdao.getHoewonName(dto.getMyid());
	  SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	  %>
	  <table  class="table table-bordered" style="width: 500px;">
	    <tr height="150">
	      <td>
	       <%--  <b><%=name %>(<%=dto.getMyid() %>)</b> --%>
	        <span style="color: gray; font-size: 0.8em; float: right;"><%=sdf.format(dto.getWriteday()) %></span>
	        <div>
	           <%
	           //이미지출력
	             if(!dto.getPhoto().equals("no"))
	             {%>
	            	 <img alt="" src="./save/<%=dto.getPhoto()%>"
	            	 style="width: 100px;">
	             <%}
	           %>
	           <br>
	           <%=dto.getContent().replace("\n", "<br>") %>
	        </div>
	        
	      </td>
	    </tr>
	    
	    
	    <tr>
	      <td>
	        <!-- 본인이 쓴글에만 수정삭제버튼 보이게... -->
	        <%
	          
	          //로그인중이면서 로그인한 아이디와 글쓴아이디가 같을경우에만 보이게
	          if(loginok!=null && sessionid.equals(dto.getMyid()))
	          {%>
	          <div style="float: right; font-size: 1.2em; color: green;">
	        	 <i class="bi bi-trash" 
	        	 onclick="location.href='./index.jsp?main=/guest/delete.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>'"></i>
	        	  <i class="bi bi-pencil-square"></i>
	          </div>
	          <%}
	        %>
	      </td>
	    </tr>
	    
	     <!-- 댓글 -->
	    <tr>
	    	<td>
	    		<span class="answer" style="cursor: pointer;">댓글</span>
	    		<div class="answer">
	    			<%
	    				if(loginok!=null){%>
	    				
	    					<div class="answerform">
	    						<form action="guest/answerinsert.jsp" method="post">
	    							<input type="hidden" name="num" value="<%=dto.getNum()%>">
	    							<input type="hidden" name="myid" value="<%=sessionid%>">
	    							<table>
	    								<tr>
	    									<td>
	    										<textarea style="width: 470px; height: 60px;"
	    										name="content" required="required"
	    										class="form-control"></textarea>
	    									</td>
	    									<td>
	    										<button type="submit" class="btn btn-info"
	    										style="width: 70px; height: 70px;">등록</button>
	    									</td>	    									
	    								</tr>
	    							</table>
	    						</form>
	    					</div>	
	    				<%}
	    			%>
	    			<div class="answerlist">
	    				<%
	    					//댓글
	    				  	GuestAnswerDao daoA=new GuestAnswerDao();
	    					MemberDao daoM=new MemberDao();	
	    				
	    				  	List<GuestAnswerDto> listA=daoA.getAllGuestAnswer(dto.getNum());
							for(GuestAnswerDto dtoA:listA){
							//글작성자와 댓글쓴 작성자가 같을경우
							if(dto.getMyid().equals(dtoA.getMyid())){%>
									
								<span style="color: red;">작성자</span>	
							<%}
							String nameA=daoM.getName(dtoA.getMyid());
							%>
								
								<b><%=dtoA.getMyid()%> 이름:<%=nameA %></b>
								<%
									//댓글삭제는 본인댓글에만 보이게
									if(loginok!=null && dtoA.getMyid().equals(sessionid))
									{%>
										<i class="bi bi-trash3 adel" style="font-size: 14pt; float: right;
										margin-right: 10px; cursor: pointer;" data-idx="<%=dtoA.getIdx()%>"
										id="Adel"></i>
									<%}
								%>
								<br>
								<span>내용:<%=dtoA.getContent().replaceAll("\n", "<br>") %></span><br>
								<span style="font-size: 10pt; color: gray; float: right;"><%=dtoA.getWriteday() %></span>
								<br> 
								<hr>
							<%
							}
	    					
	    				%>
	    			</div>
	    		
	    		</div>
	    	</td>
	    </tr>
	    
	    
	  </table>
  <%}
%>

<!--페이지 번호 출력  -->
     <div style="width: 500px;">
     <ul class="pagination justify-content-center">
       <%
          //이전
          if(startPage>1)
          {%>
        	  <li class="page-item">
        	    <a class="page-link" href="./index.jsp?main=guest/guestlist.jsp?currentPage=<%=startPage-1%>"
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
       				  <a class="page-link" href="./index.jsp?main=guest/guestlist.jsp?currentPage=<%=pp%>"><%=pp %></a>
       				</li>
       			<%}else{%>
       				<li class="page-item">
       				  <a class="page-link" href="./index.jsp?main=guest/guestlist.jsp?currentPage=<%=pp%>"><%=pp %></a>
       				</li>
       			<%}
       		}
       		
       		//다음
       		if(endPage<totalPage)
       		{%>
       			<li class="page-item">
        	    <a class="page-link" href="./index.jsp?main=guest/guestlist.jsp?currentPage=<%=endPage+1%>"
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