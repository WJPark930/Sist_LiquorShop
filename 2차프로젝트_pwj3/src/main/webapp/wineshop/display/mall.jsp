<%@page import="java.text.DecimalFormat"%>
<%@page import="wine.shop.ProductBean"%>
<%@page import="wine.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<style>
    .slide{
        margin: auto;
    }
    
    .carousel-item img {
        object-fit: cover; 
        width: 100%; 
        height: 100%; 
    }

    .product-list {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 20px;
        margin-top: 20px;
    }

    .product-item {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: center;
        max-width: 200px;
        display: flex;
        flex-direction: column;
    }

    .product-item a {
        text-decoration: none;
        color: #333;
    }

    .product-thumbnail {
        max-width: 100%;
        height: auto;
        margin-bottom: auto;
    }

    .product-details {
        margin-top: auto;
    }

    .product-name {
        font-size: 16px;
        font-weight: bold;
        margin-bottom: 5px;
    }

    .product-price {
        font-size: 14px;
    }
</style>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<%@ include file="malltop.jsp" %>  
    
    <!-- 슬라이드 화면 섹션 -->
    <section class="slide" style="width:100%; height: 250px;">
        <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                
                <div class="carousel-item" data-bs-interval="3000">
                    <a href="#"><img src="../../images/유러피안와인.jpg" class="d-block w-100" alt="..."></a>
                    <!-- 여기는 와인 취향 테스트 하는 페이지 만들어서 보내기 -->
                </div>
                
                <div class="carousel-item active" data-bs-interval="3000">
                    <a href="mall_cgList.jsp?code=acs&cname=주류%20악세사리"> <img src="../../images/센소리.png" class="d-block w-100" alt="..."></a>
                </div>
                <!-- 여기는 센소리 와인잔 상세 페이지로 바로 넘어가도록 -->
                
                <div class="carousel-item" data-bs-interval="3000">
                    <a href="mall_cgList.jsp?code=bourbon&cname=버번위스키"><img src="../../images/버번위스키.jpg" class="d-block w-100" alt="..."></a>
                </div>
                <!-- 카테고리 버번위스키 클릭하면 나오는 페이지로 이동 -->
                
                <div class="carousel-item" data-bs-interval="3000">
                    <a href="#"><img src="../../images/와인전시회.jpg" class="d-block w-100" alt="..."></a>
                </div>
                <!-- 메이커스마크 상세페이지로 바로 이동 -->
                
                <div class="carousel-item" data-bs-interval="3000">
                    <a href="#"><img src="../../images/키안티.png" class="d-block w-100" alt="..."></a>
                </div>
                <!-- 메이커스마크 상세페이지로 바로 이동 -->
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </section>
    
    <!-- 베스트 상품 섹션 -->
    <br><br><hr><br><br>
    <div class="best1" align="center">
        <p><h2>이달의 BEST 상품 구경하기</h2></p>
    </div>
    <section class="product-list" align="center">
        <% 
            String requestDir = request.getContextPath() + "/wineshop/wineimages"; 
            ProductDao pdao = ProductDao.getInstance();
            ArrayList<ProductBean> bestProducts = pdao.getBestProducts(); 
            DecimalFormat df = new DecimalFormat("###,###");
            
            for (ProductBean pb : bestProducts) { 
        %>
        <div class="product-item" align="center">
            <a href="mall_prodView.jsp?pnum=<%=pb.getPnum()%>">
                <img src="<%= requestDir + "/" + pb.getPimage() %>" class="product-thumbnail" alt="<%= pb.getPname() %>">
                <div class="product-details">
                    <div class="product-name"><%= pb.getPname() %></div>
                    <div class="product-price">가격:<%= df.format(pb.getPrice()) %> 원</div>
                </div>
            </a>
        </div>
        <% } %>
    </section>
    

<%@ include file="mallbottom.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
