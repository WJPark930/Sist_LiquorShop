<%@page import="up.shop.UsedProdDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<%
	request.setCharacterEncoding("UTF-8");

	String upname = request.getParameter("upname");
	String upcategory = request.getParameter("upcategory");
	String upimage = request.getParameter("upimage");
	String uprice = request.getParameter("uprice");
	

	String uploadDir = config.getServletContext().getRealPath("/wineshop/upimage"); 
	//System.out.println("uploadDir:" + uploadDir);
	
	MultipartRequest mr = null;
	mr = new MultipartRequest(request,
								uploadDir,
								1024*1024*10,
								"UTF-8",
								new DefaultFileRenamePolicy());
	

	
	String pimage = mr.getFilesystemName("pimage");
	String opimage = mr.getOriginalFileName("pimage");
	
	String requestDir = request.getContextPath()+"/myshop/images";
	
	requestDir = requestDir + "/" + opimage;
	System.out.println("requestDir:" + requestDir);
%>
상품이미지<br>
	<img src="<%=requestDir%>" width="100">

<%
	UsedProdDao udao = UsedProdDao.getInstance();
	int cnt = udao.insertProduct(mr);
	String str, url;
	if(cnt>0){
		str = "상품 등록 성공";
		url = "up_main.jsp";
	}else {
		str = "상품 등록 실패";
		url = "insertUsedProduct.jsp";
	}
%>
	<script>
		alert("<%=str%>");
		location.href = "<%=url%>";
	</script>