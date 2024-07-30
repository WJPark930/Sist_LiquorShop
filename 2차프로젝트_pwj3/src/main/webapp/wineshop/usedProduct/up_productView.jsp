<%@page import="up.shop.UsedProdDao"%>
<%@page import="up.shop.UsedProdDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<%@include file="up_main.jsp" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<%
    request.setCharacterEncoding("UTF-8");
    DecimalFormat df = new DecimalFormat("###,###");

    String addr = request.getParameter("addr");

    UsedProdDao pdao = UsedProdDao.getInstance();
    ArrayList<UsedProdDTO> plists = pdao.selectByAddr(addr); 
%>

<div align="center" style="color: #2d59fa; font-size: 30px; font-weight: bold;">
    <%= addr %>의 주요 상품입니다.
</div>
<br><br>
<div class="container">
    <% if(plists.size() == 0) { %>
        <div class="row justify-content-center">
            <div class="col-md-6 text-center">
                <img src="../../images/컨텐츠준비중.png" class="img-fluid" alt="컨텐츠 준비 중">
            </div>
        </div>
    <% } else { %>
        <div class="row row-cols-1 row-cols-md-3 g-4">
            <% for (UsedProdDTO up : plists) { %>
                <div class="col">
                    <div class="card h-100">
                        <a href="up_prodView.jsp?pnum=<%= up.getUpnum() %>">
                            <img src="<%= request.getContextPath() + "/wineshop/upimage/" + up.getUpimage() %>" class="card-img-top" alt="<%= up.getUpname() %>" height="350" width="250">
                        </a>
                        <div class="card-body">
                            <h5 class="card-title"><%= up.getTitle()%></h5>
                            <h5 class="card-title"><%= up.getUpname() %></h5>
                            <p class="card-text">
                                <font color="blue"><%= df.format(up.getUprice())%></font>원<br> 
                            </p>

                        </div>
                    </div>
                </div>
            <% } %>
        </div>
    <% } %>
</div>


