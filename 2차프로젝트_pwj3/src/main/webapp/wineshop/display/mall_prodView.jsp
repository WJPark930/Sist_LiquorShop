<%@page import="java.text.DecimalFormat"%>
<%@page import="wine.shop.ProductBean"%>
<%@page import="wine.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="malltop.jsp"%>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script type="text/javascript">
function goCart(pnum) {
    oqty = document.f.oqty.value;
    if (oqty == "" || oqty < 1) { 
        alert('수량 누락 또는 1보다 작은 수 입력했습니다.');
        location.href="mall.jsp";
        return; 
    }
    location.href="<%=request.getContextPath()%>/wineshop/display/mall_cartAdd.jsp?pnum="+pnum+"&oqty="+oqty;
}

function goOrder(pnum) {
    oqty = document.f.oqty.value; 
    location.href="<%=request.getContextPath()%>/wineshop/display/mall_order.jsp?pnum="
        + pnum + "&oqty=" + oqty; 
}
</script>



<%
request.setCharacterEncoding("UTF-8");

int pnum = Integer.parseInt(request.getParameter("pnum"));
//System.out.println(pnum);

ProductDao pdao = ProductDao.getInstance();

ProductBean pb = pdao.getProductByPnum(String.valueOf(pnum));
DecimalFormat df = new DecimalFormat("###,###"); 
%>

<div class="container">
	<div class="row justify-content-center">
		<div class="col-md-8">
			<table class="table table-bordered">
				<tr>
					<td colspan="2" class="text-center"
						style="background-color: #902c91; color: white;">[<%=pb.getPname()%>]
						상품 정보
					</td>
				</tr>

				<tr>
					<td class="text-center"><img
						src="../wineimages/<%=pb.getPimage()%>" width="800" height="800"
						class="img-fluid" alt="Product Image"></td>
					<td class="align-middle text-center">
						<form name="f" method="post">

							<div class="form-group">
								상품이름:
								<%=pb.getPname()%>
							</div>
							<br>

							<div class="form-group">
								도수:
								<%=pb.getPalch()%>
							</div>
							<br>
							<div class="form-group">
								당도:
								<%=pb.getPsweet()%>
							</div>
							<br>
							<div class="form-group">
								상품 가격:
								<%= df.format(pb.getPrice()) %> 원
							</div>
							<br>
							<div class="form-group">
								상품포인트:
								<%=df.format(pb.getPoint())%> 
							</div>
							<br>
							<div class="form-group">
								상품갯수: <input type="text" name="oqty" value="1" maxlength="5"
									size="5" class="form-control">
							</div>
							<br>
							<%
							boolean isLoggedIn = (memid != null);
							%>

							<div class="form-group">
								<%
								if (isLoggedIn) {
								%>
								<button type="button" class="btn btn-primary"
									onclick="goCart('<%=pb.getPnum()%>')">장바구니 담기</button>
								<br>
								<br>
								<button type="button" class="btn btn-success"
									onclick="goOrder('<%=pb.getPnum()%>')">주문하기</button>
								<%
								} else {
								%>
								<a href="../../login.jsp" class="btn btn-primary">로그인 후 이용하기</a>
								<%
								}
								%>
							</div>

						</form>
					</td>

				</tr>
				<tr>
					<td colspan="2">
						<div class="text-center">
							<b>상품 상세 설명</b><br>
							<%=pb.getPcontents()%>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="text-center">
							<b>페어링 음식</b><br>
							<%=pb.getPfood()%>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>

<%@include file="mallbottom.jsp"%>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
