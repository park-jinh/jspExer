<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String info = application.getServerInfo();
		int major = application.getMajorVersion();
		int minor = application.getMinorVersion();
		String path = application.getRealPath("/");
	%>
	<h2>Application 내장객체 예제</h2>
	웹 컨테이너의 이름과 버전 : <%=info %><p>
	서블릿의 버전 : <%=major %>.<%=minor %><p>
	웹 어플리케이션 폴더의 로컬 시스템 경로 : <%=path %>
</body>
</html>