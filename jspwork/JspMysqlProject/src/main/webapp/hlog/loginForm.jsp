<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<%
	String id=(String)session.getAttribute("mid");
	String saveid=(String)session.getAttribute("saveid");
	
	boolean b;
	
	if(saveid == null || saveid.equals("no"))
		b=false;
	else
		b=true;
%>
<body>

<div class="container mt-3">
  <h2>Stacked form</h2>
  <form action="loginProc.jsp" method="post">
    <div class="mb-3 mt-3">
      <label for="mid">아이디:</label>
      <input type="text" class="form-control" id="mid" placeholder="아이디를 입력하세요" name="mid"
      value="<%=b?id:""%>">
    </div>
    <div class="mb-3">
      <label for="pwd">비밀번호:</label>
      <input type="password" class="form-control" id="pass" placeholder="비밀번호를 입력하세요" name="pass">
    </div>
    <div class="form-check mb-3">
      <label class="form-check-label">
        <input class="form-check-input" type="checkbox" name="remember"
        <%=b?"checked":"" %>> Remember me
      </label>
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
  </form>
</div>

</body>
</html>