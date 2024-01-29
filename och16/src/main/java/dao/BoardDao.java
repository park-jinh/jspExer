package dao;

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


public class BoardDao {
	private static BoardDao instance;
	
	private BoardDao() {}
	
	public static BoardDao getInstance() {
		if(instance == null) {
			instance = new BoardDao();
		}
		return instance;
	}
	
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	
	public int getTotalCnt() throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from board";
		int result=0;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next())
				result = rs.getInt(1);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}
		
		return result;
	}

	public List<Board> boardList(int startRow, int endRow) throws SQLException{
		List<Board> list = new ArrayList<Board>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select *\r\n"
				+ "from \r\n"
				+ "    (select rownum rn, a.*\r\n"
				+ "    from (SELECT * FROM board order by ref DESC, board.re_step) a)\r\n"
				+ "where rn Between ? and ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board();
				board.setNum(rs.getInt(2));
				board.setWriter(rs.getString(3));
				board.setSubject(rs.getString(4));
				board.setContent(rs.getString(5));
				board.setEmail(rs.getString(6));
				board.setReadcount(rs.getInt(7));
				board.setPasswd(rs.getString(8));
				board.setRef(rs.getInt(9));
				board.setRe_step(rs.getInt(10));
				board.setRe_level(rs.getInt(11));
				board.setIp(rs.getString(12));
				board.setReg_date(rs.getDate(13));
				list.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
				
		return list;
	}

	public void readCount(int num) throws SQLException{
		Connection conn = null;
		Statement stmt = null;
		//String sql = "update board set readcount = (select readcount from board where num="+num+")+1 where num="+num;
		String sql = "update board set readcount = readcount+1 where num="+num;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			int result = stmt.executeUpdate(sql);
			if(result==0)
				throw new SQLException();
				
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}
	}

	public Board select(int num) throws SQLException{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from board where num=" + num;
		Board board = new Board();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				board.setNum(rs.getInt(1));
				board.setWriter(rs.getString(2));
				board.setSubject(rs.getString(3));
				board.setContent(rs.getString(4));
				board.setEmail(rs.getString(5));
				board.setReadcount(rs.getInt(6));
				board.setPasswd(rs.getString(7));
				board.setRef(rs.getInt(8));
				board.setRe_step(rs.getInt(9));
				board.setRe_level(rs.getInt(10));
				board.setIp(rs.getString(11));
				board.setReg_date(rs.getDate(12));
			}
				
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}
		
		return board;
	}

	public int update(Board board) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update board set writer=?, email=?, subject=?, passwd=?, content=?, ip=? where num = ?";
		int result=0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getWriter());
			pstmt.setString(2, board.getEmail());
			pstmt.setString(3, board.getSubject());
			pstmt.setString(4, board.getPasswd());
			pstmt.setString(5, board.getContent());
			pstmt.setString(6, board.getIp());
			pstmt.setInt(7,board.getNum());
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		
		return result;
	}

	
	public int insert(Board board) throws SQLException{
		int num = board.getNum();
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rs = null;
		String sql1 = "select nvl(max(num),0) from board";
		String sql="insert into board values(?,?,?,?,?,?,?,?,?,?,?,sysdate)";
		// 홍해의 기적
		String sql2 = "update board set re_step = re_step+1 where ref=? and re_step > ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			rs.next();
			// key인 num 1씩 증가, mysql auto_increment 또는 oracle sequence
			// sequence를 사용 : values(시퀀스명(board_seq).nextval,?,?...)
			int number = rs.getInt(1) + 1;
			rs.close();
			pstmt.close();
			
			// 댓글 ---> sql2
			if(num !=0) {
				System.out.println("BoardDao insert 댓글 sql2->"+sql2);
				System.out.println("BoardDao insert 댓글 board.getRef()->"+board.getRef());
				System.out.println("BoardDao insert 댓글 board.getRe_step()->"+board.getRe_step());
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, board.getRef());
				pstmt.setInt(2, board.getRe_step());
				pstmt.executeUpdate();
				pstmt.close();
				
				// 댓글 관련 정보
				board.setRe_step(board.getRe_step()+1);
				board.setRe_level(board.getRe_level()+1);
			}
			
			if(num==0) board.setRef(number); // 신규글 일 때 num과 Ref 맞춰줌
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, board.getWriter());
			pstmt.setString(3, board.getSubject());
			pstmt.setString(4, board.getContent());
			pstmt.setString(5, board.getEmail());
			pstmt.setInt(6, board.getReadcount());
			pstmt.setString(7, board.getPasswd());
			pstmt.setInt(8, board.getRef());
			pstmt.setInt(9, board.getRe_step());
			pstmt.setInt(10, board.getRe_level());
			pstmt.setString(11, board.getIp());
			result = pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		
		/*
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into board VALUES ((select nvl(max(num),0)+1 from board),?,?,?,?,0,?,(select nvl(max(num),0)+1 from board),0,0,?,sysdate)";
		int result = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getWriter());
			pstmt.setString(2, board.getSubject());
			pstmt.setString(3, board.getContent());
			pstmt.setString(4, board.getEmail());
			pstmt.setString(5, board.getPasswd());
			pstmt.setString(6, board.getIp());
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}
		*/
		return result;
	}

	public int delete(int num, String passwd) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from board WHERE num=? and passwd=?";
		int result = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, passwd);
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}
		return result;
	}

	
}
