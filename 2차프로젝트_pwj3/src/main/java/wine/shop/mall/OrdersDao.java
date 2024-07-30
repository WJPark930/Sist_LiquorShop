package wine.shop.mall;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import wine.shop.ProductBean;
import wine.shop.ProductDao;


public class OrdersDao {
	Connection conn = null;
	PreparedStatement ps = null;
	
	private static OrdersDao instance;
	public static OrdersDao getInstance() {
		if(instance == null) {
			instance = new OrdersDao();
		}
		return instance;
	}

	
	public OrdersDao(){
		;
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
			conn = ds.getConnection();
		}catch (NamingException e) {
			e.printStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}//OrdersDao
	
	public int insertOrders(int memno, String memcard, String memid, Vector<ProductBean> clist) {
	    PreparedStatement ps = null;
	    int cnt = 0;
	    try {
	        for(int i=0; i<clist.size(); i++) {
	        	String sql = "insert into orders(orderid, memno, memcard, mid, pname, oqty, amount) values(orderseq.nextval, ?, ?, ?, ?, ?, ?)";
	            ps = conn.prepareStatement(sql);
	            ps.setInt(1, memno);
	            ps.setString(2, memcard);
	            ps.setString(3, memid);
	            ps.setString(4, clist.get(i).getPname());
	            ps.setInt(5, clist.get(i).getPqty());
	            ps.setInt(6, clist.get(i).getPrice()*clist.get(i).getPqty());
	            cnt += ps.executeUpdate();
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if(ps!=null)
	                ps.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return cnt;
	}//insertOrders

	
	public Vector<OrderBean> getOrderList(String memid) throws SQLException {
	    PreparedStatement ps = null;
	    Vector<OrderBean> lists = new Vector<OrderBean>();
	    String sql = "SELECT m.NAME AS member_name,\r\n"
	            + "       o.ORDERID, o.MID, o.OQTY, o.AMOUNT,\r\n"
	            + "       p.PNAME AS product_name\r\n"
	            + "FROM members m\r\n"
	            + "JOIN orders o ON m.ID = o.MID\r\n"
	            + "JOIN product p ON o.PNAME = p.PNAME\r\n"
	            + "WHERE m.id=?";

	    
	    ps = conn.prepareStatement(sql);
	    ps.setString(1, memid);
	    ResultSet rs = ps.executeQuery();
	    
	    while (rs.next()) {
	        OrderBean ob = new OrderBean();
	        ob.setOrderid(rs.getInt("ORDERID")); // 주문 고유번호 설정
	        ob.setMid(rs.getString("MID"));
	        ob.setMname(rs.getString("MEMBER_NAME"));
	        ob.setPname(rs.getString("PRODUCT_NAME"));
	        ob.setOqty(rs.getInt("OQTY"));
	        ob.setAmount(rs.getInt("AMOUNT"));
	        lists.add(ob);
	    }
	    return lists;
	}
	
	public Vector<OrderBean> getOrderList2(String customerId) throws SQLException {
	    PreparedStatement ps = null;
	    Vector<OrderBean> lists = new Vector<OrderBean>();
	    String sql = "SELECT o.ORDERID, o.MID, o.OQTY, o.AMOUNT, m.NAME AS member_name,\r\n"
	    		+ "       o.PNAME AS ordered_product, p.PNAME AS product_name\r\n"
	    		+ "FROM members m\r\n"
	    		+ "JOIN orders o ON m.ID = o.MID\r\n"
	    		+ "JOIN product p ON o.PNAME = p.PNAME\r\n"
	    		+ "WHERE m.id = ?\r\n";
	    
	    ps = conn.prepareStatement(sql);
	    ps.setString(1, customerId);
	    ResultSet rs = ps.executeQuery();
	    
	    while (rs.next()) {
	        OrderBean ob = new OrderBean();
	        ob.setOrderid(rs.getInt("ORDERID")); // 주문 고유번호 설정
	        ob.setMid(rs.getString("MID"));
	        ob.setMname(rs.getString("MEMBER_NAME"));
	        ob.setPname(rs.getString("PRODUCT_NAME"));
	        ob.setOqty(rs.getInt("OQTY"));
	        ob.setAmount(rs.getInt("AMOUNT"));
	        lists.add(ob);
	    }
	    return lists;
	}

	
	public Vector<OrderBean> getAllOrderList() throws SQLException {
	    PreparedStatement ps = null;
	    Vector<OrderBean> lists = new Vector<OrderBean>();
	    String sql = "SELECT o.ORDERID, o.MID, m.NAME AS member_name, o.PNUM, o.OQTY, o.AMOUNT, p.PNAME AS product_name " 
	            + "FROM members m " 
	            + "JOIN orders o ON m.ID = o.MID " 
	            + "JOIN product p ON o.PNAME = p.PNAME";
	    
	    ps = conn.prepareStatement(sql);
	    ResultSet rs = ps.executeQuery();
	    
	    while (rs.next()) {
	        OrderBean ob = new OrderBean();
	        ob.setOrderid(rs.getInt("ORDERID"));
	        ob.setMid(rs.getString("MID"));
	        ob.setMname(rs.getString("MEMBER_NAME"));
	        ob.setPname(rs.getString("PRODUCT_NAME"));
	        ob.setOqty(rs.getInt("OQTY"));
	        ob.setAmount(rs.getInt("AMOUNT"));
	        lists.add(ob);
	    }
	    return lists;
	}



	
	
	public int cancelOrder(int orderid) {
		int cnt = 0;

		try {
			String sql = "delete from orders where orderid = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, orderid);
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
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
	}//cancelOrder
}
