<%@page import="wine.member.MemberDTO"%>
<%@page import="wine.member.MemberDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
findidProc.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	MemberDao mdao = MemberDao.getInstance();
	
	String name = request.getParameter("name");
	String rrn1 = request.getParameter("rrn1");
	String rrn2 = request.getParameter("rrn2");
	String hp1 = request.getParameter("hp1");
	String hp2 = request.getParameter("hp2");
	String hp3 = request.getParameter("hp3");
	  
	MemberDTO  member  = mdao.findId(name,rrn1,rrn2,hp1,hp2,hp3);
	String msg ;
	if(member == null){
		msg = "존재하지 않는(찾을 수 없는) 회원";
	}else{
		msg = member.getId();
	}
%>

<script type="text/javascript">
	alert("<%=msg%>"+"입니다");
	location.href = "../../login.jsp";
</script>