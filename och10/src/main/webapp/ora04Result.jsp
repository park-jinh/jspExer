<%@page import="och10.Dept"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% Dept dept2 = (Dept)request.getAttribute("dept");  %>
	<h2>Expression 부서정보</h2>
	부서코드 : <%=dept2.getDeptno() %><p>
	부서명 : <%=dept2.getDname() %><p>
	근무지 : <%=dept2.getLoc() %><p>
	
	<h2>EL 부서정보 (같은의미)</h2>
	부서코드 : ${dept.getDeptno() }<p>
	부서명 : ${dept.dname }<p>
	근무지 : ${dept.loc }<p>
	<!-- EL에서 필드명을 쓰면 알아서 겟터가 호출됨  -->	
</body>
</html>