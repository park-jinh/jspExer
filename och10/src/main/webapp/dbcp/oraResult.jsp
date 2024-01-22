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
	<h2>사원 정보</h2>
	사번 : ${emp.empno }<p>
	이름 : ${emp.ename }<p>
	급여 : <fmt:formatNumber value="${emp.sal }" groupingUsed="true"></fmt:formatNumber><p>
	입사일 : <fmt:formatDate value="${emp.hiredate }" pattern="yyyy/MM/dd"/><p>

</body>
</html>