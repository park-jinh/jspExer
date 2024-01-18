<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${param.NAME }의 주소는? ${ADDRESS[param.NAME]}<p>
	<%-- ${ADDRESS.김동욱 }<p>  에러 --%>
	${ADDRESS["권도엽"] }<p>
</body>
</html>