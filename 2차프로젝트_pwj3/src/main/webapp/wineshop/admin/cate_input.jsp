<%@page import="wine.shop.ProductBean"%>
<%@page import="wine.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>



<%@ include file="top.jsp" %>  

<style>

	.button:hover{
		background-color:#661b5b;
		color : white;
		font-weight: bold;
	}
	
		.botton{
		background-color: #70556b;
		color:white;
		font-weight: bold;
	}
</style>

<div align="center">
    <form action="cate_proc.jsp" method="post" name="cform" style="max-width: 400px; margin: 0 auto;">
        <h2>카테고리 등록</h2>
        <div style="margin-bottom: 15px;">
            <label for="code">카테고리 코드</label><br>
            <input type="text" id="code" name="code" style="width: 60%;">
        </div>
        <div style="margin-bottom: 15px;">
            <label for="cname">카테고리 이름</label><br>
            <input type="text" id="cname" name="cname" style="width: 60%;">
        </div>
        <div >
            <input type="submit" class="button" value="등록" style="width: 100%;">
            <input type="reset" class="button" value="취소" style="width: 100%; margin-top: 10px;">
        </div>
    </form>
</div>

<%@ include file="bottom.jsp" %> 
