<%@page import="wine.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	int cnum = Integer.parseInt(request.getParameter("cnum"));
	String url;
	CategoryDao cdao = CategoryDao.getInstance();
	
	int cnt = cdao.deleteCategory(cnum); 
	
	String msg;
	if(cnt <= 0){
		msg = "카테고리 삭제 실패";
	}
	else{
		msg = "카테고리 삭제 성공";
	}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href = "cate_list.jsp";
</script>
