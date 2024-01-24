<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="memberCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>탈퇴할려면 암호를 입력하시오</h2>
	<form action="deletePro.jsp">
		<fieldset>
			<label for="passwd">암호 : </label>
			<input type="password" name="passwd" id="passwd"><p>
			<input type="submit" value="확인">
		</fieldset>
	</form>
</body>
</html>