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
	<!-- num에서 호출 try-catch  -->
	<c:catch var="e1">
		<%
			int num1 = Integer.parseInt(request.getParameter("num1"));
			int num2 = Integer.parseInt(request.getParameter("num2"));
		%>
		나눗셈 결과 : <%=num1/num2 %>
	</c:catch>
	<c:if test="${e1 != null }">
		에러메세지 : ${e1.message }
	</c:if>
</body>
</html>