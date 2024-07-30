<%@page import="up.shop.UsedProdDao"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>


<%
		UsedProdDao updao = UsedProdDao.getInstance();
	  	
	    String configDir = config.getServletContext().getRealPath("/wineshop/upimage");
	    int maxSize = 1024*1024*5;
	    String encoding = "UTF-8";
	    MultipartRequest mr = new MultipartRequest(request,configDir,maxSize,encoding,new DefaultFileRenamePolicy());
	
	    String ornimg = mr.getParameter("pimage2");
	    //System.out.println("새로운 이미지 : " + ornimg);
	    String pimage = mr.getFilesystemName("pimage");
	    //System.out.println("새로운 이미지 : " + pimage);
	    String img  = null;
	    String configFolder = config.getServletContext().getRealPath("/wineshop/upimage/");
	    if(ornimg == null){  
	    	if(pimage != null){ 
	    		img = pimage;
	    	}
	    }else if(ornimg != null){
	    	
	    	if(pimage == null){
	    		img = ornimg;
	    	}else if(pimage != null){
	    		img = pimage;
	    		
	    		File delFile = new File(configFolder,ornimg);
	    		delFile.delete();
	    	}
	    }
	    
	    int cnt = updao.updateProduct(mr,img);      
	    
	   	String msg =null;
	   	String url =null;
	   	if(cnt > 0){
	   		msg = "수정 성공";
	   		url = "myPage.jsp";
	   	}else{
	   		msg = "수정 실패";
	   		url = "updateProduct.jsp?upnum="+mr.getParameter("upnum");
	   	}
    %>
     <script>
        alert("<%=msg%>");
        location.href="<%=url%>";
    </script>