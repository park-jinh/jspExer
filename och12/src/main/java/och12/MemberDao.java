package och12;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

// singleton + DBCP -> 메모리 절감 +DDos 공격 예방
public class MemberDao {
	private static MemberDao instance;
	
	private MemberDao() {
		
	}
	
	public static MemberDao getInstance() {
		if(instance == null) {
			instance = new MemberDao();
		}
		return instance;
	}
	
	private Connection getConnection() {
		Connection conn = null;
		
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	
	public int check(String id, String passwd) throws SQLException {
		Connection conn = getConnection();
		int result = -1;
		String sql = " select passwd from member2 where id=? ";
		
		PreparedStatement pstmt=null;
	
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			result++;
			if(rs.getString(1).equals(passwd))
				result++;
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	public int insert(Member2 member2) throws SQLException {
		Connection conn = getConnection();
		String sql = " insert into member2 values (?,?,?,?,?,sysdate) ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, member2.getId());
		pstmt.setString(2, member2.getPasswd());
		pstmt.setString(3, member2.getName());
		pstmt.setString(4, member2.getAddress());
		pstmt.setString(5, member2.getTel());
		//pstmt.setDate(6, new java.sql.Date((new java.util.Date()).getTime())); // util Date 타입을 sql Date타입으로 변경 방법
 		int result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		return result;
	}
}
