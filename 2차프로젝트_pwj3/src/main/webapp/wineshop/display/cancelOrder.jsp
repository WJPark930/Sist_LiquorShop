<%@page import="wine.shop.mall.OrdersDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%
int orderid = Integer.parseInt(request.getParameter("orderid"));
//	System.out.println("취소창으로 넘어온 orderid : " + orderid);

    OrdersDao orderDao = OrdersDao.getInstance();
    int isCancelled = orderDao.cancelOrder(orderid);  

    String message;
    if (isCancelled > 0) {
        message = "주문이 취소되었습니다.";
    } else {
        message = "주문 취소에 실패했습니다.";
    }
%>

<script>
    alert("<%= message %>");
    window.location.href = "mypage_order.jsp";
</script>
