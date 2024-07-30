<%@page import="java.util.Vector"%>
<%@page import="wine.shop.mall.OrdersDao"%>
<%@page import="wine.shop.mall.OrderBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="top.jsp" %>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <h5 class="card-header">주문 내역 조회 결과</h5>
                <div class="card-body">
                    <div class="mb-3">
                        <form action="adminOrderList.jsp" method="get">
                            <div class="input-group">
                                <input type="text" class="form-control" id="customerId" name="customerId" placeholder="고객 ID 입력" required>
                                <div class="input-group-append">
                                    <button type="submit" class="btn btn-primary">조회하기</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <% 
                        String customerId = request.getParameter("customerId");
                        if (customerId != null && !customerId.isEmpty()) {
                            OrdersDao orderDao = OrdersDao.getInstance();
                            Vector<OrderBean> orderList = orderDao.getOrderList2(customerId);
                    %>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>주문 고유번호</th>
                                    <th>주문자 아이디</th>
                                    <th>주문자 성함</th>
                                    <th>주문 상품</th>
                                    <th>주문 수량</th>
                                    <th>주문 금액</th>
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
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                    <% } else { %>
                    <p class="text-center">고객 ID를 입력해주세요.</p>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="bottom.jsp" %>
