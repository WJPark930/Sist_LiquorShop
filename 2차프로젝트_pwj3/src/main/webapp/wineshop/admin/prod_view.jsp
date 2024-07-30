<%@page import="wine.shop.ProductBean"%>
<%@page import="wine.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


<%@ include file="top.jsp"%>

<style type="text/css">
#table1 {
	vertical-align: top;
	width: 65%;
}
.outline {
	border-collapse: collapse;
}

.outline th, .outline td {
	border: 1px solid #000;
	padding: 5px;
}

.m2{
	background-color: #5e2a55;
	color : white;
}

.submit-btn {
	text-align: center;
	background-color: #5e2a55;
	color : white;
}
</style>
<%
	String pnum = request.getParameter("pnum");
	//System.out.println("prod_view.jsp pnum:" + pnum);
	ProductDao pdao = ProductDao.getInstance();
	 
	ProductBean pb = pdao.getProductByPnum(pnum);    
%>
<div align="center">
<form action="prod_list.jsp" method="post">
	<table id="table1" class="outline">
		<tr>
			<th class="m2" width="100">카테고리</th>
			<td><%=pb.getPcategory_fk()%></td>
			<th class="m2" width="100">상품번호</th>
			<th><%=pb.getPnum()%></th>
		</tr>
		<tr>
			<th class="m2">상품명</th>
			<th><%=pb.getPname()%></th>
			<th class="m2">제조회사</th>
			<th><%=pb.getPcompany()%></th>
		</tr>
		<tr>
			<th class="m2">상품이미지</th>
			<th colspan="3"><img height="70px" width="70px;"
				src="<%=request.getContextPath()%>/wineshop/wineimages/<%=pb.getPimage()%>">
			</th>
		</tr>
		<tr>
			<th class="m2">상품 수량</th>
			<th><%=pb.getPqty()%></th>
			<th class="m2">상품 가격</th>
			<th><%=pb.getPrice()%></th>
		</tr>
		<tr>
			<th class="m2">상품 스펙</th>
			<th><%=pb.getPspec()%></th>
			<th class="m2">상품 포인트</th>
			<th><%=pb.getPoint()%></th>
		</tr>
		<tr>
			<th class="m2">상품 소개</th>
			<th colspan="3"><%=pb.getPcontents()%></th>
		</tr>
		<tr>
			<td colspan="4" class="submit-btn">
				<input type="submit" value="돌아가기">
			</td>
		</tr>
	</table>
</form>
</div>
<%@ include file="bottom.jsp"%>
