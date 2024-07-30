
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

mart_cartList.jsp(pnum을 가지고 삭제버튼)=>mart_cartDel.jsp

<jsp:useBean id="mallCart" class="wine.shop.mall.CartBean" scope="session" />

<%
	String pnum = request.getParameter("pnum");
	//System.out.print("mart_cartList에서 넘어온 pnum : " + pnum);

	mallCart.removeProduct(pnum);
%>
<script>
	alert("삭제 성공");
	location.href="mall_cartList.jsp";
</script>