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
	
	
	if(member != null){ // �����Ѵ�.
		if(id.equals("admin")){
			viewPage ="wineshop/admin/main.jsp";
			%>
			<script type="text/javascript">
		alert("�����ڴ� �ݰ����ϴ�.");
				</script>
			<% 
		}else{
			viewPage ="wineshop/usedProduct/up_main.jsp";
			%>
			<script type="text/javascript">
				alert("<%=member.getName()%>��, �ݰ����ϴ�.");
				</script>
			<% 
		}
		session.setAttribute("memid", id); /* ���⼭ �Ѿ�� ���̵� ������ ���Ͽ� �����ϴ� �۾�(mall_top)���� */
		session.setAttribute("memno", member.getNo()); /* ȸ�� ��ȣ�� �ٸ������� ����ϱ� ���Ͽ� session���� ����*/	
		session.setAttribute("mname",member.getName());
		session.setAttribute("msubaddr", member.getSubaddr()); 
		session.setAttribute("memcard", member.getCard());
	}else{
		viewPage ="login2.jsp";
%>
	<script type="text/javascript">
		alert("�������� �ʴ� ȸ���Դϴ�.");
	</script>		
<%
	}
%>
<script type="text/javascript">
	location.href="<%=viewPage%>";
</script>	
