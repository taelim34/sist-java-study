<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>
<c:set  var="today" value="<%=new Date() %>"></c:set>
<P>  The time on the server is <fmt:formatDate value="${today }" pattern="yyyy-MM-dd HH:mm"/> </P>
</body>
</html>
