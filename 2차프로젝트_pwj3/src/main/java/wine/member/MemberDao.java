package wine.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDao {
	String dirver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbid = "sqlid";
	String dbpw = "sqlpw";

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	private static MemberDao instance;
	public static MemberDao getInstance() {
		if(instance == null) {
			instance = new MemberDao();
		}
		return instance;
	}
	private MemberDao() {
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
			conn = ds.getConnection();
			//System.out.println("conn:" + conn);
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}// MemberDao

public MemberDTO getMemberBean(ResultSet rs) throws SQLException {
		
		MemberDTO member = new MemberDTO();
		member.setNo(rs.getInt("no"));
		member.setId(rs.getString("id"));
		member.setPassword(rs.getString("password"));
		member.setEmail(rs.getString("email"));
		member.setHp1(rs.getString("hp1"));
		member.setHp2(rs.getString("hp2"));
		member.setHp3(rs.getString("hp3"));
		member.setJoindate(rs.getString("joindate"));
		member.setName(rs.getString("name"));
		member.setRrn1(rs.getString("rrn1"));
		member.setRrn2(rs.getString("rrn2"));
		member.setCard(rs.getString("card"));
		member.setAddr(rs.getString("addr"));
		member.setSubaddr(rs.getString("subaddr"));
		return member;
	}//getMemberBean
	
	
	public MemberDTO memberCheck(String id,String password) {
		boolean flag = false;
		MemberDTO member = null; 
		try { 
			String sql = "select * from members where id = ? and password = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, password);
			rs = ps.executeQuery();

			if(rs.next()) {
				member = getMemberBean(rs);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null)
					rs.close();
				if(ps != null)
					ps.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return member;
	}//memberCheck
	
	public MemberDTO findId(String name,String rrn1,String rrn2,String hp1,String hp2, String hp3) {
		boolean flag = false;
		MemberDTO member = null; 
		try { 
			String sql = "select * from members where name = ? and rrn1 = ? and rrn2 = ? and hp1 = ? and hp2 = ? and hp3 = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, rrn1);
			ps.setString(3, rrn2);
			ps.setString(4, hp1);
			ps.setString(5, hp2);
			ps.setString(6, hp3);
			rs = ps.executeQuery();

			if(rs.next()) {
				member = getMemberBean(rs);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null)
					rs.close();
				if(ps != null)
					ps.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return member;
	}//findId
	
	public MemberDTO findPw(String name, String id , String rrn1, String rrn2, String hp1, String hp2, String hp3) {
		MemberDTO md = null;
		String sql ="select * from members where name=? and upper(id)=upper(?) and rrn1 =? and rrn2=? and hp1=? and hp2=? and hp3=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, id);
			ps.setString(3, rrn1);
			ps.setString(4, rrn2);
			ps.setString(5, hp1);
			ps.setString(6, hp2);
			ps.setString(7, hp3);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				md = getMemberBean(rs);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null)
					ps.close();
				if(rs!=null)
					rs.close();
			}catch(SQLException e) {
			}
		}
		return md;
		
	}//findPw
	
	public boolean searchId(String id) {
		boolean flag = false;
		try {
			String sql = "select * from members where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();

			while(rs.next()) {
				flag = true;
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null)
					rs.close();
				if(ps != null)
					ps.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return flag;
	}//searchId
	
	public MemberDTO getMemberById(String id) {
	    MemberDTO md = null;
	    try {
	        String sql = "select * from members where id = ?";
	        ps = conn.prepareStatement(sql);
	        ps.setString(1, id);
	        rs = ps.executeQuery();
	        if(rs.next()) {
				md = getMemberBean(rs);
			}
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null)
	                rs.close();
	            if (ps != null)
	                ps.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return md;
	}

	
	public int insertMember(MemberDTO md) {
		int cnt = -1;
		try {
			String sql = "insert into members values(memseq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, md.getName());
			ps.setString(2, md.getId());
			ps.setString(3, md.getPassword());
			ps.setString(4, md.getRrn1());
			ps.setString(5, md.getRrn2());
			ps.setString(6, md.getEmail());
			ps.setString(7, md.getHp1());
			ps.setString(8, md.getHp2());
			ps.setString(9, md.getHp3());
			ps.setString(10, md.getJoindate());
			ps.setString(11, md.getCard());
			ps.setString(12, md.getAddr());
			ps.setString(13, md.getSubaddr());

			cnt = ps.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null)
					ps.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		System.out.println("insertMember cnt:" + cnt);
		return cnt;
	}//insertMember
	
	public MemberDTO getAddrById(String id) {
		boolean flag = false;
		MemberDTO member = null; 
		try { 
			String sql = "select * from members where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();

			if(rs.next()) {
				member = getMemberBean(rs);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null)
					rs.close();
				if(ps != null)
					ps.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return member;
	}
	
	public int updateMember(MemberDTO mb){
		int cnt = -1;
		PreparedStatement ps = null;
		
		String sql = "update members set id=?, password = ?, email = ?, hp1=?, hp2=?, hp3=?, joindate=?, card=?, addr=?, subaddr=? where no = ?";

		try {
					ps = conn.prepareStatement(sql);
					ps.setString(1,mb.getId());
					ps.setString(2, mb.getPassword());
			        ps.setString(3, mb.getEmail());
			        ps.setString(4, mb.getHp1());
			        ps.setString(5, mb.getHp2());
			        ps.setString(6, mb.getHp3());
			        ps.setString(7, mb.getJoindate());
			        ps.setString(8, mb.getCard());
			        ps.setString(9, mb.getAddr());
			        ps.setString(10,mb.getSubaddr());
			       	ps.setInt(11, mb.getNo());
			       	
					cnt = ps.executeUpdate();
					
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
	}//updateMember
	
}
