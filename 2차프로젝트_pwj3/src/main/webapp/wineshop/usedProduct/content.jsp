<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <title>글내용 보기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            padding: 20px;
        }

        .btn-group-center {
            display: flex;
            justify-content: center;
        }

        .btn-group-center .btn {
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <%
    request.setCharacterEncoding("UTF-8");
        int num = Integer.parseInt(request.getParameter("num"));
        String pageNum =  request.getParameter("pageNum");
     //   System.out.println("content.jsp num:" + num);
     //   System.out.println("content.jsp pageNum:" + pageNum);
        
        int pnum = Integer.parseInt(request.getParameter("pnum"));
        
        BoardDao bdao = BoardDao.getInstance();
        BoardBean bb = bdao.getArticle(num);  
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
     //   System.out.println(bb.getRef());
        int ref = bb.getRef();
      //  System.out.println(bb.getRe_step());
      //  System.out.println(bb.getRe_level());
        
    %>
    <%@include file="up_main.jsp"%>

    <div class="container">
        <h2 class="text-center my-4">글내용 보기</h2>
        <table class="table table-bordered">
            <tr>
                <td style="width: 15%;" class="align-middle">글번호</td>
                <td style="width: 35%;"><%=bb.getNum() %></td>
                <td style="width: 15%;" class="align-middle">조회수</td>
                <td style="width: 35%;"><%=bb.getReadcount() %></td>
            </tr>
            <tr>
                <td class="align-middle">작성자</td>
                <td><%=bb.getWriter() %></td>
                <td class="align-middle">작성일</td>
              <%--   <td><%=sdf.format(bb.getReg_date())%></td> --%>
            </tr>
            <tr>
                <td class="align-middle">글제목</td>
                <td colspan="3"><%=bb.getSubject() %></td>
            </tr>
            <tr>
                <td class="align-middle">글내용</td>
                <td colspan="3"><%=bb.getContent() %></td>
            </tr>
            <tr>
                <td colspan="4" class="text-center">
                    <div class="btn-group-center">
                        <input type="button" class="btn btn-primary" value="글수정" onClick="location.href='updateForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>&pnum=<%=pnum%>'">
                        <input type="button" class="btn btn-danger" value="글삭제" onclick="location.href='deleteForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>&pnum=<%=pnum%>'">
                        <input type="button" class="btn btn-success" value="답글쓰기" onClick="location.href='replyForm.jsp?ref=<%=ref%>&re_step=<%=bb.getRe_step()%>&re_level=<%=bb.getRe_level()%>&pageNum=<%=pageNum %>&pnum=<%=pnum%>'">
                        <input type="button" class="btn btn-secondary" value="이전 페이지로 돌아가기" onclick="history.back()">
                    	<input type="button" class="btn btn-success" value="예약하기" >
                    </div>
                </td>
            </tr>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
