<%@page import="wine.shop.CategoryDao"%>
<%@page import="up.shop.UsedProdDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="up.shop.UsedProdDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%@include file="upmalltop.jsp" %>


<%
    request.setCharacterEncoding("UTF-8");
    DecimalFormat df = new DecimalFormat("###,###");
    //System.out.println("중고플랫폼에서 넘어온 mname : " + mname);
    UsedProdDao pdao = UsedProdDao.getInstance();
    ArrayList<UsedProdDTO> plists = pdao.selectByMname(mname); 
   // System.out.println(mname  + " 으로 작성된 게시글의 상품명");
%>

<html>
<head>
    <title>마이페이지</title>
</head>
<body>


<hr>
<br>
<h1 align="center">마이페이지 - <span style="color: blue"><%= mname %></span>님의 상품 목록</h1><br>

<table border="1" align="center" style="width: 45%">
    <tr>
        <th>상품 번호</th>
        <th>상품명</th>
        <th>가격</th>
        <th>거래 완료</th>
        <th>수정</th>
        <th>삭제</th>
    </tr>
    <% for (UsedProdDTO product : plists) { %>
    <tr>
        <td><%= product.getUpnum() %></td>
        <td><a href="up_prodView.jsp?pnum=<%= product.getUpnum() %>"><%= product.getUpname() %></a></td>
        <td><%= df.format(product.getUprice()) %></td>
        <td><a href="DealProduct.jsp?upnum=<%= product.getUpnum() %>">거래 완료</a></td>
        <td><a href="updateProduct.jsp?upnum=<%= product.getUpnum() %>">수정</a></td>
        <td><a href="deleteProduct.jsp?upnum=<%= product.getUpnum() %>">삭제</a></td>
    </tr>
    <% } %>
</table>

</body>
</html>


<script>
function redirectToPage() {
    var url = 'up_main.jsp';
    window.location.href = url;
}
</script>
