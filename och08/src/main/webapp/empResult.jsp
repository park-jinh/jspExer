<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Bean 선언  -->
	<jsp:useBean id="emp" class="och08.Emp" scope="request" />
	
	<!-- Bean 값 가져오기  -->
	<h2>직원정보</h2>
	사번 : <jsp:getProperty property="empno" name="emp"/><p>
	이름 : <jsp:getProperty property="ename" name="emp"/><p>
	업무 : <jsp:getProperty property="job" name="emp"/><p>
	급여 : <jsp:getProperty property="sal" name="emp"/><p>
</body>
</html>