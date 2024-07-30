<%@page import="wine.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<% 
	request.setCharacterEncoding("UTF-8");
   	String code = request.getParameter("code");
   	String cname = request.getParameter("cname");
   	
  // 	System.out.println("cate_input에서 cate_proc로 넘어오는 code : " + code);
  // 	System.out.println("cate_input에서 cate_proc로 넘어오는 cname : " + cname);
%>

<jsp:useBean id="cb" class="wine.shop.CategoryBean">
	<jsp:setProperty name="cb" property="*"/>
</jsp:useBean>

<%
	CategoryDao cdao = CategoryDao.getInstance();
	int cnt = cdao.insertCategory(cb); 
	String msg;
	String url;
	if(cnt != -1){
		msg = "카테고리 추가 성공"; 
	    url = "cate_list.jsp";
	}else{
		msg = "카테고리 추가 실패";
	    url = "cate_input.jsp";
	}
	%>
	<script type="text/javascript">
		alert("<%= msg %>");
		location.href="<%=url %>";
	</script>
	