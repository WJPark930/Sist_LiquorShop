<%@page import="wine.shop.ProductBean"%>
<%@page import="wine.shop.ProductDao"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<jsp:useBean id="mallCart" class="wine.shop.mall.CartBean" scope="session"/>  

<%
    String pnum = request.getParameter("pnum");
    String oqty = request.getParameter("oqty");
    System.out.println(" mall_cartList.jsp 에서 넘어온 pnum : " + pnum);
    System.out.println(" mall_cartList.jsp 에서 넘어온 oqty : " + oqty);

    ProductDao pdao = ProductDao.getInstance();
    ProductBean pb = pdao.getProductByPnum(String.valueOf(pnum));
    String msg;

    if(pb.getPqty() < Integer.parseInt(oqty)){ 
%>
    <script type ="text/javascript">
        alert('주문 수량이 초과 되었습니다.');
        location.href="mall_cartList.jsp";
    </script>
<%      
        return;
    }

    mallCart.setEdit(pnum,oqty);
%>
    <script type ="text/javascript">
        alert('주문 수량 수정 성공');
        location.href="mall_cartList.jsp";
    </script>
