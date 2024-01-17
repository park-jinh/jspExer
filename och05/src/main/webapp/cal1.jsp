<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>연산결과</h2>
	<%
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		try{
			out.println(num1 + " + "+ num2 +" = "+(num1+num2)+"<p>");
			out.println(num1 + " - "+ num2 +" = "+(num1-num2)+"<p>");
			out.println(num1 + " * " +num2 +" = "+(num1*num2)+"<p>");
			out.println(num1 + " / " +num2 +" = "+(num1/num2)+"<p>");
		}catch(NumberFormatException nfe){
			out.println("연산결과 NumberFormatException JSP");
		}catch(ArithmeticException ae){
			out.println("연산결과 ArithmeticException JSP");
		}catch(Exception e){
			out.println("JSP e.getMessage()->"+e.getMessage());
		}
		
		
	%>
</body>
</html>