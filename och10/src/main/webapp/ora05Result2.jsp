<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	tr:hover {
		background-color: red;
	}
</style>
</head>
<body>
	<h2>EL표기법 + JSTL Model 2 View</h2>
	<table width="100%" bgcolor="yellow" border="1">
		<tr bgcolor="pink">
			<th>사번</th><th>이름</th><th>업무</th><th>급여</th>
		</tr>
		<c:forEach var="emp" items="${al }">
			<tr><td>${emp.empno }</td><td>${emp.ename }</td>
			<td>${emp.job }</td><td>${emp.sal }</td></tr>
		</c:forEach>
	</table>
</body>
</html>