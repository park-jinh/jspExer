package och12;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

// singleton + DBCP -> 메모리 절감 +DDos(Distributed Denial of Service) 공격 예방
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
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
		
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
 		if(pstmt != null) pstmt.close();
 		if(conn != null) conn.close();
		return result;
	}
	
	public List<Member2> list() throws SQLException{
		List<Member2> list = new ArrayList<Member2>();
		Connection conn = getConnection();
		String sql = " select * from member2";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()) {
			Member2 member2 = new Member2();
			member2.setId(rs.getString(1));
			member2.setPasswd(rs.getString(2));
			member2.setName(rs.getString(3));
			member2.setAddress(rs.getString(4));
			member2.setTel(rs.getString(5));
			member2.setReg_date(rs.getDate(6));
			list.add(member2);
		}
		if(rs != null) rs.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
		return list;
	}
	
	public Member2 select(String id) throws SQLException{
		Member2 member2 = new Member2();
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			String sql = "select * from member2 where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member2.setId(id);
				member2.setPasswd(rs.getString(2));
				member2.setName(rs.getString(3));
				member2.setAddress(rs.getString(4));
				member2.setTel(rs.getString(5));
				member2.setReg_date(rs.getDate(6));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		return member2;
	}
	
	public int confirm(String id) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = " select id from member2 where id = ? ";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result++;
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}
		
		return result;
	}
	
	public int delete(String id, String pw) throws SQLException{
		int result = check(id, pw);
		if(result==1) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "delete from member2 where id = ?";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				if(pstmt.executeUpdate()==0)
					throw new SQLException();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}
		}
		return result;
		
		
		
		
		
	}
	
}
