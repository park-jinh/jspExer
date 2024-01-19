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
	<c:set var="code" value="1112" scope="request"></c:set>
	<c:set var="name" value="온도계" scope="request"></c:set>
	<c:set var="price" value="16,000원" scope="request"></c:set>
	<jsp:forward page="set2Result.jsp"></jsp:forward>
</body>
</html>