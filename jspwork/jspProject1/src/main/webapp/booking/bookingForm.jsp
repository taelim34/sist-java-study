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
<style type="text/css">
  body *{
  	font-family: 'Black Han Sans';
  }
  div {
	position: absolute;
	top: 150px;
	left: 600px;
  }
</style>
<script type="text/javascript">
  function check(){
	  var len=$("input[name='food']:checked").length;
	  if(len<2){
		  alert("주문메뉴는 최소 2개이상 선택해주세요")
		  return false;
	  }
  }
</script>
</head>
<body>
  <div style="margin: 100px 100px; width: 800px;">
  
  <!-- onsubmit이벤트는 action이 호출되기 전에 발생
  리턴값을 false로 받으면 action이 호출되지 않는다 -->
	<form action="addAction.jsp" method="post" onsubmit="return check()">
	  <table class="table table-bordered">
	    <tr>
	      <th width="100" style="background-color: beige;">예약자명</th>
	      <td>
	        <input type="text" name="name" class="form-control"
	        autofocus="autofocus" required="required" style="width: 200px;"
	        placeholder="예약자명 입력">
	      </td>
	    </tr>
	    
	    <tr>
	      <th width="100" style="background-color: beige;">성별</th>
	      <td>
	        <label>
	          <input type="radio" name="gender" value="m">
	          <img alt="" src="../image/bookingimg/man.jpg" width="50">
	        </label>
	        &nbsp;
	        <label>
	          <input type="radio" name="gender" value="g">
	          <img alt="" src="../image/bookingimg/girl.jpg" width="50">
	        </label>
	        &nbsp;
	      </td>
	    </tr>
	    
	    <tr>
	      <th width="100" style="background-color: beige;">예약시간</th>
	      <td>
	        <input type="datetime-local" name="local" class="form-control"
	        style="width: 200px;" required="required">
	      </td>
	    </tr>
	    
	    <tr>
	      <th width="100" style="background-color: beige;">인원수</th>
	      <td>
	        <input type="number" name="inwon" min='2' max='6'
	        class="form-control" style="width: 80px;">
	        
	      </td>
	    </tr>
	    
	    <tr>
	      <th width="100" style="background-color: beige;">메뉴선택</th>
	      <td>
	        <label>
	          <input type="checkbox" name="food" value="갈비찜.jpg,23000">갈비찜<br>
	          <img alt="" src="../image/bookingimg/갈비찜.jpg" width="80" height="80">
	        </label>
	        <label>
	          <input type="checkbox" name="food" value="에그샌드위치.jpg,8000">에그샌드위치<br>
	          <img alt="" src="../image/bookingimg/에그샌드위치.jpg" width="80" height="80">
	        </label>
	        <label>
	          <input type="checkbox" name="food" value="에그덮밥.jpg,12000">에그덮밥<br>
	          <img alt="" src="../image/bookingimg/갈비찜.jpg" width="80" height="80">
	        </label>
	        <label>
	          <input type="checkbox" name="food" value="망고샤벳.jpg,26000">망고샤벳<br>
	          <img alt="" src="../image/bookingimg/망고샤벳.jpg" width="80" height="80">
	        </label>
	        <label>
	          <input type="checkbox" name="food" value="스팸에그덮밥.jpg,15000">스팸에그덮밥<br>
	          <img alt="" src="../image/bookingimg/스팸에그덮밥.jpg" width="80" height="80">
	        </label>
	      </td>
	    </tr>
	    
	    <tr>
	      <th width="100" style="background-color: beige;">메세지</th>
	      <td>
	        <textarea style="width: 500px; height: 80px;"
	        class="form-control" required="required" name="message">요청사항 없습니다</textarea>
	      </td>
	    </tr>
	    
	    <tr>
	      <td colspan="2" align="center">
	        <button type="submit" class="btn btn-outline-danger"
	        style="width: 120px;">예약하기</button>
	        <button type="button" class="btn btn-outline-danger"
	        style="width: 120px;" onclick="location.href='bookingForm.jsp'">다시하기</button>
	        <button type="button"class="btn btn-outline-danger"
	        style="width: 120px;" onclick="location.href='bookingList.jsp'">예약목록</button>
	      </td>
	    </tr>
	  </table>
	</form>
  </div>
</body>
</html>