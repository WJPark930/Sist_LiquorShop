<%@page import="java.text.DecimalFormat"%>
<%@page import="wine.shop.ProductBean"%>
<%@page import="wine.shop.ProductDao"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<jsp:useBean id="mallCart" class="wine.shop.mall.CartBean" scope="session" />
<%@ include file="malltop.jsp" %>

<%
    int totalPrice = 0;
    int totalQuantity = 0;
    DecimalFormat df = new DecimalFormat("###,###");
    try {
        String pnum = request.getParameter("pnum"); 
        String oqty = request.getParameter("oqty"); 
        
        if (pnum != null && oqty != null) {
            mallCart.addProduct(pnum, oqty); 
        }

        ProductDao pdao = ProductDao.getInstance();
        Vector<ProductBean> plist = mallCart.getAllProducts();
        

        for (ProductBean pb : plist) {
            totalPrice += pb.getPrice() * pb.getPqty();
            totalQuantity += pb.getPqty();
        }

        request.setAttribute("totalPrice", totalPrice);
        request.setAttribute("totalQuantity", totalQuantity);
        request.setAttribute("productList", plist);
    } catch (Exception e) {
        request.setAttribute("errorMessage", "Error processing your request: " + e.getMessage());
    }
%>

<div class="container mt-5">
    <h2 class="text-center mb-4">결제 내역서 보기</h2>
    <div class="table-responsive">
        <table class="table table-bordered text-center">
            <thead class="bg-primary text-white">
                <tr>
                    <th style="background-color: #902c91; color: fff; font-weight: bold;">상품명</th>
                    <th style="background-color: #902c91; color: fff; font-weight: bold;">수량</th>
                    <th style="background-color: #902c91; color: fff; font-weight: bold;">금액</th>
                </tr>
            </thead>
            <tbody>
                <% 
                Vector<ProductBean> productList = (Vector<ProductBean>) request.getAttribute("productList");
                if (productList == null || productList.isEmpty()) {
                %>
                    <tr>
                        <td colspan="3" class="text-center">장바구니에 담긴 상품이 없습니다.</td>
                    </tr>
                <% } else {
                    for (ProductBean pb : productList) {
                %>
                    <tr>
                        <td><%= pb.getPname() %></td>
                        <td><%= pb.getPqty() %></td>
                        <td><%= df.format(pb.getPrice() * pb.getPqty()) %>원</td>
                    </tr>
                <% 
                    }
                } 
                %>
                <tr class="bg-primary text-white">
                	<td></td>
                    <td class="text-center"><b>총 수량:</b> <%= totalQuantity %></td>
                    <td class="text-center"><b>총 금액:</b> <%= df.format(totalPrice) %>원</td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="text-center">
        <input type="button" class="btn btn-success" value="내 카드로 즉시 결제하기" onclick="location.href='mall_calculate.jsp'"/>
    </div>
</div>

<%@ include file="mallbottom.jsp" %>
