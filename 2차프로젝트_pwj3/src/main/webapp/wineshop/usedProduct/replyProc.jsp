<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="board.BoardDao"%>
<%@page import="java.sql.Timestamp"%>
    
<!DOCTYPE html>
<meta charset="UTF-8">

<html lang="ko">
<%
	request.setCharacterEncoding("UTF-8");
	int pnum = Integer.parseInt(request.getParameter("pnum"));
   	String writer = request.getParameter("writer"); 
   	System.out.println(writer);
%>

<jsp:useBean id="bb" class="board.BoardBean">
	<jsp:setProperty name="bb" property="*" />
</jsp:useBean>

<%
	  	bb.setReg_date(new Timestamp(System.currentTimeMillis())); 
		bb.setIp(request.getRemoteAddr());  
		
   		BoardDao dao = BoardDao.getInstance();
		dao.replyArticle(bb);
%>
<jsp:forward page="up_prodView.jsp?pnum=<%= pnum %>"/>

