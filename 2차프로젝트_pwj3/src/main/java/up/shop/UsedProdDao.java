package up.shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;

public class UsedProdDao {
	String dirver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbid = "sqlid";
	String dbpw = "sqlpw";

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	private static UsedProdDao instance;
	public static UsedProdDao getInstance() {
		if(instance == null) {
			instance = new UsedProdDao();
		}
		return instance;
	}
	private UsedProdDao() {
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
	}//UsedProdDao

	
	public ArrayList<UsedProdDTO> selectByAddr(String addr) {
		ArrayList<UsedProdDTO> plists = new ArrayList<>();
		try {        
			String sql = "select * from usedproduct where uaddr = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, addr);
			rs = ps.executeQuery();
			plists =  makeArrayList(rs);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null)
					rs.close();
				if(ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return plists;
	}//selectByAddr
	
	
	public UsedProdDTO selectByPnum(String upnum) {
		ArrayList<UsedProdDTO> plists = new ArrayList<>();
		try {        
			String sql = "select * from usedproduct where upnum = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, upnum);
			rs = ps.executeQuery();
			plists =  makeArrayList(rs);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null)
					rs.close();
				if(ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return plists.get(0);
	}
	
	public UsedProdDTO selectByUpnum(String upnum) {
		ArrayList<UsedProdDTO> plists = new ArrayList<>();
		try {        
			String sql = "select * from usedproduct where upnum = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, upnum);
			rs = ps.executeQuery();
			plists =  makeArrayList(rs);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null)
					rs.close();
				if(ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return plists.get(0);
	}
	
	public ArrayList<UsedProdDTO> selectByMemId(String memid) {
		ArrayList<UsedProdDTO> plists = new ArrayList<>();
		try {        
			String sql = "select * from usedproduct where uaddr = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, memid);
			rs = ps.executeQuery();
			plists =  makeArrayList(rs);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null)
					rs.close();
				if(ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return plists;
	}//selectByMemId
	
	public ArrayList<UsedProdDTO> selectByMname(String mname) {
		ArrayList<UsedProdDTO> plists = new ArrayList<>();
		try {        
			String sql = "select * from usedproduct where username = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, mname);
			rs = ps.executeQuery();
			plists =  makeArrayList(rs);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null)
					rs.close();
				if(ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return plists;
	}//selectByMname
	
	public ArrayList<UsedProdDTO> makeArrayList(ResultSet rs) throws SQLException{
		ArrayList<UsedProdDTO> lists = new ArrayList<UsedProdDTO>();
		while(rs.next()) {
			UsedProdDTO upd = new UsedProdDTO();
			upd.setUpnum(rs.getInt("upnum"));
			upd.setUpname(rs.getString("upname"));
			upd.setUpcategory(rs.getString("upcategory"));
			upd.setUprice(rs.getInt("uprice"));
			upd.setUpimage(rs.getString("upimage"));
			upd.setUpcontents(rs.getString("upcontents"));
			upd.setUaddr(rs.getString("uaddr"));
			upd.setUsername(rs.getString("username"));
			upd.setTitle(rs.getString("title"));

			lists.add(upd);
		}
		return lists;
	}//makeArrayList
	
	public int insertProduct(MultipartRequest mr) {
		int cnt = -1;
		String sql = "insert into usedproduct values(upseq.nextval,?,?,?,?,?,?,?,?)";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, mr.getParameter("upname"));
			ps.setString(2, mr.getParameter("upcategory"));
			ps.setString(3, mr.getParameter("uprice"));
			ps.setString(4, mr.getOriginalFileName("upimage"));
			ps.setString(5, mr.getParameter("upcontents"));
			ps.setString(6, mr.getParameter("uaddr"));
			ps.setString(7, mr.getParameter("username"));
			ps.setString(8, mr.getParameter("title"));
			
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
	}//insertProduct

	
	public int deleteProduct(int upnum) {
		int cnt = -1;

		try {
			String sql = "delete from usedproduct where upnum = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, upnum);
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null)
					ps.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}//deleteProduct
	
	public int updateProduct(MultipartRequest mr, String img) {
	    int cnt = -1;
	    String sql = "update usedproduct set upname=?, upcategory=?, uprice=?, upimage=?, upcontents=?, uaddr=?, username=?, title=? where upnum=?";
	    try {
	        ps = conn.prepareStatement(sql);
	        ps.setString(1, mr.getParameter("upname"));
	        ps.setString(2, mr.getParameter("upcategory"));
	        ps.setString(3, mr.getParameter("uprice"));
	        ps.setString(4, img);
	        ps.setString(5, mr.getParameter("upcontents"));
	        ps.setString(6, mr.getParameter("uaddr"));
	        ps.setString(7, mr.getParameter("username"));
	        ps.setString(8, mr.getParameter("title"));        
	        ps.setString(9, mr.getParameter("upnum"));
	      
	        cnt = ps.executeUpdate();

	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (ps != null) {
	                ps.close();
	            }
	            if (rs != null) {
	                rs.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return cnt;
	}
}
