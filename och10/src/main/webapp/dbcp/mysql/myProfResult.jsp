<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>professor 정보</h2>
	사번  : ${professor.profno }<p>
	이름  : ${professor.name }<p>
	급여  : <fmt:formatNumber value="${professor.sal }"    groupingUsed="true"/><p>
	입사일 : <fmt:formatDate value="${professor.hiredate }" pattern="yyyy/MM/dd"/>
</body>
</html>