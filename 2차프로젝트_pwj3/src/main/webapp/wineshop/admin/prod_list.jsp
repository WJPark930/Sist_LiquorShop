<%@page import="wine.shop.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="wine.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="top.jsp" %>

<script type="text/javascript">
    function checkDel(pnum, pimage) {
        var check = confirm('정말 삭제하겠습니까?');
        if (check == true) {
            location.href = "prod_delete.jsp?pnum=" + pnum + "&pimage=" + pimage;
        } else {
            location.href = "prod_list.jsp";
        }
    }
</script>

<style>
    th {
        color: white;
    }
    
    tr,th,td{
    	margin : auto;
    }
</style>

<div align="center">
    <table width="80%" class="outline" border="1">
        <tr bgcolor="#803673">
            <th>번호</th>
            <th>상품 코드</th>
            <th>상품명</th>
            <th>당도</th>
            <th>도수</th>
            <th>이미지</th>
            <th>가격</th>
            <th>제조사</th>
            <th>수량</th>
            <th>수정|삭제</th>
        </tr>
        <% 
            ProductDao pdao = ProductDao.getInstance();
            ArrayList<ProductBean> plist = pdao.getAllProduct(); 
            if (plist.size() == 0) { 
        %>
        <tr>
            <td colspan="8">등록된 상품이 없습니다.</td>
        </tr>
        <% } else { 
            for (ProductBean pb : plist) { 
                String requestDir = request.getContextPath() + "/wineshop/wineimages"; 
        %>
        <tr>
            <td><%= pb.getPnum() %></td>
            <td><%= pb.getPcategory_fk() %></td>
            <td><%= pb.getPname() %></td>
            <td><%= pb.getPsweet() %></td>
            <td><%= pb.getPalch() %></td>
            <td>
                <a href="prod_view.jsp?pnum=<%= pb.getPnum() %>">
                    <img src="<%= requestDir + "/" + pb.getPimage() %>" width="30" height="30">
                </a>
            </td>
            <td><%= pb.getPrice() %></td>
            <td><%= pb.getPcompany() %></td>
            <td><%= pb.getPqty() %></td>
            <td >
                <a href="prod_update.jsp?pnum=<%= pb.getPnum() %>"> 수정 </a> |
                <a href="javascript:checkDel('<%= pb.getPnum() %>','<%= pb.getPimage() %>')"> 삭제 </a>
            </td>
        </tr>
        <% } 
        } %>
    </table>
</div>

<%@ include file="bottom.jsp" %>
