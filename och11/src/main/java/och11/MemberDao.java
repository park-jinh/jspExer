package och11;
// DB CRUD 관련된 DML 처리 LOGIC

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDao {
	// 1. 선언 (Member 변수)
	Connection conn = null;
	
	// DBCP
	private Connection getUserConn() throws SQLException {
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
			// 2. 선언 된 것을 가지고 연결
			conn = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
		return conn;
	}
	
	// insert Method 생성
    // getUserConn 사용
	// parameter --> MemberDto
	// return ->int 
	// PreparedStatement
	public int insert(MemberDto member) throws SQLException {
		getUserConn();
		String sql = "INSERT INTO Member1 (ID,password,name,reg_date) VALUES (?,?,?,sysdate)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, member.getId());
		pstmt.setString(2, member.getPassword());
		pstmt.setString(3, member.getName());
		int result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		return result;
	}
	
}
