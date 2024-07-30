<%@page import="wine.shop.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

mall_order.jsp에서 결제하기 버튼을 클릭하면 mall_calculate로 넘어온다.

 <jsp:useBean id="mallCart" class="wine.shop.mall.CartBean" scope="session"/>  

 <jsp:useBean id="order" class="wine.shop.mall.OrdersDao" scope="session"/> 

 <%
 	int memno = (Integer)session.getAttribute("memno");
 	String memcard = (String)session.getAttribute("memcard");
 	String memid = (String)session.getAttribute("memid");
 	System.out.println("결제하기 누르면 넘어오는 memid : " + memid);
 	
 	System.out.println("결제하기 버튼 누르면 넘어오는 memno : " + memno);
 	System.out.println("결제하기 버튼 누르면 넘어오는 memcard : " + memcard);
 	
 	Vector<ProductBean> clist = mallCart.getAllProducts();
 	int cnt = order.insertOrders(memno ,memcard, memid,clist);
 	

 	
 	

 	String msg;
 	if(cnt>0){
 		msg="결제 성공";
 		mallCart.removeAllProduct();
 	}else{
 		msg="결제 실패";
 	}
 %>

 
 <script>
 alert('<%= msg %>');
 location.href = "mall.jsp";
 </script>