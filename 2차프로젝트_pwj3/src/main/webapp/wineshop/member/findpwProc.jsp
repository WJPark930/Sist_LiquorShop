<%@page import="wine.member.MemberDTO"%>
<%@page import="wine.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
findpwProc.jsp<br>
<%
    	request.setCharacterEncoding("UTF-8");
    	
    	String name = request.getParameter("name");
    	String id = request.getParameter("id");
    	String rrn1 = request.getParameter("rrn1");
    	String rrn2 = request.getParameter("rrn2");
    	String hp1 = request.getParameter("hp1");
    	String hp2 = request.getParameter("hp2");
    	String hp3 = request.getParameter("hp3");
    	
    	/* System.out.println("비밀번호 찾기 폼에서 넘어오는 id : " +id);
    	System.out.println("비밀번호 찾기 폼에서 넘어오는 name : " +name);
    	System.out.println("비밀번호 찾기 폼에서 넘어오는 rrn1 : " +rrn1);
    	System.out.println("비밀번호 찾기 폼에서 넘어오는 rrn2 : " +rrn2);
    	System.out.println("비밀번호 찾기 폼에서 넘어오는 hp1 : " +hp1);
    	System.out.println("비밀번호 찾기 폼에서 넘어오는 hp2 : " +hp2);
    	System.out.println("비밀번호 찾기 폼에서 넘어오는 hp3 : " +hp3); */
    	
    	MemberDao mdao = MemberDao.getInstance();
    
   		MemberDTO md = mdao.findPw(name, id , rrn1, rrn2, hp1, hp2, hp3);
    	  
    	String url;
    	String msg;
    	
    	if(md == null){
    		msg = "존재하지 않는 회원 정보 입니다";
    		url = "findpw.jsp";
    	}else{
    		msg = "비밀번호는 " + md.getPassword() + "입니다";
    		url = "../../main.jsp";
    	}
    %>
    
    <script type="text/javascript">
    	alert('<%=msg%>');
    	location.href = "<%=url%>";
    </script>