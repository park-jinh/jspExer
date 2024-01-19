<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- num2에서 호출  -->
	<h2>인사말 Switch유사</h2>
	<c:choose>
		<c:when test="${param.num1==0 }">안녕하세요</c:when>
		<c:when test="${param.num1==1 }">HI HI</c:when>
		<c:when test="${param.num1==2 }">아리가또</c:when>
		<c:otherwise>헐! 누구</c:otherwise>
	</c:choose>
</body>
</html>