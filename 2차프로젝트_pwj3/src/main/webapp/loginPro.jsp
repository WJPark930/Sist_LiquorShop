<%@page import="wine.member.MemberDTO"%>
<%@page import="wine.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
loginPro.jsp<br>

 <%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("pw");
	MemberDao mdao = MemberDao.getInstance();
	
	String viewPage;
	
	MemberDTO member = mdao.memberCheck(id,password);  /* id와 pw를 넘겨받으면 작업 */
	
	//System.out.println("로그인 하면 login proc로 넘어오는 id : " + member.getId());
	//System.out.println("로그인 하면 login proc로 넘어오는 name : " + member.getName());
	//System.out.println("로그인 하면 login proc로 넘어오는 subaddr : " + member.getSubaddr());
	
	if(member != null){ // 존재한다.
		if(id.equals("admin")){
			viewPage ="wineshop/admin/main.jsp";
			%>
			<script type="text/javascript">
		alert("관리자님 반갑습니다.");
				</script>
			<% 
		}else{
			viewPage ="wineshop/display/mall.jsp";
			%>
			<script type="text/javascript">
				alert("<%=member.getName()%>님, 반갑습니다.");
				</script>
			<% 
		}
		session.setAttribute("memid", id);
		session.setAttribute("memno", member.getNo()); /* 회원 번호도 다른곳에서 사용하기 위하여 session으로 설정*/	
		session.setAttribute("mname",member.getName());
		session.setAttribute("msubaddr", member.getSubaddr()); 
		session.setAttribute("memcard", member.getCard());
	}else{
		viewPage ="login.jsp";
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
