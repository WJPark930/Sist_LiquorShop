<%@page import="wine.member.MemberDTO"%>
<%@page import="wine.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
loginPro.jsp<br>

 <%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("pw");
	MemberDao mdao = MemberDao.getInstance();	
	
	String viewPage;
	
	MemberDTO member = mdao.memberCheck(id,password); 
	
	if(member != null){
		if(id.equals("admin")){
			viewPage ="wineshop/admin/main.jsp";
			%>
			<script type="text/javascript">
		alert("관리자님 반갑습니다.");
				</script>
			<% 
		}else{
			viewPage ="wineshop/usedProduct/up_main.jsp";
			%>
			<script type="text/javascript">
				alert("<%=member.getName()%>님, 반갑습니다.");
				</script>
			<% 
		}
		session.setAttribute("memid", id); 
		session.setAttribute("memno", member.getNo()); 
		session.setAttribute("mname", member.getName());
		session.setAttribute("msubaddr", member.getSubaddr()); 
		session.setAttribute("memcard", member.getCard());
	}else{
		viewPage ="login3.jsp";
%>
	<script type="text/javascript">
		alert("존재하지 않는 회원입니다.");
	</script>		
<%
	}
%>
<script type="text/javascript">
	location.href="<%=viewPage%>";
</script>	
