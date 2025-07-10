<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<title>입고 리스트</title>
<style>
  body {
    font-family: 'Nanum Gothic', Arial, sans-serif;
    background: #f8f9fa;
    margin: 0;
    padding: 0;
  }
  .ipgo-container {
    max-width: 900px;
    margin: 48px auto 0 auto;
    background: #fff;
    border-radius: 18px;
    box-shadow: 0 4px 24px rgba(0,0,0,0.07);
    padding: 40px 36px 32px 36px;
    min-height: 500px;
  }
  .ipgo-title {
    font-size: 1.6rem;
    font-weight: 900;
    color: #222;
    margin-bottom: 18px;
    letter-spacing: 1px;
  }
  .ipgo-alert {
    background: #f3f6fa;
    color: #0070f3;
    border: 1.5px solid #e5e7eb;
    border-radius: 12px;
    font-weight: 700;
    font-size: 1.08rem;
    margin-bottom: 28px;
    padding: 16px 24px;
    text-align: center;
  }
  .ipgo-list-table {
    width: 100%;
    background: #fff;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 2px 8px rgba(0,0,0,0.03);
    margin-bottom: 0;
  }
  .ipgo-list-table tr {
    border-bottom: 1.5px solid #f0f0f0;
  }
  .ipgo-list-table td {
    padding: 16px 12px;
    font-size: 1.08rem;
    vertical-align: middle;
    background: #fff;
    color: #222;
  }
  .ipgo-list-table td:first-child {
    text-align: center;
    background: #f8fafd;
    border-right: 1.5px solid #f0f0f0;
    width: 170px;
  }
  .ipgo-list-table img {
    border-radius: 10px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.06);
    background: #f3f6fa;
  }
  .ipgo-btn {
    font-size: 1.02rem;
    font-weight: 600;
    color: #222;
    background: #f3f6fa;
    border: 1px solid #e5e7eb;
    border-radius: 18px;
    padding: 6px 18px;
    text-decoration: none;
    transition: background 0.18s, color 0.18s, border 0.18s;
    margin-right: 8px;
    margin-bottom: 4px;
    display: inline-flex;
    align-items: center;
    gap: 6px;
  }
  .ipgo-btn:last-child { margin-right: 0; }
  .ipgo-btn:hover {
    background: #0070f3;
    color: #fff;
    border: 1px solid #0070f3;
  }
  .ipgo-add-btn {
    background: #0070f3;
    color: #fff;
    border: 1px solid #0070f3;
    font-weight: 700;
    margin-bottom: 18px;
    margin-left: 4px;
  }
  .ipgo-add-btn:hover {
    background: #0056b3;
    border: 1px solid #0056b3;
    color: #fff;
  }
  @media (max-width: 991.98px) {
    .ipgo-container {
      padding: 18px 4vw 18px 4vw;
    }
    .ipgo-list-table td {
      font-size: 0.98rem;
      padding: 10px 4px;
    }
    .ipgo-title {
      font-size: 1.2rem;
    }
  }
</style>
</head>
<body>
<div>
	<jsp:include page="../../layout/header.jsp"></jsp:include>
</div>

<div class="ipgo-container">
  <div class="ipgo-title">입고 상품 리스트</div>
  <div class="ipgo-alert">
    <b>총 ${totalcount }개의 상품이 입고중입니다</b>
  </div>
  <button type="button" class="ipgo-btn ipgo-add-btn" onclick="location.href='ipgoform'">
    <i class="bi bi-plus-circle"></i> 상품추가
  </button>
  <table class="ipgo-list-table">
    <c:forEach var="dto" items="${list }">
      <tr>
        <td rowspan="4">
          <c:if test="${dto.photoname!='no' }">
            <c:forTokens var="pn" items="${dto.photoname }" delims="," begin="0" end="0">
              <a><img src="../save/${pn }" style="width: 150px; height: 150px;"></a>
            </c:forTokens>
          </c:if>
          <c:if test="${dto.photoname=='no' }">
            <a><img src="../image/logoImg/no.png" style="width: 150px; height: 150px;"></a>
          </c:if>
        </td>
        <td>상품명:  ${dto.sangpum }</td>
      </tr>
      <tr>
        <td>가격: ${dto.price }</td>
      </tr>
      <tr>
        <td>입고일: ${dto.ipgoday }</td>
      </tr>
      <tr>
        <td>
          <button type="button" class="ipgo-btn" onclick="location.href='updateform?num=${dto.num}'">
            <i class="bi bi-pencil-square"></i> 수정
          </button>
          <button type="button" class="ipgo-btn" onclick="location.href='delete?num=${dto.num}'">
            <i class="bi bi-trash"></i> 삭제
          </button>
        </td>
      </tr>
    </c:forEach>
  </table>
</div>
</body>
</html>