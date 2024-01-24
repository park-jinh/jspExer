<%@page import="och12.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<% String id = request.getParameter("id"); %>
	<script type="text/javascript">
		function wincl() {
			opener.document.frm.id.value="<%=id%>";
			window.close();
		}
	</script>
</head>
<body>
	<%
		MemberDao md = MemberDao.getInstance();
		int result = md.confirm(id); 
		// 존재 않는 사용자
		if (result ==0){
	%>
		<%=id %>는 사용할 수 있습니다.<p>
		<input type="button" value="닫기" onclick="wincl()">
	<%} else { // 존재 사용자 -->1 %>
		<%=id %>이미 있는 아이디니 다른 것을 입력하세요<p>
		<form>
			아이디 : <input type="text" name="id"><p>
			<input type="submit" value="확인">
		</form>
	<% } %>
</body>
</html>