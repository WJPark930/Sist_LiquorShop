
<%@page import="wine.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
myshop\member\registerPro.jsp<br>

<%
	request.setCharacterEncoding("utf-8");
	String addr = request.getParameter("addr");
	String subaddr = request.getParameter("subaddr");
%>

<%
MemberDao mdao = MemberDao.getInstance();
//System.out.println("registerPro.jsp madao:"+mdao);
  
%>

<jsp:useBean id="md" class="wine.member.MemberDTO">
	<jsp:setProperty name="md" property="*"/>
</jsp:useBean>

<%
    int cnt = mdao.insertMember(md); 
	 
    if(cnt > 0){
%>
        <script>
            alert("<%=md.getName()%>님의 가입을 환영합니다!");
            window.location.href = "../display/mall.jsp";
        </script>
<%
    } else {
%>
        <script>
            alert("가입 실패");
            window.location.href = "register.jsp";
        </script>
<%
    }
%>

    
    
    
    
    