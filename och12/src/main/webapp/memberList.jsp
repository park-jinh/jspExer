<%@page import="och12.Member2"%>
<%@page import="java.util.List"%>
<%@page import="och12.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	tr:hover{ background-color: orange;}
	td { text-align: center;}
</style>
</head>
<body bgcolor="yellow">
	<%
		MemberDao md = MemberDao.getInstance();
		List<Member2> list = md.list();
		if(list == null){
			out.println("회원이 없습니다.");
		} else {
	%>
	<h2>회원정보</h2>
		<table bgcolor="pink" width="100%">
			<tr bgcolor="cyan"><th>아이디</th><th>이름</th><th>주소</th><th>전화번호</th><th>가입일</th></tr>
			<% for (int i=0;i<list.size();i++){
				out.println("<tr><td>"+list.get(i).getId()+
								"</td><td>"+list.get(i).getName()+
								"</td><td>"+list.get(i).getAddress()+
								"</td><td>"+list.get(i).getTel()+
								"</td><td>"+list.get(i).getReg_date()+"</td></tr>"
								);
			} %>
		</table>		
	<% } %>
</body>
</html>