<%@page import="wine.shop.CategoryDao"%>
<%@page import="wine.shop.CategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="top.jsp" %>  

<%
CategoryDao cdao = CategoryDao.getInstance();
%>

<style>
	.m1{
		color : white;
	}
</style>

<div style="max-width: 600px; margin: 0 auto;" align="center">
    <h2 style="text-align: center;">카테고리 목록</h2>
    <ul style="list-style: none; padding: 0;">
        <% 
        ArrayList<CategoryBean> clist = cdao.getAllCategory();  
        if (clist.isEmpty()) {
        %>
        <li style="text-align: center;">등록된 카테고리가 없습니다.</li>
        <% 
        } else {
            for(CategoryBean category : clist) {
        %>
        <li style="margin-bottom: 10px; border: 1px solid #ccc; padding: 10px; background-color: #803673">
            <div class="m1"><b>번호:</b> <%= category.getCnum() %></div>
            <div class="m1"><b>카테고리 코드:</b> <%= category.getCode() %></div>
            <div class="m1"><b>카테고리명:</b> <%= category.getCname() %></div>
            <div style="margin-top: 5px;">
                <a href="cate_delete.jsp?cnum=<%= category.getCnum() %>" style="color: white;">삭제</a>
            </div>
        </li>
        <% 
            }
        }
        %>
    </ul>
</div>

<%@ include file="bottom.jsp" %>
