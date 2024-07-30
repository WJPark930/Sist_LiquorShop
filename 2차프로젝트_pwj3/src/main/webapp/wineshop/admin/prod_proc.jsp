<%@page import="wine.shop.ProductDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>

<%
	request.setCharacterEncoding("UTF-8");
	String pname = request.getParameter("pname");
	//System.out.println("pname:" + pname);
%>

<!-- 출력 : 
pname,pcompany,pspec
상품이미지 <img src~>

DBX
 -->

<%
	String uploadDir = config.getServletContext().getRealPath("/wineshop/wineimages"); // 미리 만들어 놓기
	System.out.println("uploadDir:" + uploadDir);
	/* C:\Users\\user\JSP_pwj\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\17_Minimall 에 가상폴더를 하나 만들어야 한다.*/
	
	MultipartRequest mr = null;
	mr = new MultipartRequest(request,
								uploadDir,
								1024*1024*10,
								"UTF-8",
								new DefaultFileRenamePolicy());

	System.out.println(mr.getParameter("pname"));
	System.out.println(mr.getParameter("pcompany"));
	System.out.println(mr.getParameter("pspec"));
	System.out.println(mr.getParameter("pimage"));
	System.out.println(mr.getParameterValues("pcategory_fk"));
	
	/* Enumeration files = mr.getFileNames();
	String file = (String)files.nextElement(); */
	
	String pimage = mr.getFilesystemName("pimage");
	System.out.println(pimage);
	
	String opimage = mr.getOriginalFileName("pimage");
	System.out.println(opimage);
	
	String requestDir = request.getContextPath()+"/myshop/images";
	
	// /17_Minimall/myshop/images
	requestDir = requestDir + "/" + opimage;
	System.out.println("requestDir:" + requestDir); // 포함
%>
상품이미지<br>
	<img src="<%=requestDir%>" width="100">

<!--                 -->

<%
	ProductDao pdao = ProductDao.getInstance();
	int cnt = pdao.insertProduct(mr);  
	String str, url;
	if(cnt>0){
		str = "상품 등록 성공";
		url = "prod_list.jsp";
	}else {
		str = "상품 등록 실패";
		url = "prod_input.jsp";
	}
%>
	<script>
		alert("<%=str%>");
		location.href = "<%=url%>";
	</script>