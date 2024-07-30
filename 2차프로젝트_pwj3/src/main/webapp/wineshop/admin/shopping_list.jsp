<%@page import="java.util.Vector"%>
<%@page import="wine.shop.mall.OrdersDao"%>
<%@page import="wine.shop.mall.OrderBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="top.jsp" %>  


<div class="container mt-5">
    <h2>전체 주문 내역</h2>
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
            <% 
                OrdersDao orderDao = OrdersDao.getInstance();
                Vector<OrderBean> orderList = orderDao.getAllOrderList();
                for (OrderBean ob : orderList) { 
            %>
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

<%@ include file="bottom.jsp" %>  
