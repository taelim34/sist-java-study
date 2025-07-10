<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<title>SpringBoot+Mybatis 프로젝트</title>
<style>
  body {
    font-family: 'Nanum Gothic', Arial, sans-serif;
    background-color: #f8f9fa;
    margin: 0;
    padding-top: 70px; /* 헤더 높이만큼 패딩 */
  }
  .header-navbar {
    background: #fff;
    border-bottom: 1px solid #dee2e6;
    box-shadow: 0 2px 4px rgba(0,0,0,0.05);
    height: 70px;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    z-index: 1030;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 0 2rem;
  }
  .header-navbar-inner {
    width: 100%;
    max-width: 1200px;
    display: flex;
    align-items: center;
    justify-content: space-between;
  }
  .header-logo {
    display: flex;
    align-items: center;
    font-size: 1.5rem;
    font-weight: 800;
    color: #343a40;
    text-decoration: none;
  }
  .header-logo img {
    height: 36px;
    margin-right: 10px;
  }
  .header-menu {
    display: flex;
    gap: 1.8rem;
  }
  .header-menu-link {
    font-size: 1rem;
    font-weight: 700;
    color: #495057;
    text-decoration: none;
    padding: 0.5rem 0;
    position: relative;
    transition: color 0.2s ease;
  }
  .header-menu-link::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    width: 0;
    height: 2px;
    background-color: #0d6efd;
    transition: width 0.3s ease;
  }
  .header-menu-link:hover, .header-menu-link.active {
    color: #0d6efd;
  }
  .header-menu-link:hover::after, .header-menu-link.active::after {
    width: 100%;
  }
  .header-user-area {
    display: flex;
    align-items: center;
    gap: 0.8rem;
  }
  .user-btn {
    font-size: 0.9rem;
    font-weight: 700;
    text-decoration: none;
    border-radius: 20px;
    padding: 0.5rem 1rem;
    border: 1px solid #dee2e6;
    transition: all 0.2s ease;
    display: flex;
    align-items: center;
    gap: 0.4rem;
  }
  .user-btn.login {
    background-color: #0d6efd;
    color: #fff;
    border-color: #0d6efd;
  }
  .user-btn.login:hover {
    background-color: #0b5ed7;
    border-color: #0a58ca;
  }
  .user-btn.signup {
    background-color: #fff;
    color: #495057;
  }
  .user-btn.signup:hover {
    background-color: #f8f9fa;
  }
  
  /* --- 로그인 후 드롭다운 스타일 --- */
  .user-profile-dropdown .dropdown-toggle {
    display: flex;
    align-items: center;
    gap: 0.6rem;
    cursor: pointer;
    text-decoration: none;
    color: #343a40;
  }
  .user-profile-dropdown .dropdown-toggle::after {
      display: none; /* 기본 화살표 숨김 */
  }
  .user-profile-dropdown img {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    border: 2px solid #f1f1f1;
    object-fit: cover;
  }
  .user-profile-dropdown .dropdown-menu {
    border-radius: 0.5rem;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    border: 1px solid #e9ecef;
    margin-top: 0.8rem !important;
  }
  .user-profile-dropdown .dropdown-item {
     font-size: 0.95rem;
     padding: 0.6rem 1.2rem;
  }
  .user-profile-dropdown .dropdown-item i {
      margin-right: 0.6rem;
      width: 16px;
  }
  /* --- 모달 디자인 개선 --- */
  .modal-header {
      border-bottom: 0;
  }
  .modal-footer {
      border-top: 0;
  }

</style>
</head>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<body>

<div class="header-navbar">
  <div class="header-navbar-inner">
    <a class="header-logo" href="${root }/">
      <img src="${root}/static/image/logoImg/logo.png" alt="로고" onerror="this.style.display='none'">
      <span>SpringBoot</span>
    </a>
    <nav class="header-menu">
      <a class="header-menu-link" href="${root }/">Home</a>
      <a class="header-menu-link" href="${root }/ipgo/list">상품목록</a>
      <a class="header-menu-link" href="${root }/member/list">회원목록</a>
      <a class="header-menu-link" href="${root }/board/list">회원게시판</a>
    </nav>
    <div class="header-user-area">
    
    <%-- ============== 로그아웃 상태 ============== --%>
    <c:if test="${sessionScope.myid == null }">
      <button type="button" id="loginform" class="user-btn login" data-bs-toggle="modal" data-bs-target="#loginModal">
	    <i class="bi bi-box-arrow-in-right"></i> 로그인
  	  </button>
      <a class="user-btn signup" id="signup" href="${root }/member/form">
        <i class="bi bi-person-plus"></i> 회원가입
      </a>
    </c:if>
    
    <%-- ============== 로그인 상태 (드롭다운 메뉴) ============== --%>
    <c:if test="${sessionScope.myid != null }">
      <div class="dropdown user-profile-dropdown">
        <a href="#" class="dropdown-toggle" data-bs-toggle="dropdown">
           <img alt="프로필" src="../membersave/${sessionScope.loginphoto }">
           <b>${sessionScope.loginname}</b>님
        </a>
        <ul class="dropdown-menu dropdown-menu-end">
          <li><a class="dropdown-item" href="${root}/member/mypage?num=${sessionScope.loginnum}"><i class="bi bi-person-circle"></i> 마이페이지</a></li>
          <li><hr class="dropdown-divider"></li>
          <li>
             <a href="#" id="logout" class="dropdown-item"><i class="bi bi-box-arrow-right"></i> 로그아웃</a>
          </li>
        </ul>
      </div>
    </c:if>
    
    </div>
  </div>
</div>


<div class="modal fade" id="loginModal" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <div class="modal-header">
        <h4 class="modal-title fw-bold">로그인</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <div class="modal-body px-4 py-4">
        
        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="loginid" placeholder="아이디 입력" required>
            <label for="loginid">아이디</label>
        </div>
        
        <div class="form-floating mb-4">
             <input type="password" class="form-control" id="loginpass" placeholder="비밀번호 입력" required>
             <label for="loginpass">비밀번호</label>
        </div>
        
        <button type="button" class="btn btn-primary w-100 py-2 fs-5" id="btnlogin">로그인</button>
      </div>
      
    </div>
  </div>
</div>

<script type="text/javascript">
	//로그인 버튼클릭시 로그인
	$("#btnlogin").click(function(){
		var id=$("#loginid").val();
		var pass=$("#loginpass").val();
		var root='${root}';
		
		$.ajax({
			type:"get",
			url:root+"/member/login",
			dataType:"json",	
			data:{"id":id,"pass":pass},
			success:function(res){
				if(res.result === 'success'){	
					location.reload();
				}else{
					alert("아이디 또는 비밀번호가 맞지 않습니다.");
				}
			}
		});
	});

    // 엔터키로 로그인
    $("#loginpass").keydown(function(e) {
        if(e.keyCode == 13) {
            $("#btnlogin").click();
        }
    });
	
	// 로그아웃
	$("#logout").click(function(e){
        e.preventDefault(); // a 태그의 기본 동작(페이지 이동) 방지
	    var root = '${root}';
	    
	    $.ajax({
	        type:"get",
	        url:root+"/member/logout",
	        success:function(){
	            location.reload();
	        }
	    });
	});

</script>

</body>
</html>