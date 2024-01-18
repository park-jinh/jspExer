<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>scriptlet 우승자</h2>
	<%
		String[] win = (String[])request.getAttribute("winner");
		for(int i=0; i< win.length; i++){
			out.println((i+1)+"등 : "+win[i]+"<p>");
		}
	%>
	<h2>EL 우승자</h2>
	1등 : ${winner[0] }<p>
	2등 : ${winner[1] }<p>
	3등 : ${winner[2] }<p>
</body>
</html>