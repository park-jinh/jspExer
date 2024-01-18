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
	int sum = 0;
	for (int i =1 ; i<=100;i++){
		sum += i;
	}
	// 범위가 페이지일 경우에
	request.setAttribute("sum", sum);
	//pageContext.setAttribute("sum", sum);
	RequestDispatcher rd = request.getRequestDispatcher("hunResultEL3.jsp");
	rd.forward(request,response);
	
%>
같은 Page : ${sum}
</body>
</html>