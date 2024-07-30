package wine.shop;

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

public class ProductDao {

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	private static ProductDao instance;
	public static ProductDao getInstance() {
		if(instance == null) {
			instance = new ProductDao();
		}
		return instance;
	}

	private ProductDao() {
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
			conn = ds.getConnection();
			System.out.println("conn:" + conn);
		}catch (NamingException e) {
			e.printStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}//ProductDao

	public int insertProduct(MultipartRequest mr) {
		int cnt = -1;
		String sql = "insert into product(pnum, pname, pcategory_fk, pcompany, pimage, pqty, price, pspec, pcontents, psweet, palch, point, paddr, pfood, pinputdate)"
				+ "  values(catprod.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, mr.getParameter("pname"));

			String pcategory_fk = mr.getParameter("pcategory_fk");
			pcategory_fk += "|" + mr.getParameter("pcode"); // pcategory_fk = 카테고리코드+상품코드

			ps.setString(2, pcategory_fk);
			ps.setString(3, mr.getParameter("pcompany"));
			ps.setString(4, mr.getOriginalFileName("pimage"));
			ps.setString(5, mr.getParameter("pqty"));
			ps.setString(6, mr.getParameter("price"));
			ps.setString(7, mr.getParameter("pspec"));
			ps.setString(8, mr.getParameter("pcontents"));
			ps.setString(9, mr.getParameter("psweet"));
			ps.setString(10, mr.getParameter("palch"));
			ps.setString(11, mr.getParameter("point"));
			ps.setString(12, mr.getParameter("paddr"));
			ps.setString(13, mr.getParameter("pfood"));

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

	public ArrayList<ProductBean> getAllProduct(){
		ArrayList<ProductBean> lists = new ArrayList<ProductBean>();
		try {
			String sql = "select * from product order by pnum";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			lists =  makeArrayList(rs);

		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null)
					ps.close();
				if(rs!=null)
					rs.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return lists;
	}//getAllProduct

	public ArrayList<ProductBean> makeArrayList(ResultSet rs) throws SQLException{
		ArrayList<ProductBean> lists = new ArrayList<ProductBean>();
		while(rs.next()) {
			ProductBean pb = new ProductBean();
			pb.setPnum(rs.getInt("pnum"));
			pb.setPname(rs.getString("pname"));
			pb.setPcategory_fk(rs.getString("pcategory_fk"));
			pb.setPcompany(rs.getString("pcompany"));
			pb.setPimage(rs.getString("pimage"));
			pb.setPqty(rs.getInt("pqty"));
			pb.setPrice(rs.getInt("price"));;
			pb.setPspec(rs.getString("pspec"));
			pb.setPcontents(rs.getString("pcontents"));
			pb.setPsweet(rs.getString("psweet"));
			pb.setPalch(rs.getString("palch"));
			pb.setPoint(rs.getInt("point"));
			pb.setPaddr(rs.getString("paddr"));
			pb.setPfood(rs.getString("pfood"));

			lists.add(pb);
		}
		return lists;
	}//makeArrayList

	//아래 메서드는 mall_cartAdd.jsp , 관리자페이지 수정폼, 관리자페이지 상세보기, 사용자페이지 상품 상세보기 등등 여러 페이지에서 사용.
	public ProductBean getProductByPnum(String pnum) {
		String selectSql = "select * from product where pnum = ?"; 
		ArrayList<ProductBean> lists = new ArrayList<ProductBean>();
		try {
			ps = conn.prepareStatement(selectSql);
			ps.setString(1, pnum);
			rs = ps.executeQuery();

			lists = makeArrayList(rs);

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
		System.out.println("getProductByPnum lists.size():" + lists.size());
		return lists.get(0);
	}//getProductByPnum

	public int updateProduct(MultipartRequest mr, String img) {
	    int cnt = -1;
	    String sql = "update product set pname=?, pcompany=?, pimage=?, pqty=?, price=?, pspec=?, pcontents=?, psweet=?, palch=?, point=?, paddr=? , pfood =? where pnum=?";
	    try {
	        ps = conn.prepareStatement(sql);
	        ps.setString(1, mr.getParameter("pname"));
	        ps.setString(2, mr.getParameter("pcompany"));
	        ps.setString(3, img);
	        ps.setString(4, mr.getParameter("pqty"));
	        ps.setString(5, mr.getParameter("price"));
	        ps.setString(6, mr.getParameter("pspec"));
	        ps.setString(7, mr.getParameter("pcontents"));
	        ps.setString(8, mr.getParameter("psweet"));
	        ps.setString(9, mr.getParameter("palch"));
	        
	        String pointParam = mr.getParameter("point");
	        int pointValue = pointParam != null ? Integer.parseInt(pointParam) : 0;
	        ps.setInt(10, pointValue);
	        
	        ps.setString(11, mr.getParameter("paddr"));
	        ps.setString(12, mr.getParameter("pfood"));
	        
	        ps.setString(13, mr.getParameter("pnum"));
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

	
	public int deleteProduct(int pnum) {
		int cnt = -1;

		try {
			String sql = "delete from product where pnum = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, pnum);
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

	public ArrayList<ProductBean> selectByPspec(String pspec) {
		ArrayList<ProductBean> plists = new ArrayList<>();
		try {        
			String sql = "select * from product where pspec = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, pspec);
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
	}

	public ArrayList<ProductBean> selectByCategory(String code){
	    ArrayList<ProductBean> plists = new ArrayList<>();
	    
	    try {
	        String sql = "select * from product where pcategory_fk like ?";
	        ps = conn.prepareStatement(sql);
	        ps.setString(1, "%" + code + "%");
	        rs = ps.executeQuery();
	        plists = makeArrayList(rs);
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
	}
	
	
	public ArrayList<ProductBean> getBestProducts() {
		ArrayList<ProductBean> plists = new ArrayList<>();
		try {        
			String sql = "select * from product where pspec = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "BEST");
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
	}


}

