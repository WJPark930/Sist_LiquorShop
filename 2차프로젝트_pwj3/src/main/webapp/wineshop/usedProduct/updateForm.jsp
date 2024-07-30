<%@page import="board.BoardBean"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="style.css" rel="stylesheet" type="text/css">  
<style>
body {
    font-family: 'Arial', sans-serif;
    background-color: #f4f4f4;
    text-align: center;
    margin: 0;
    padding: 20px;
}

table {
    width: 700px;
    margin: 20px auto;
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-collapse: collapse;
}

th, td {
    text-align: left;
    padding: 10px;
    border-bottom: 1px solid #ddd;
}

th {
    background-color: #2a6bf7;
    color: #fff;
    font-weight: bold;
}

input[type="text"], textarea {
    width: 95%;
    padding: 5px;
    margin: 5px 0;
    border: 1px solid #ddd;
    border-radius: 4px;
}

input[type="submit"], input[type="button"] {
    cursor: pointer;
    background-color: #2a6bf7;
    color: #fff;
    border: none;
    padding: 10px 20px;
    margin: 10px;
    border-radius: 5px;
    font-size: 16px;
}

input[type="button"] {
    background-color: #2a6bf7;
}

input[type="submit"]:hover, input[type="button"]:hover {
    opacity: 0.9;
}

</style>  
<%
int pnum = Integer.parseInt(request.getParameter("pnum"));
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	BoardDao bdao = BoardDao.getInstance();
	BoardBean bb = bdao.updateGetArticle(num);
%>
<%@include file="up_main.jsp"%>
<body bgcolor="">

	<form action="updateProc.jsp" method="post">
		<input type="hidden" name="num" value="<%=bb.getNum()%>">
		<input type="hidden" name="pnum" value="<%=bb.getUpnum()%>">
		<input type="hidden" name="pageNum" value="<%=pageNum%>">
		<table border="1" width="700">

			<tr>
				<th>이름</th>
				<td><input type="text" name="writer" maxlength="10" value="<%=bb.getWriter()%>"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" value="<%=bb.getSubject()%>"></td>
			</tr>

			<tr>
				<th>내용</th>
				<td><textarea name="content" rows="5" cols="50"><%=bb.getContent()%></textarea> </td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" name="passwd"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="글수정">
					<input type="button" value="뒤로 가기" onClick="location='up_prodView.jsp?pnum=<%=pnum%>'">
				</td>
			</tr>
		</table>
	</form>
</body>