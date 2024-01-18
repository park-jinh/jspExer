<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Bean 선언 -->
	<jsp:useBean id="pt" class="och08.Book" scope="request" />
	<h2>제품정보(productInfo)</h2>
	코드 : <jsp:getProperty property="code" name="pt" /><p>
	이름 : <jsp:getProperty property="name" name="pt" /><p>
	가격 : <jsp:getProperty property="price" name="pt" /><p>
	<br>
</body>
</html>