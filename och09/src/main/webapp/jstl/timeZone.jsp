<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
 <c:set var="date" value="<%=new Date() %>"></c:set>
<body>
	서울: <fmt:formatDate value="${date }" type="both"/><br>
	
	<fmt:timeZone value="Asia/Hong_kong">
		홍콩: <fmt:formatDate value="${date }" type="both"/><br>
	</fmt:timeZone>
	
	<fmt:timeZone value="Europe/London">
		런던: <fmt:formatDate value="${date }" type="both"/><br>
	</fmt:timeZone>
	
	<fmt:timeZone value="Europe/Madrid">
		스페인: <fmt:formatDate value="${date }" type="both"/><br>
	</fmt:timeZone>
	
	<fmt:timeZone value="America/New_York">
		홍콩: <fmt:formatDate value="${date }" type="both"/><br>
	</fmt:timeZone>
	
</body>
</html>