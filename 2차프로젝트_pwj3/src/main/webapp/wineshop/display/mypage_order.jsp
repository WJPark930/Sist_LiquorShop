<%@page import="wine.shop.mall.OrdersDao"%>
<%@page import="java.util.List"%>
<%@page import="wine.shop.mall.OrderBean"%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<%@include file="malltop.jsp" %>

<%
    OrdersDao orderDao = OrdersDao.getInstance(); 
    List<OrderBean> orderList = orderDao.getOrderList((String)session.getAttribute("memid"));
    //System.out.println("세션으로 마이페이지로 넘어온 id : " + memid);
%>

<div align="center">
    <p style="font-size: 30px; font-weight: bold;" align="center">마이페이지</p>
    <a align="center" href="mypage.jsp" style="text-decoration: none;">내 정보 수정하기</a> |
    <a align="center" href="#" style="text-decoration: none;">내 주문 정보 보기</a>
    <hr style="width: 80%;">
</div>

<div class="container mt-5">
    <h2>주문 내역</h2>
    <table class="table">
        <thead>
            <tr>
            	<th>주문 고유번호</th>
                <th>주문자 아이디</th>
                <th>주문자 성함</th>
                <th>주문 상품</th>
                <th>주문 수량</th>
                <th>주문 금액</th>
                <th>주문 취소하기</th>
            </tr>
        </thead>
        <tbody>
            <% for (OrderBean ob : orderList) { %>
                <tr>
                	<td><%= ob.getOrderid() %></td>
                    <td><%= ob.getMid() %></td>
                    <td><%= ob.getMname() %></td>
                    <td><%= ob.getPname() %></td>
                    <td><%= ob.getOqty() %></td>
                    <td><%= ob.getAmount() %></td>
                    <td>
                        <form action="cancelOrder.jsp" method="post">
                            <input type="hidden" name="orderid" value="<%= ob.getOrderid() %>">
                            <button type="submit" class="btn btn-danger">주문 취소</button>
                        </form>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%@include file="mallbottom.jsp" %>
