<%@page import="wine.shop.CategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<%@include file="up_main.jsp" %>

<%
    CategoryDao cDao = CategoryDao.getInstance();
    ArrayList<CategoryBean> clist = cDao.getAllCategory();
    
%>
<style>
	label{
		color : white;
		font-weight: bold;
	}
</style>
<div align="center" style="max-width: 50%; margin: 0 auto; background-color:#3c4c52; padding: 20px; border-radius: 10px; box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);">
    <h2 style="text-align: center; color: white;">상품 등록</h2>
    <form action="iupProc.jsp" method="post" enctype="multipart/form-data" style="background-color: ">
        <div style="margin-bottom: 20px;">
            <label for="upcategory" style="font-weight: bold;">카테고리</label><br>
            <select name="upcategory" id="upcategory" style="margin-left: 10px; padding: 8px; border-radius: 5px; border: 1px solid #ccc;">
                <% 
                if(clist.isEmpty()) {
                %>
                <option>카테고리 없음</option>
                <% 
                } else {
                    for(CategoryBean cb : clist) {
                %>
                <option value="<%=cb.getCode()%>"> <%=cb.getCname()%>[<%=cb.getCode()%>]</option>
                <% 
                    }
                }
                %>
            </select>
        </div>
        
         <div style="margin-bottom: 20px;">
            <label for="title" style="font-weight: bold;">글제목</label><br>
            <input type="text" name="title" id="title" style="margin-left: 10px; padding: 8px; border-radius: 5px; border: 1px solid #ccc;">
        </div>
        
         <div style="margin-bottom: 20px;">
            <label for="pname" style="font-weight: bold;">판매자명</label><br>
            <input type="text" name="username" id="username" value="<%=mname%>" style="margin-left: 10px; padding: 8px; border-radius: 5px; border: 1px solid #ccc;">
        </div>
        
        <div style="margin-bottom: 20px;">
            <label for="pname" style="font-weight: bold;">상품명</label><br>
            <input type="text" name="upname" id="upname" style="margin-left: 10px; padding: 8px; border-radius: 5px; border: 1px solid #ccc;">
        </div>
        
        
        <div style="margin-bottom: 20px;">
            <label for="pimage" style="font-weight: bold; ">상품 이미지</label><br>
            <input type="file" name="upimage" id="upimage" style="margin-left: 10px;">
        </div>
        
        
        <div style="margin-bottom: 20px;">
            <label for="price" style="font-weight: bold; ">상품 가격</label><br>
            <input type="text" name="uprice" id="uprice" style="margin-left: 10px; padding: 8px; border-radius: 5px; border: 1px solid #ccc;">
        </div> 
        
        
        <div style="margin-bottom: 20px;">
            <label for="pcontents" style="font-weight: bold;">상품 소개</label><br>
            <textarea name="upcontents" id="upcontents" rows="3" cols="25" style="margin-left: 10px; padding: 8px; border-radius: 5px; border: 1px solid #ccc;"></textarea>
        </div>
        
        
		  <div style="margin-bottom: 20px;">
            <label for=palch style="font-weight: bold; ">판매자 위치</label><br>
            <input type="hidden" name="uaddr" value="<%=msubaddr%>">
            <%@ include file="../../index.jsp"%>
        </div>
        

        <div style="text-align: center;">
            <input type="submit" class ="button" value="상품 등록" style="padding: 10px 20px; border: none; border-radius: 5px; background-color: #2d59fa; color: #fff; cursor: pointer; transition: background-color 0.3s;">
            <input type="reset" class ="button" value="취소" style="padding: 10px 20px; border: none; border-radius: 5px; background-color: #2d59fa; color: #fff; cursor: pointer; transition: background-color 0.3s; margin-left: 10px;">
        </div>
        
        
    </form>
</div>