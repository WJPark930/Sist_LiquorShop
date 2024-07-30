
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="up.shop.UsedProdDao"%>
<%@page import="up.shop.UsedProdDTO"%>
<!DOCTYPE html>
<html lang="ko">

<%@include file="up_main.jsp"%>

<style>
.product-details {
	text-align: center;
	max-width: 600px;
	margin: 20px auto;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.product-title {
	margin-bottom: 20px;
	color: #333;
}

.product-image {
	max-width: 100%;
	height: auto;
	border-radius: 8px;
}

.product-info p {
	margin: 10px 0;
	color: #666;
}

.price {
	font-weight: bold;
	color: #E53935;
}

.category, .content {
	text-align: left;
	display: inline-block;
	width: 100%;
}
</style>


<%
    request.setCharacterEncoding("UTF-8");
    
    String pnum = request.getParameter("pnum");
    session.setAttribute("upnum", pnum); //게시판에 사용하기 위한 upnum
    UsedProdDao pdao = UsedProdDao.getInstance();
    UsedProdDTO pd = pdao.selectByPnum(pnum);  
%>

<div class="product-details">
	<h2 class="product-title"><%= pd.getUpname() %>
		상세 정보
	</h2>
	<img class="product-image"
		src="<%= request.getContextPath() + "/wineshop/upimage/" + pd.getUpimage() %>"
		alt="<%= pd.getUpname() %>">
	<div class="product-info">
		<p class="price">
			가격:
			<%= pd.getUprice() %>원
		</p>
		<p class="category">
			카테고리:
			<%= pd.getUpcategory() %></p>
		<p class="content">
			내용:
			<%= pd.getUpcontents() %></p>
	</div>

	<div style="margin-bottom: 20px;" align="center">
		<label for=palch style="font-weight: bold;">판매자 위치</label><br> <input
			type="hidden" name="uaddr" value="<%=msubaddr%>">
		<%@ include file="../../index.jsp"%>
	</div>
</div>




<br>

<jsp:include page="list.jsp">
	<jsp:param name="upnum" value="<%= pnum %>" />
</jsp:include>

<br>
<br>
<div align="center">
		<h3>구매 문의하기</h3>
		<form action="writeProc.jsp?upnum=<%= pnum %>" method="post">
			<table border="1" width="500">

				<tr>
					<th>이름</th>
					<td><input type="text" name="writer" maxlength="10" value="<%=mname%>"></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="subject"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="content" rows="5" cols="50"></textarea></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="text" name="passwd"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="글쓰기"></td>
				</tr>
			</table>
		</form>
	</body>
</div>



</html>
