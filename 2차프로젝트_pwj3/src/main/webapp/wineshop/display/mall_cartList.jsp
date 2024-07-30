<%@page import="wine.shop.ProductBean"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<jsp:useBean id="mallCart" class="wine.shop.mall.CartBean"
	scope="session" />

<%@ include file="malltop.jsp"%>
<%
    String saveFolder = "/wineshop/wineimages";
    String requestFolder = request.getContextPath()+"/"+saveFolder;
    Vector<ProductBean> clists = mallCart.getAllProducts();
    DecimalFormat df = new DecimalFormat("###,###"); 
%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<div class="container">
	<div class="row justify-content-center">
		<div class="col-md-10">
			<div class="card">
				<div class="card-header bg-dark text-white">
					<h4 class="mb-0">장바구니 보기</h4>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered table-hover text-center">
							<thead class="bg-primary text-white">
								<tr>
									<th width="10%">번호</th>
									<th width="20%">상품명</th>
									<th width="20%">수량</th>
									<th width="20%">단가</th>
									<th width="20%">금액</th>
									<th width="10%">삭제</th>
								</tr>
							</thead>
							<tbody>
								<% 
                                if(clists != null && !clists.isEmpty()){ // 장바구니에 상품이 있는 경우
                                    int cartTotalPrice = 0;                     
                                    int cartTotalPoint = 0;
                                    for(ProductBean pb : clists){
                                        String fullPath = requestFolder +"/"+pb.getPimage();
                                %>
								<tr>
									<td><%=pb.getPnum()%></td>
									<td class="text-left"><img src="<%=fullPath%>" width="40"
										height="40" class="mr-2"> <b><%=pb.getPname()%></b></td>
									<td>
										<form id="form_<%=pb.getPnum()%>" method="post"
											action="mall_cartEdit.jsp">
											<input type="hidden" name="pnum" value="<%=pb.getPnum()%>">
											<input type="text" id="oqty_<%=pb.getPnum()%>" name="oqty"
												value="<%=pb.getPqty()%>" size="2" class="form-control">개
											<button type="button"
												onclick="submitForm('<%=pb.getPnum()%>')">수정</button>
										</form>
									</td>

									<td><%=df.format(pb.getPrice())%>원<br>[<%=df.format(pb.getPoint())%>]point</td>
									<td><%=df.format(pb.getPrice()*pb.getPqty())%>원<br>[<%=df.format(pb.getPoint()*pb.getPqty())%>]point</td>
									<td><a href="mall_cartDel.jsp?pnum=<%=pb.getPnum()%>"
										class="btn btn-sm btn-danger">삭제</a></td>
								</tr>
								<%      
                                    cartTotalPrice += pb.getPrice()*pb.getPqty();
                                    cartTotalPoint += pb.getPoint()*pb.getPqty();
                                }//for
                                %>
								<tr class="bg-primary text-white">
									<td colspan="4" class="text-right"><b>장바구니 총액 :</b></td>
									<td colspan="2"><%=df.format(cartTotalPrice) %>원<br>[<%=df.format(cartTotalPoint) %>]point</td>
								</tr>
								<tr>
									<td colspan="6" class="text-center"><a
										href="mall_order.jsp" class="btn btn-lg btn-success">주문하기</a>
										<a href="<%=contextPath%>/wineshop/display/mall.jsp"
										class="btn btn-lg btn-secondary">계속 쇼핑</a></td>
								</tr>
								<%           
                                } else { // 장바구니에 상품이 없는 경우
                                %>
								<tr>
									<td colspan="6" class="text-center">장바구니에 등록된 상품이 없습니다.</td>
								</tr>
								<% } %>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="mallbottom.jsp"%>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<script>
    function submitForm(pnum) {
        var formId = "form_" + pnum;
        var qty = document.getElementById("oqty_" + pnum).value;
        document.getElementById(formId).submit();
    }
</script>

