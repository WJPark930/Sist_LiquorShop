<%@page import="wine.shop.ProductBean"%>
<%@page import="wine.shop.ProductDao"%>
<%@page import="wine.shop.CategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="wine.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

     <%@ include file="top.jsp" %> 
     
<%
String pnum = request.getParameter("pnum");
//System.out.println("prod_list.jsp에서 넘어오는 pnum:" + pnum);
ProductDao pdao = ProductDao.getInstance();

ProductBean pb = pdao.getProductByPnum(pnum); 
%>

<style>
	label{
		color : white;
	}
</style>
<div align="center" style="max-width: 500px; margin: 0 auto; background-color: #803673; padding: 20px; border-radius: 10px; box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);">
    <h2 style="text-align: center; color:white;">상품 수정</h2>
    <form action="prod_updateProc.jsp" method="post" enctype="multipart/form-data">
        <div style="margin-bottom: 20px;">
            <label for="pcategory_fk" style="font-weight: bold;">카테고리</label><br>
            <input type="text" value="<%=pb.getPcategory_fk()%>" name="pcategory_fk" disabled>
				<input type="hidden" name="pcategory_fk" value="<%=pb.getPcategory_fk()%>">
        </div>
        
          <div style="margin-bottom: 20px;">
            <label for="pname" style="font-weight: bold;">상품번호</label><br>
       		<input type="text" name="pnum" value="<%= pb.getPnum() %>" disabled="disabled">
       		<input type="hidden" name="pnum" value="<%= pb.getPnum() %>">
        </div>
        
        <div style="margin-bottom: 20px;">
            <label for="pname" style="font-weight: bold;">상품명</label><br>
       		<input type="text" name="pname" value="<%=pb.getPname()%>">
        </div>
        
        
        <div style="margin-bottom: 20px;">
            <label for="pcompany" style="font-weight: bold;">제조회사</label><br>
            <input type="text" name="pcompany" id="pcompany" value="<%=pb.getPcompany() %>" style="margin-left: 10px; padding: 8px; border-radius: 5px; border: 1px solid #ccc;">
        </div>
        
        <div style="margin-bottom: 20px;">
            <label for="pimage" style="font-weight: bold;">상품 이미지</label><br>
            <img src="<%=request.getContextPath()%>/wineshop/wineimages/<%=pb.getPimage()%>" alt="상품이미지" width="100">
            <input type="file" name="pimage" value="파일 선택">
            <input type="text" name="pimage2" value="<%=pb.getPimage()%>">
        </div>
        
        <div style="margin-bottom: 20px;">
            <label for="pqty" style="font-weight: bold;">상품 수량</label><br>
            <input type="text" name="pqty" id="pqty" value="<%=pb.getPqty()%>" style="margin-left: 10px; padding: 8px; border-radius: 5px; border: 1px solid #ccc;">
        </div>
        
        <div style="margin-bottom: 20px;">
            <label for="price" style="font-weight: bold;">상품 가격</label><br>
            <input type="text" name="price" id="price" value="<%=pb.getPrice()%>" style="margin-left: 10px; padding: 8px; border-radius: 5px; border: 1px solid #ccc;">
        </div>
        
        <div style="margin-bottom: 20px;">
            <label for="pspec" style="font-weight: bold;">상품 스펙</label><br>
            <select name="pspec" id="pspec" style="margin-left: 10px; padding: 8px; border-radius: 5px; border: 1px solid #ccc;">
                <option value="NORMAL" <% if(pb.getPspec().equals("NORMAL")){%> selected <%}%>>::NORMAL::</option>
                <option value="HIT" <% if(pb.getPspec().equals("HIT")){%> selected <%}%>>HIT</option>
                <option value="NEW" <% if(pb.getPspec().equals("NEW")){%> selected <%}%>>NEW</option>
                <option value="BEST" <% if(pb.getPspec().equals("BEST")){%> selected <%}%>>BEST</option>
            </select>
        </div>
        
        <div style="margin-bottom: 20px;">
            <label for="pcontents" style="font-weight: bold;">상품 소개</label><br>
            <textarea name="pcontents" id="pcontents" rows="3" cols="25" style="margin-left: 10px; padding: 8px; border-radius: 5px; border: 1px solid #ccc;"><%=pb.getPfood()%></textarea>
        </div>
        
        <div style="margin-bottom: 20px;">
            <label for="psweet" style="font-weight: bold;">당도</label><br>
          <select name="psweet" id="pspec" style="margin-left: 10px; padding: 8px; border-radius: 5px; border: 1px solid #ccc;">
                <option value="DRY" <% if(pb.getPspec().equals("DRY")){%> selected <%}%>>::DRY::</option>
                <option value="SEMI-DRY" <% if(pb.getPspec().equals("SEMI-DRY")){%> selected <%}%>>::SEMI-DRY::</option>
                <option value="NORMAL" <% if(pb.getPspec().equals("NORMAL")){%> selected <%}%>>::NORMAL::</option>
                <option value="SEMI-SWEET" <% if(pb.getPspec().equals("SEMI-SWEET")){%> selected <%}%>>::SEMI-SWEET::</option>
                <option value="SWEET" <% if(pb.getPspec().equals("SWEET")){%> selected <%}%>>::SWEET::</option>
            </select>
        </div>
        
        <div style="margin-bottom: 20px;">
            <label for=palch style="font-weight: bold;">알콜 도수</label><br>
             <input type="text" name="palch" id="palch" value="<%=pb.getPalch()%>"style="margin-left: 10px; padding: 8px; border-radius: 5px; border: 1px solid #ccc;">
        </div>
        
        <div style="margin-bottom: 20px;">
            <label for="point" style="font-weight: bold;">상품 포인트</label><br>
            <input type="text" name="point" id="point" value="<%=pb.getPoint()%>" style="margin-left: 10px; padding: 8px; border-radius: 5px; border: 1px solid #ccc;">
        </div>
        
         <div style="margin-bottom: 20px;">
            <label for="paddr" style="font-weight: bold;">생산지</label><br>
            <input type="text" name="paddr" id="point" value="<%=pb.getPaddr()%>" style="margin-left: 10px; padding: 8px; border-radius: 5px; border: 1px solid #ccc;">
        </div>
        
         <div style="margin-bottom: 20px;">
            <label for="pfood" style="font-weight: bold;">페어링 음식</label><br>
            <textarea name="pfood" id="pfood" rows="3" cols="25" style="margin-left: 10px; padding: 8px; border-radius: 5px; border: 1px solid #ccc;"><%=pb.getPfood()%></textarea>
        </div>
        
        <div style="text-align: center;">
            <input type="submit" class ="button" value="상품 수정" style="padding: 10px 20px; border: none; border-radius: 5px; background-color: #5e2a55; color: #fff; cursor: pointer; transition: background-color 0.3s;">
           <a href="prod_list.jsp"><input type="button" class ="button" value="취소" style="padding: 10px 20px; border: none; border-radius: 5px; background-color: #5e2a55; color: #fff; cursor: pointer; transition: background-color 0.3s; margin-left: 10px;"></a>
        </div>
    </form>
</div>
     
	<%@ include file="bottom.jsp" %>  