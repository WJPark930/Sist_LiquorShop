<%@page import="board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="style.css" type="text/css">  
<style>
    table {
        width: 700px;
        border-collapse: collapse;
        margin: 20px auto;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: center;
    }
    th {
        background-color: #2a6bf7;
        color: white;
        font-weight: bold;
    }
    tr:nth-child(even) {background-color: #f2f2f2;}
    tr:hover {background-color: #ddd;}
    img {
        vertical-align: middle;
    }
    .subject {
        text-align: left;
    }
    
    a{
    	margin:auto;
    	text-align: center;
    }
</style>

<%
    request.setCharacterEncoding("UTF-8");
    int pnum = Integer.parseInt(request.getParameter("pnum"));
    int pageSize = 10; 
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    
    String pageNum = request.getParameter("pageNum");
    if(pageNum == null){
        pageNum = "1";
    }
    
    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    
    
    int count = 0;
    int number = 0;
    
    BoardDao bdao = BoardDao.getInstance();
    count = bdao.getArticleCount(); 
    
    number = count - (currentPage-1) * pageSize; 
    
    ArrayList<BoardBean> articleLists  = bdao.getArticles(startRow,endRow, pnum);  
%>
<body bgcolor="">

<%
    if(count == 0){
%>
        <table>
            <tr>
                <td align="center">
                    게시판에 저장된 글이 없습니다.
                </td>
            </tr>
        </table>
<%      
    }else{
%>
        <table>
            <thead>
                <tr>
                    <th colspan="5">구매 신청 글목록</th>
                </tr>
                <tr>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>조회수</th>
                    <th>IP</th>
                </tr>
            </thead>

<%
                for(BoardBean bb : articleLists){
%>
                    <tr>
                        <td class="subject">
                        <%
                        int wid = 0;
                            if(bb.getRe_level() > 0){
                                wid = 20 * bb.getRe_level();
                        %>
                            <img src="./upimg/level.gif" width="<%=wid%>" height="15">
                            <img src="./upimg/re.gif">
                        <%                      
                            }
                        %>
                            <a href="content.jsp?num=<%= bb.getNum()%>&pageNum=<%=pageNum%>&pnum=<%=pnum%>"><%= bb.getSubject()%></a>
                        <%
                            if(bb.getReadcount()>=10){
                        %>
                            <img src="./upimg/hot.jpg" height="15">
                        <%
                            }
                        %>
                        </td>   
                        <td><%= bb.getWriter()%></td>   
                        <td><%= sdf.format(bb.getReg_date())%></td>   
                        <td><%= bb.getReadcount()%></td>   
                        <td><%= bb.getIp()%></td>   
                    </tr>

                   <%
                   ArrayList<BoardBean> commentLists = bdao.getComments(bb.getNum()); 
                   for(BoardBean comment : commentLists){
                       int commentIndent = 20 * comment.getRe_level();
                       String indentStyle = "style=\"padding-left: " + commentIndent + "px\"";
                       String contentLink = "content.jsp?num=" + comment.getNum() + "&pageNum=" + pageNum + "&pnum=" + pnum;
               %>


        <tr>
            <td colspan="5" class="subject">
                <div <%= indentStyle %>><a href="<%= contentLink %>"><%= comment.getContent() %></a></div>
            </td>   
        </tr>
<%
    }
%>


        </table>
        <div align="center">
<%      
    }
    if(count > 0){
        int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1); 

        
        int pageBlock = 10;
        
        int startPage = ((currentPage-1) / pageBlock * pageBlock) + 1;
        int endPage = startPage + pageBlock -1;
        if(endPage > pageCount){
            endPage = pageCount;
        }
        
        if(startPage > 10){
%>
            <a href="up_prodView.jsp?pageNum=<%=startPage-10%>">[이전]</a>
<%          
        }
        for(int i=startPage; i<=endPage ; i++){
%>
        <a href="up_prodView.jsp?pageNum=<%=i%>&pnum=<%=pnum %>" align="center">[<%=i %>]</a> 
<%          
        }
        if(endPage < pageCount){
%>
            <a href="up_prodView.jsp?pageNum=<%=startPage+10%>">[다음]</a>    
<%          
        	}
        }
    }
%> 
    </div>
</body>
