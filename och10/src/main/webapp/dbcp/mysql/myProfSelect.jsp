<%@page import="och10.Professor"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="../../dBError.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String profno = request.getParameter("pno");
	String sql = 
		"select profno, name, sal, hiredate from professor where profno="+profno;
	Context ctx = new InitialContext();
	DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/MySql");
	Connection conn = ds.getConnection();
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	System.out.println("Professor list sql->" +sql);
	
	Professor p = new Professor();
	if (rs.next()) {  
		System.out.println("Professor  profno->" +rs.getInt(1));
		System.out.println("Professor  name->" +rs.getString(2));
		System.out.println("Professor  Sal->" +rs.getInt(3));
		System.out.println("Professor  hiredate->" +rs.getDate(4));
		p.setProfno(rs.getInt(1));
		p.setName(rs.getString(2));
		p.setSal(rs.getInt(3)); 
		p.setHiredate(rs.getDate(4));
		request.setAttribute("professor", p);
	} 
	
	rs.close();  
	stmt.close();  
	conn.close();
	RequestDispatcher rd=request.getRequestDispatcher("myProfResult.jsp");
    rd.forward(request, response);




%>
</body>
</html>