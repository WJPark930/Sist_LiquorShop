<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateProc.jsp<br>
<%
	request.setCharacterEncoding("UTf-8");
	String pageNum = request.getParameter("pageNum");
	//int num = Integer.parseInt(request.getParameter("num"));
	//System.out.println("updatProc : "+num);
	BoardDao bdao = BoardDao.getInstance();
%>
<jsp:useBean id="bb" class="board.BoardBean">
	<jsp:setProperty name="bb" property="*"/>
</jsp:useBean>
<%
	//System.out.println("updatProc : "+bb.getNum());
	//System.out.println("updatProc : "+bb.getContent());
	
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	int cnt = bdao.updateArticle(bb);  
	String msg,url;
	if(cnt>0){ 
		msg = "수정 성공";
		url = "up_prodView.jsp?pnum=" + pnum;
	}else if(cnt==0){
			msg="비밀번호가 일치하지 않습니다.";
			url = "up_prodView.jsp?pnum=" + pnum;
	}else{
		msg="수정 실패";
		url = "up_prodView.jsp?pnum=" + pnum;
	}
%>
<script>
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>