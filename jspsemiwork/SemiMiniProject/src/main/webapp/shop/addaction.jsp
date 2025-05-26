<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="data.dao.ShopDao"%>
<%@page import="data.dto.ShopDto"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//업로드할 save폴더의 실제서버에서의 위치구하기
String realPath=getServletContext().getRealPath("/save");
System.out.println(realPath);

//업로드크기
int uploadSize=1024*1024*3;

try{
MultipartRequest multi=new MultipartRequest(request,realPath,uploadSize,"utf-8",
		  new DefaultFileRenamePolicy());

    //입력한 데이타 읽기
    String shopnum=multi.getParameter("shopnum");
    String category=multi.getParameter("category");
    String sangpum=multi.getParameter("sangpum");
    String photo=multi.getFilesystemName("sang_photo");
    int price=Integer.parseInt(multi.getParameter("price"));
    String ipgoday=multi.getParameter("ipgoday");
    
    //dto에 넣기
    ShopDto dto=new ShopDto();
    
    dto.setCategory(category);
    dto.setSangpum(sangpum);
    dto.setPhoto(photo==null?"no":photo);
    dto.setIpgoday(ipgoday);
    dto.setPrice(price);
    
    
    //dao
    ShopDao dao=new ShopDao();
    dao.insertShop(dto);
    
    //목록이동
    response.sendRedirect("../index.jsp?main=shop/shoplist.jsp");
  
}catch(Exception e){
	  
}
%>
</body>
</html>