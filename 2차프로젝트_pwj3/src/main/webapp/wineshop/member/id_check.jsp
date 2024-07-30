<%@page import="wine.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	
	MemberDao mdao = MemberDao.getInstance();
	boolean flag = mdao.searchId(id);
	 
	if(flag){
		out.print("NO");
	}
	else{
		out.print("YES");
	}
%>
