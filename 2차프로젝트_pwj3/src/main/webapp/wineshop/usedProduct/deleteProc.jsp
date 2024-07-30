<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
deleteForm.jsp => deleteProc.jsp<br>

<%
    	request.setCharacterEncoding("UTF-8");

		int pnum = Integer.parseInt(request.getParameter("pnum"));

    	BoardDao bdao = BoardDao.getInstance();
    	int num = Integer.parseInt(request.getParameter("num"));
    	String passwd = request.getParameter("passwd");

    	
    	int cnt = bdao.deleteArticle(num,passwd);  
    	

    	int pageSize = 2;
    	int count = bdao.getArticleCount();	
    	int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1); // 8
    	
    	
    	String msg =null;
    	String url =null;
    	
    	if(cnt > 0){
    		msg = "삭제 성공";
    		url = "up_prodView.jsp?pnum=" + pnum;
    	}else if(cnt == 0){
    		msg = "비밀번호가 일치하지 않습니다.";
    		url = "up_prodView.jsp?pnum=" + pnum;
    	}else{
    		msg = "삭제 오류";
    		url = "deleteForm.jsp?pnum=" + pnum;
    	}
    %>
    <script>
        alert("<%=msg%>");
        location.href="<%=url%>";
    </script>
    