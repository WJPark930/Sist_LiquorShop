<!DOCTYPE html>
<%@page import="wine.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">

<style>
input[type="submit"] {
    background-color: #2a6bf7;
}
</style>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>중고거래 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
         .fixed-button {
            position: fixed;
            bottom: 100px; 
            right: 100px; 
            z-index: 1000; 
           	size: 500px;
        }
    </style>
</head>
<body>

<%
CategoryDao cdao = CategoryDao.getInstance();
String contextPath = request.getContextPath();
String memid = (String)session.getAttribute("memid");
String mname = (String)session.getAttribute("mname");
String msubaddr = (String)session.getAttribute("msubaddr");

//System.out.println("로그인 세션으로 넘어오는 msubaddr : " + msubaddr);
%>

<header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="up_main.jsp">중고 거래 커뮤니티</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="../display/mall.jsp">쇼핑몰로 이동하기</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="myPage.jsp?memid=<%= memid %>">내가 쓴 글 보기</a>
                    </li>

                </ul>
                
                <div style="color: white;">
                	<%=memid%>님, 반갑습니다!<br>
                	나의 동네 : <%=msubaddr%>
                </div>
                
                <div>
                	<a href="../../login3.jsp">로그인</a> |  
                	<a href="../../logout.jsp">로그아웃</a>
                </div>
            </div>
        </div>
    </nav>
</header>

<br>
<section style="display: flex; justify-content: center;">
    <div class="bg-image" style="height: 30vh; width:30%; background-image: url('../../images/중고거래.jpg'); background-size: cover; background-position: center; cursor: pointer;" onclick="redirectToPage()">
    </div>
</section>
<br>