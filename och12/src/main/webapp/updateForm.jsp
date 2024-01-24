<%@page import="och12.Member2"%>
<%@page import="och12.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ include file="memberCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {
		background-color: pink;
	}
</style>
</head>
<body>
	<%
		MemberDao md = MemberDao.getInstance();
		Member2 member = md.select(id);
		String context = request.getContextPath(); // Tomcat Meta Data
	%>
	<h2>회원정보 수정</h2>
	<form action="updatePro.jsp">
		<table border="1" id="table">
			<tr>
				<td>아이디</td>
				<td><%=id %><input type="hidden" class="id" name="id" id="id"
				value="<%=member.getId()%>"></td>
			</tr>
			<tr>
				<td>암호</td>
				<td><input type="password" name="passwd" id="passwd" required="required"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"  required="required" value="<%=member.getName()%>"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="address"  required="required" value="<%=member.getAddress() %>"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="tel" name="tel"  required="required" pattern="\d{2,3}-\d{3,4}-\d{4}" value="<%=member.getTel() %>"></td>
			</tr>
			<tr>
				<td>날짜</td>
				<td><%= member.getReg_date() %></td>
			</tr>
			
			<tr>
				<td><input type="submit" value="확인"></td>
				<td><input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
</body>
</html>