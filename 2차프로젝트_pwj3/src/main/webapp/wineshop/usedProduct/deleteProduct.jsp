<%@page import="up.shop.UsedProdDao"%>
<%@page import="java.io.File"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	request.setCharacterEncoding("UTF-8");
	int upnum = Integer.parseInt(request.getParameter("upnum"));
	String pimage = request.getParameter("pimage");
	
	String url;
	UsedProdDao updao = UsedProdDao.getInstance();
	
	int cnt = updao.deleteProduct(upnum);   
	
	String configFolder = config.getServletContext().getRealPath("/wineshop/wineimages");
	File file = new File(configFolder+"/"+pimage);
	
	if(file.exists()){
		if(file.delete()==true){
%>
		<script type="text/javascript">
			alert('이미지 파일 삭제 성공');
		</script>
<% 			
		}
	}
	
	String msg;
	if(cnt <= 0){
		msg = "상품 삭제 실패";
	}
	else{
		msg = "상품 삭제 성공";
	}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href = "myPage.jsp";
</script>
