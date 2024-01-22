<%@page import="och10.Emp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="../dbError.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String empno = request.getParameter("empno");
		String sql = "select empno, ename, sal, hiredate from emp where empno="+empno;
		// hw02
		// 1. DBCP 연동
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		Connection conn = ds.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		// 2. Emp DTO setter
		Emp emp = new Emp();
		if(rs.next()){
			emp.setEmpno(rs.getInt(1));
			emp.setEname(rs.getString(2));
			emp.setSal(rs.getInt(3));
			emp.setHiredate(rs.getDate(4));
		// 3. oraResult.jsp 이동
			request.setAttribute("emp", emp);
			RequestDispatcher rd = request.getRequestDispatcher("oraResult.jsp");
			rd.forward(request, response);
		}
	%>
	<script type="text/javascript">
		alert("해당 자료 없음");
		location.href = "oraInEmp.html";
	</script>
</body>
</html>