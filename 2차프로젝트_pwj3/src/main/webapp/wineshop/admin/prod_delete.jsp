<%@page import="java.io.File"%>
<%@page import="wine.shop.ProductDao"%>
<%@page import="wine.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

prod_list.jsp(cnum) => prod_delete.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	String pimage = request.getParameter("pimage");
	
	//System.out.println("list에서 넘어오는 pnum : " + pnum);
	//System.out.println("list에서 넘어오는 pimage : " + pimage);
	
	String url;
	ProductDao pdao = ProductDao.getInstance();
	
	int cnt = pdao.deleteProduct(pnum);   
	
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
	location.href = "prod_list.jsp";
</script>

