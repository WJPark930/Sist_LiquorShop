<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	request.setCharacterEncoding("UTF-8");
	int upnum = Integer.parseInt(request.getParameter("upnum")); 
%>

<jsp:useBean id="bb" class="board.BoardBean">
	<jsp:setProperty name="bb" property="*"/>
</jsp:useBean>
<%
	bb.setReg_date(new Timestamp(System.currentTimeMillis()));
	bb.setIp(request.getRemoteAddr());
	
	BoardDao bdao = BoardDao.getInstance();
	int cnt = bdao.insertArticle(bb, upnum);  
	
	String msg, url;
	if(cnt == 1){
		msg = "등록 완료";
		url = "up_prodView.jsp?pnum=" + upnum;
	}else{
		msg = "등록 실패";
		url = "up_prodView.jsp";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>
