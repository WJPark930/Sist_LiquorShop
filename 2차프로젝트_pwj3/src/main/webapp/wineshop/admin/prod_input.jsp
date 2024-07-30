<%@page import="wine.shop.CategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="wine.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="top.jsp" %>

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
<div align="center" style="max-width: 500px; margin: 0 auto; background-color:#803673; padding: 20px; border-radius: 10px; box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);">
    <h2 style="text-align: center; color: white;">상품 등록</h2>
    <form action="prod_proc.jsp" method="post" enctype="multipart/form-data" style="background-color: ">
        <div style="margin-bottom: 20px;">
            <label for="pcategory_fk" style="font-weight: bold;">카테고리</label><br>
            <select name="pcategory_fk" id="pcategory_fk" style="margin-left: 10px; padding: 8px; border-radius: 5px; border: 1px solid #ccc;">
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
            <label for="pname" style="font-weight: bold;">상품명</label><br>
            <input type="text" name="pname" id="pname" style="margin-left: 10px; padding: 8px; border-radius: 5px; border: 1px solid #ccc;">
        </div>
        
        <div style="margin-bottom: 20px;">
            <label for="pcode" style="font-weight: bold; ">상품코드</label><br>
            <input type="text" name="pcode" id="pcode" style="margin-left: 10px; padding: 8px; border-radius: 5px; border: 1px solid #ccc;">
        </div>
        
        <div style="margin-bottom: 20px;">
            <label for="pcompany" style="font-weight: bold;">제조회사</label><br>
            <input type="text" name="pcompany" id="pcompany" style="margin-left: 10px; padding: 8px; border-radius: 5px; border: 1px solid #ccc;">
        </div>
        
        <div style="margin-bottom: 20px;">
            <label for="pimage" style="font-weight: bold; ">상품 이미지</label><br>
            <input type="file" name="pimage" id="pimage" style="margin-left: 10px;">
        </div>
        
        <div style="margin-bottom: 20px;">
            <label for="pqty" style="font-weight: bold; ">상품 수량</label><br>
            <input type="text" name="pqty" id="pqty" style="margin-left: 10px; padding: 8px; border-radius: 5px; border: 1px solid #ccc;">
        </div>
        
        <div style="margin-bottom: 20px;">
            <label for="price" style="font-weight: bold; ">상품 가격</label><br>
            <input type="text" name="price" id="price" style="margin-left: 10px; padding: 8px; border-radius: 5px; border: 1px solid #ccc;">
        </div>
        
        <div style="margin-bottom: 20px;">
            <label for="pspec" style="font-weight: bold;">상품 스펙</label><br>
            <select name="pspec" id="pspec" style="margin-left: 10px; padding: 8px; border-radius: 5px; border: 1px solid #ccc;">
                <option value="NORMAL">::NORMAL::</option>
                <option value="HIT">HIT</option>
                <option value="NEW">NEW</option>
                <option value="BEST">BEST</option>
            </select>
        </div>
        
        <div style="margin-bottom: 20px;">
            <label for="pcontents" style="font-weight: bold;">상품 소개</label><br>
            <textarea name="pcontents" id="pcontents" rows="3" cols="25" style="margin-left: 10px; padding: 8px; border-radius: 5px; border: 1px solid #ccc;"></textarea>
        </div>
        
        <div style="margin-bottom: 20px;">
            <label for="psweet" style="font-weight: bold; ">당도</label><br>
          <select name="psweet" id="pspec" style="margin-left: 10px; padding: 8px; border-radius: 5px; border: 1px solid #ccc;">
                <option value="DRY">::DRY::</option>
                <option value="SEMI-DRY">::SEMI-DRY::</option>
                <option value="NORMAL">::NORMAL::</option>
                <option value="SEMI-SWEET">::SEMI-SWEET::</option>
                <option value="SWEET">::SWEET::</option>
            </select>
        </div>
        
        <div style="margin-bottom: 20px;">
            <label for=palch style="font-weight: bold; ">알콜 도수</label><br>
             <input type="text" name="palch" id="palch" style="margin-left: 10px; padding: 8px; border-radius: 5px; border: 1px solid #ccc;">
        </div>
        
        <div style="margin-bottom: 20px;">
            <label for="point" style="font-weight: bold;">상품 포인트</label><br>
            <input type="text" name="point" id="point" style="margin-left: 10px; padding: 8px; border-radius: 5px; border: 1px solid #ccc;">
        </div>
        
         <div style="margin-bottom: 20px;">
            <label for="paddr" style="font-weight: bold;">생산지</label><br>
            <input type="text" name="paddr" id="point" style="margin-left: 10px; padding: 8px; border-radius: 5px; border: 1px solid #ccc;">
        </div>
        
         <div style="margin-bottom: 20px;">
            <label for="pfood" style="font-weight: bold;">페어링 음식</label><br>
            <textarea name="pfood" id="pfood" rows="3" cols="25" style="margin-left: 10px; padding: 8px; border-radius: 5px; border: 1px solid #ccc;"></textarea>
        </div>
        
        <div style="text-align: center;">
            <input type="submit" class ="button" value="상품 등록" style="padding: 10px 20px; border: none; border-radius: 5px; background-color: #5e2a55; color: #fff; cursor: pointer; transition: background-color 0.3s;">
            <input type="reset" class ="button" value="취소" style="padding: 10px 20px; border: none; border-radius: 5px; background-color: #5e2a55; color: #fff; cursor: pointer; transition: background-color 0.3s; margin-left: 10px;">
        </div>
    </form>
</div>

<%@ include file="bottom.jsp" %>
