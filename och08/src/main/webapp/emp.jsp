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
	
	<!-- Bean 값 저장 -->
	<%-- <jsp:setProperty property="*" name="emp" /> --%>
	<jsp:setProperty property="empno" name="emp"/>
	<jsp:setProperty property="ename" name="emp"/>
	<jsp:setProperty property="job" name="emp"/>
	<jsp:setProperty property="sal" name="emp"/>
	
	<!--Bean Page 이동  -->
	<jsp:forward page="empResult.jsp" />
	
</body>
</html>