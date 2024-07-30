package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDao {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbid = "sqlid";
	String dbpw = "sqlpw";
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	private static BoardDao instance;
	public static BoardDao getInstance() {
		if(instance==null) {
			instance = new BoardDao();
		}
		return instance;
	}

	private BoardDao() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, dbid, dbpw);
			//System.out.println("드라이버 로드 / 계정 접속");
		}catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public int getArticleCount(){ // 전체 레코드 갯수 

		int cnt = 0;
		String sql = "select count(*) as cnt from board";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();			

			if(rs.next()) {
				cnt = rs.getInt("cnt");
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs!=null) {
					rs.close();
				}
				if (ps!=null) {
					ps.close();
				}
				//				if (conn!=null) {
				//					conn.close();
				//				}
			}catch (SQLException e) {
				System.out.println("접속 종료");
				e.printStackTrace();
			}	
		}
		return cnt;

	}//getArticleCount

	public ArrayList<BoardBean> getArticles(int start, int end, int upnum){

		ArrayList<BoardBean> lists = new ArrayList<BoardBean>();

		String sql = "select num, writer, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip, upnum " ;		        
		sql += "from (select rownum as rank, num, writer, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip, upnum ";
		sql += "from (select num, writer, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip, upnum ";
		sql += "from board ";
		sql += "order by ref desc, re_step asc )) ";
		sql += "where rank between ? and ? and upnum = ?";	

		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			ps.setInt(3, upnum);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardBean bb = new BoardBean();

				bb.setNum(rs.getInt("num"));
				bb.setWriter(rs.getString("writer"));
				bb.setSubject(rs.getString("subject"));
				bb.setPasswd(rs.getString("passwd"));
				bb.setReg_date(rs.getTimestamp("reg_date"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setRef(rs.getInt("ref"));
				bb.setRe_step(rs.getInt("re_step"));
				bb.setRe_level(rs.getInt("re_level"));
				bb.setContent(rs.getString("content"));
				bb.setIp(rs.getString("ip"));
				bb.setUpnum(upnum);
				
				lists.add(bb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null)
					ps.close();
				if(rs != null)
					rs.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return lists;

	}//getArticles

	public BoardBean getArticle(int num) {

		BoardBean bb = new BoardBean();
		try { 
			String sql2 = "update board set readcount = readcount+1 where num=?";
			ps = conn.prepareStatement(sql2);
			ps.setInt(1, num);
			ps.executeUpdate();

			String sql = "select * from board where num = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if(rs.next()) {
				bb.setNum(num);
				bb.setWriter(rs.getString("writer"));
				bb.setSubject(rs.getString("subject"));
				bb.setPasswd(rs.getString("passwd"));
				bb.setReg_date(rs.getTimestamp("reg_date"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setRef(rs.getInt("ref"));
				bb.setRe_step(rs.getInt("re_step"));
				bb.setRe_level(rs.getInt("re_level"));
				bb.setContent(rs.getString("content"));
				bb.setIp(rs.getString("ip"));
				bb.setUpnum(rs.getInt("upnum"));
			}

		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null)
					ps.close();
				if(rs != null)
					rs.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return bb;
	}

	public int insertArticle(BoardBean bb, int upnum) {

		int cnt = -1;
		String sql = "insert into board (num, writer, subject, passwd, reg_date, ref, re_step, re_level, content, ip, upnum) "
				+ "values (board_seq.nextval, ?, ?, ?, ?,  board_seq.currval, ?, ?, ?, ?, ?)";

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, bb.getWriter());
			ps.setString(2, bb.getSubject());
			ps.setString(3, bb.getPasswd());
			ps.setTimestamp(4, bb.getReg_date());
			ps.setInt(5, 0);
			ps.setInt(6, 0);
			ps.setString(7, bb.getContent());
			ps.setString(8, bb.getIp());
			ps.setInt(9, upnum);

			cnt = ps.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null)
					ps.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;

	}//insertArticle

	public int deleteArticle(int num, String passwd) {

		String sql = "select passwd from board where num=?";
		String sql2 = "delete from board where num=?";
		int cnt = -1;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if(rs.next()) {
				String dbpw = rs.getString("passwd");
				if(dbpw.equals(passwd)) {
					ps = conn.prepareStatement(sql2);
					ps.setInt(1, num);
					cnt = ps.executeUpdate();
				}else {
					cnt = 0;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null)
					ps.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return cnt;
	}//deleteArticle 

	public void replyArticle(BoardBean bb) {
	    int updatecnt = 0;
	    int insertcnt = 0;
	    try {
	        String updateSql = "update board set re_step = re_step + 1 where ref = ? and re_step > ? and upnum = ?";
	        String insertSql = "insert into board (num, writer, subject, passwd, reg_date, ref, re_step, re_level, content, ip, upnum) "
	                + "values (board_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	        ps = conn.prepareStatement(updateSql);
	        ps.setInt(1, bb.getRef());
	        ps.setInt(2, bb.getRe_step());
	        ps.setInt(3, bb.getUpnum());
	        
	        updatecnt = ps.executeUpdate();
	        if(updatecnt >= 0) {
	            ps = conn.prepareStatement(insertSql);
	            ps.setString(1, bb.getWriter());
	            ps.setString(2, bb.getSubject());
	            ps.setString(3, bb.getPasswd());
	            ps.setTimestamp(4, bb.getReg_date());
	            ps.setInt(5, bb.getRef());
	            ps.setInt(6, bb.getRe_step()+1);
	            ps.setInt(7, bb.getRe_level()+1);
	            ps.setString(8, bb.getContent());
	            ps.setString(9, bb.getIp());
	            ps.setInt(10, bb.getUpnum());

	            insertcnt = ps.executeUpdate();
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if(ps != null)
	                ps.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}


	public BoardBean updateGetArticle(int num){
		BoardBean bb = new BoardBean();
		try {
			String sql = "select * from board where num = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if(rs.next()) {
				bb.setNum(num);
				bb.setWriter(rs.getString("writer"));
				bb.setSubject(rs.getString("subject"));
				bb.setPasswd(rs.getString("passwd"));
				bb.setReg_date(rs.getTimestamp("reg_date"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setRef(rs.getInt("ref"));
				bb.setRe_step(rs.getInt("re_step"));
				bb.setRe_level(rs.getInt("re_level"));
				bb.setContent(rs.getString("content"));
				bb.setIp(rs.getString("ip"));
				bb.setUpnum(rs.getInt("Upnum"));
			}

		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null)
					ps.close();
				if(rs != null)
					rs.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return bb;
	}//updateGetArticle
	
	public int updateArticle(BoardBean bb){
		int cnt = -1;
		PreparedStatement ps = null;
		
		String sql2 = "select passwd from board where num=?";
		String sql = "update board set writer = ?, subject = ?, content = ? where num = ?";

		try {
			
			ps = conn.prepareStatement(sql2);
			ps.setInt(1, bb.getNum());
			rs = ps.executeQuery();
			if(rs.next()) {
				String dbpw = rs.getString("passwd");
				if(dbpw.equals(bb.getPasswd())) {
					ps = conn.prepareStatement(sql);
					ps.setString(1, bb.getWriter());
			        ps.setString(2, bb.getSubject());
			        ps.setString(3, bb.getContent());
			        ps.setInt(4, bb.getNum());
					cnt = ps.executeUpdate();
				}else {
					cnt = 0;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null)
					ps.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}//updateArticle
	
	
	public ArrayList<BoardBean> getComments(int parentNum) {
	    ArrayList<BoardBean> comments = new ArrayList<>();
	    String sql = "SELECT num, writer, reg_date, re_level, content FROM board WHERE ref = ? AND re_level > 0 ORDER BY reg_date ASC";
	    try {
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, parentNum);
	        ResultSet rs = pstmt.executeQuery();
	        while (rs.next()) {
	            BoardBean comment = new BoardBean();
	            comment.setNum(rs.getInt("num"));
	            comment.setWriter(rs.getString("writer"));
	            comment.setReg_date(rs.getTimestamp("reg_date"));
	            comment.setRe_level(rs.getInt("re_level"));
	            comment.setContent(rs.getString("content"));
	            comments.add(comment);
	        }
	        rs.close();
	        pstmt.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return comments;
	}//getComments

}

