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
<form action="quiz_action.jsp">
	<h1>사원정보</h1>
	<table class="table table-striped">
		<tr>
			<th>사원명</th>
			<td>
				<input type="text" name="s_name" required="required">
			</td>
		</tr>
		
		<tr>
			<th>근무지역</th>
			<td>
				<input type="checkbox" name="cbarea">해외
			</td>
		</tr>
		
		<tr>
			<th>입사일자</th>
			<td>
				<input type="date" name="ipsaday" required="required" value="2010-01-01">
			</td>
		</tr>
		
		<tr>
			<th>명절선물 선택(택1)</th>
			<td>
				<select name="gift">
					<option value="../image/logoImg/acc01.png">시계</option>
					<option value="../image/logoImg/acc02.png">스카프</option>
					<option value="../image/logoImg/acc03.png">향수</option>
					<option value="../image/logoImg/acc04.png">가방</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<th>가장 좋았던 점심메뉴(택1)</th>
			<td>
				<input type="radio" name="food" value="1">샌드위치&nbsp;
				<input type="radio" name="food" value="2">꼬치구이&nbsp;
				<input type="radio" name="food" value="3">순두부찌개&nbsp;
				<input type="radio" name="food" value="6">에그덮밥&nbsp;
				<input type="radio" name="food" value="10">햄에그&nbsp;
			</td>
		</tr>
		
		<tr>
			<th>사원의 가능IT언어(다중선택가능)</th>
			<td>
				<input type="checkbox" name="lang" value="C언어">C언어&nbsp;
				<input type="checkbox" name="lang" value="JAVA">JAVA&nbsp;
				<input type="checkbox" name="lang" value="VUE">VUE&nbsp;
				<input type="checkbox" name="lang" value="ORACLE">ORACLE&nbsp;
				<input type="checkbox" name="lang" value="NodeJs">NodeJs&nbsp;
			</td>
		</tr>
		
		<tr>
			<th>배경색 선택</th>
			<td>
				<input type="color" name="color" value="#ffcccc">
			</td>
		</tr>
		
		<tr>
			<td colspan="7" align="center">
				<input type="submit" value="사원선택결과">
			</td>
		</tr>
	</table>
</form>
</body>
</html>