
<%@page import="wine.shop.ProductBean"%>
<%@page import="wine.shop.ProductDao"%>
<%@page import="wine.shop.mall.CartBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
    request.setCharacterEncoding("UTF-8");

    String pnum = request.getParameter("pnum");
    String oqty = request.getParameter("oqty");

    String memid = (String)session.getAttribute("memid");
%>

<jsp:useBean id="mallCart" class="wine.shop.mall.CartBean" scope="session"/> 


<%
    ProductDao pdao = ProductDao.getInstance();
    ProductBean pb = pdao.getProductByPnum(String.valueOf(pnum));
    String msg;

    if (pb.getPqty() < Integer.parseInt(oqty)) {
%>
        <script type="text/javascript">
            alert('주문 가능 수량이 초과 되었습니다.');
            location.href = "mall_prodView.jsp?pnum=<%=pb.getPnum()%>";
        </script>
<%
        return; 
    }
        mallCart.addProduct(pnum, oqty);
        msg = "상품이 장바구니에 추가되었습니다.";
  
%>

<script type="text/javascript">
    alert('<%= msg %>');
    location.href = "mall_cartList.jsp";
</script>
