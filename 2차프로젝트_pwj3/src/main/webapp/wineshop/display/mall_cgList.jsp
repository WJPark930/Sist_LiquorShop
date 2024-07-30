<%@page import="wine.shop.ProductBean"%>
<%@page import="wine.shop.ProductDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="malltop.jsp"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>


<%
    request.setCharacterEncoding("UTF-8");
    DecimalFormat df = new DecimalFormat("###,###");

    String code = request.getParameter("code");
    String cname = request.getParameter("cname");
    
   // System.out.println("mall_top에서 넘어오는 code : " + code);
   // System.out.println("mall_top에서 넘어오는 cname : " + cname);
    
    ProductDao pdao = ProductDao.getInstance();
    ArrayList<ProductBean> plists = pdao.selectByCategory(code);
%>

<div class="m1" style="text-align: center;">
    <h3 style="color: #661b5b;">주류 구매하기</h3>
    <hr color="black" style="width: 80%; margin-left: auto; margin-right: auto;">
    <p style="color: #661b5b; font-size: 18px;"><strong><%= cname %></strong></p>
    <hr color="black" style="width: 80%; margin-left: auto; margin-right: auto;">
</div>


<br>
<div class="container">
    <% if(plists.size() == 0) { %>
        <div class="row justify-content-center">
            <div class="col-md-6 text-center">
                <img src="../../images/컨텐츠준비중.png" class="img-fluid" alt="컨텐츠 준비 중">
            </div>
        </div>
    <% } else { %>
        <div class="row row-cols-1 row-cols-md-3 g-4">
            <% for (ProductBean pb : plists) { %>
                <div class="col">
                    <div class="card h-100">
                        <a href="mall_prodView.jsp?pnum=<%= pb.getPnum() %>">
                            <img src="<%= request.getContextPath() + "/wineshop/wineimages/" + pb.getPimage() %>" class="card-img-top" alt="<%= pb.getPname() %>" height="350" width="250">
                        </a>
                        <div class="card-body">
                            <h5 class="card-title"><%= pb.getPname() %></h5>
                            <p class="card-text">
                                <font color="red"><%= df.format(pb.getPrice())%></font>원<br> 
                                <font color="blue">[<%= df.format(pb.getPoint())%>]</font>point
                            </p>
                        </div>
                    </div>
                </div>
            <% } %>
        </div>
    <% } %>
</div>

<%@ include file="mallbottom.jsp"%>
