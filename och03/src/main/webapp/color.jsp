<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	// Parameter 받기
	String color = request.getParameter("color");
%>
<body bgcolor=<%= color%>>
	<h1>익스프레션 이용한 색깔변경 </h1>
</body>
</html>