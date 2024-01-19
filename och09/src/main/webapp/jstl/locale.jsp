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
	<h2>우리나라</h2>
	<fmt:setLocale value="ko_kr"/>
	금액 : <fmt:formatNumber value="1000000" type="currency"/><br>
	일시 : <fmt:formatDate value="${date }" type="both" dateStyle="full" timeStyle="full"/><br>
	
	<h2>미국</h2>
	<fmt:setLocale value="en_us"/>
	금액 : <fmt:formatNumber value="1000000" type="currency"/><br>
	일시 : <fmt:formatDate value="${date }" type="both" dateStyle="full" timeStyle="full"/><br>
	
	<h2>우리나라</h2>
	<fmt:setLocale value="ja_jp"/>
	금액 : <fmt:formatNumber value="1000000" type="currency"/><br>
	일시 : <fmt:formatDate value="${date }" type="both" dateStyle="full" timeStyle="full"/><br>
	
</body>
</html>