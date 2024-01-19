<%@page import="och10.Dept"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- DTO : Data Transfer Object / DAO : Data Access Object(DML로직)  -->
	<%
		String deptno = request.getParameter("deptno");
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@172.30.1.78:1521:xe";
		String sql = "select * from dept where deptno="+deptno;
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, "scott", "tiger");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		//DTO
		Dept dept = new Dept();
		if(rs.next()){
			int deptnoInt = rs.getInt(1);
			String dname = rs.getString("dname"); // rs.getString(2);
			String loc = rs.getString(3); // 숫자는 조회되는 컬럼 순서
			out.println("부서코드 : "+deptno+"<p>");
			out.println("부서명 : "+dname+"<p>");
			out.println("근무지 : "+loc+"<p>");
			
			// Dept Setting
			dept.setDeptno(deptnoInt);
			//dept.setDeptno(Integer.parseInt(deptno));
			dept.setDname(dname);
			dept.setLoc(loc);
			
			// Dept (DTO) 로 저장
			request.setAttribute("dept", dept);
		} else out.println("그게 무슨 부서야 없는데");
		rs.close();
		stmt.close();
		conn.close();
		
		RequestDispatcher rd = request.getRequestDispatcher("ora04Result.jsp");
		rd.forward(request, response);
	%>
</body>
</html>