<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="dbError.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>스크릿틀릿 + PreparedStatement 수정</h2>
	<%
		int deptno = Integer.parseInt(request.getParameter("deptno"));
		String dname = request.getParameter("dname");
		String loc = request.getParameter("loc");
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String sql = "update dept set dname = ?, loc=? where deptno = ?";
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, "scott","tiger");
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dname);
		pstmt.setString(2, loc);
		pstmt.setInt(3,deptno);
		int result = pstmt.executeUpdate();
		if(result > 0) {
			out.println("수정 성공");
		}
		else out.println("수정 실패");
		pstmt.close();
		conn.close();
	%>
</body>
</html>