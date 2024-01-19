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
	<c:set var="date1" value="<%=new Date() %>"></c:set>
<body>
	오늘 날짜 : <fmt:formatDate value="${date1 }"/><p>
	현재 시간 : <fmt:formatDate value="${date1 }" type="time"/>
</body>
</html>