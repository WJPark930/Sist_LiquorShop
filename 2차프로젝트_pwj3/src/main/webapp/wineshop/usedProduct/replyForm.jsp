<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html lang="ko">
<style>
body {
    background-color: #f0f2f5;
    color: #333;
    margin: 0;
    padding: 20px;
}

table {
    width: 60%;
    margin: 20px auto;
    border-collapse: collapse;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

th, td {
    padding: 12px 20px;
    border-bottom: 1px solid #ddd;
}

th {
    background-color: #007bff;
    color: #ffffff;
    text-align: left;
}

input[type="text"], textarea {
    width: 100%;
    padding: 10px;
    margin: 5px 0 20px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type="submit"], input[type="button"] {
    width: 100px;
    background-color: #007bff;
    color: white;
    padding: 10px;
    margin: 10px 5px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type="submit"]:hover, input[type="button"]:hover {
    background-color: #0056b3;
}

input[type="button"] {
    background-color: grey;
}


@media screen and (max-width: 768px) {
    table {
        width: 90%;
    }
}

</style>  

<%
	request.setCharacterEncoding("UTF-8");
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	int ref = Integer.parseInt(request.getParameter("ref"));
	int re_step = Integer.parseInt(request.getParameter("re_step"));
	int re_level = Integer.parseInt(request.getParameter("re_level"));
	String pageNum =  request.getParameter("pageNum");	

%>
<%@include file="up_main.jsp"%>
<body>
<meta charset="UTF-8">
	<form action="replyProc.jsp?pnum=<%=pnum%>" method="post" accept-charset="UTF-8">
		<input type = "hidden" name = "ref" value = "<%=ref %>">
	   <input type = "hidden" name = "re_step" value = "<%=re_step %>">
	   <input type = "hidden" name = "re_level" value = "<%=re_level %>">
		<table border="1" width="500">

			<tr>
				<th>이름</th>
				<td><input type="text" name="writer" maxlength="10"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" value="[댓글]"></td>
			</tr>

			<tr>
				<th>내용</th>
				<td><textarea name="content" rows="5" cols="50"></textarea> </td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" name="passwd"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="답글쓰기">
					<input type="button" value="다시작성">
					<input type="button" value="목록보기" onClick="location='list.jsp'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>