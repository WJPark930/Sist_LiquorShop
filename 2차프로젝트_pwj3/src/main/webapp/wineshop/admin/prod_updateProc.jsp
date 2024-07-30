<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="wine.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>


<%
		ProductDao pdao = ProductDao.getInstance();
	  	
	    String configDir = config.getServletContext().getRealPath("/wineshop/wineimages");
	    int maxSize = 1024*1024*5;
	    String encoding = "UTF-8";
	    MultipartRequest mr = new MultipartRequest(request,configDir,maxSize,encoding,new DefaultFileRenamePolicy());
	   /* 	
	    기존이미지O, 새이미지O => 기존이미지 폴더에서 삭제, 새이미지 업로드
	    기존이미지X, 새이미지O => 새이미지 업로드
	    기존이미지O, 새이미지X => 기존이미지 그대로 사용
	    기존이미지X, 새이미지X => X
	     */
	    String ornimg = mr.getParameter("pimage2"); // 기존이미지
	    String pimage = mr.getFilesystemName("pimage"); // 새이미지
	    String img  = null;
	    String configFolder = config.getServletContext().getRealPath("/wineshop/wineimages/");
	    if(ornimg == null){  //기존 이미지x
	    	if(pimage != null){  //기존 이미지x 새 이미지o
	    		img = pimage;
	    	}
	    }else if(ornimg != null){  //기존 이미지o
	    	
	    	if(pimage == null){ //기존이미지o,새이미지x
	    		img = ornimg;
	    	}else if(pimage != null){ //기존이미지o 새이미지o
	    		img = pimage;
	    		
	    		File delFile = new File(configFolder,ornimg); //configFolder파일로 들어가서 ornimg를 찾는 과정
	    		delFile.delete();
	    	}
	    }
	    
	    int cnt = pdao.updateProduct(mr,img);     
	    //폴더, 파일 새로 만들기, 파일 삭제 File~ 
	    
	   	String msg =null;
	   	String url =null;
	   	if(cnt > 0){
	   		msg = "수정 성공";
	   		url = "prod_list.jsp";
	   	}else{
	   		msg = "수정 실패";
	   		url = "prod_update.jsp?pnum="+mr.getParameter("pnum");
	   	}
    %>
     <script>
        alert("<%=msg%>");
        location.href="<%=url%>";
    </script>