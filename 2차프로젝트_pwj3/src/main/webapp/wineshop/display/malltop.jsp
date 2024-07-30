<%@page import="wine.shop.CategoryDao"%>
<%@page import="wine.shop.CategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<style>

    body {
        background-color: white; 
    }

    
    nav {
        background-color: white; 
        text-align: center; /
  		font-weight: bold;
  		position: fixed; 
   		top: 0; 
   		width: 100%; 
   		z-index: 1000; 
    }

    .navbar-nav {
        margin: 0 auto;
        display: table; 

    .navbar-nav li {
        display: inline-block;
        margin: 0 10px;  
    }
    
    .navbar-nav .nav-link:hover {
    text-decoration : underline;
    color: #661b5b;
    
	}
	
	.login{
		color:black;
		font-weight: 800;
	}

	.login:hover {
	 color: #661b5b;
	}
    
    .nav-item{
    	font-weight: 900;
    	font-size: 18px;
    }
    

    
</style>



<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<%
CategoryDao cdao = CategoryDao.getInstance();
String contextPath = request.getContextPath();
String memid = (String)session.getAttribute("memid");
%>

<body>
<br><br>
<header align="center">
	<div align="left" style="margin-left: 75px;">
	<a class="login" style="text-decoration: none;" href="../member/register.jsp"> 회원가입 </a> | 
	<a class="login" style="text-decoration: none;" href="../../login.jsp"> 로그인 </a> |
	<a class="login" style="text-decoration: none;" href="../../logout.jsp"> 로그아웃 </a> |
	<a class="login" style="text-decoration: none;" href="../../login.jsp"> 관리자모드 </a> <br>
	<% 
		if(memid != null){%>
			<span align="center"><%=memid%>님 반갑습니다!</span><br><br>
			</div>
	<%
	} else{ 
	%>
		<span align="center">로그인 해주세요!</span><br><br>
			</div>
	<%
	}
	%>
	
	
	
	
	<a href="mall.jsp"><img src="../../images/메인로고.png" class="navbar-brand" height="120" width="400" alt="로고"></a>
</header>


		


<nav class="navbar navbar-expand-lg " style="background-color: white; font-weight: bold;">
 <br><hr style="color: black;" width="80%"><br>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  <div class="container-fluid justify-content-center" >
	
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarScroll">
      <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="mall.jsp">Home</a>
        </li>
       
        <li class="nav-item dropdown" >
          <a style="white-space: nowrap;" class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
           	주류 구입하기
          </a>
            <% 
            ArrayList<CategoryBean> clist = cdao.getAllCategory();  
            if(clist.size() == 0){
            %>

                 <li><a>카테고리 준비중 입니다.</a></li>
            <% 
            } else {
            %>
            	 <ul class="dropdown-menu">
             
            <%  for(int i = 0; i < clist.size(); i++){
            %>
           	
                   <li> 
                   <a class="dropdown-item" href="<%=contextPath%>/wineshop/display/mall_cgList.jsp?code=<%=clist.get(i).getCode()%>&cname=<%=clist.get(i).getCname()%>">
                        <%=clist.get(i).getCname()%>
                    </a>
                    </li>
            <%		
                }
            %>
           
           	 </ul>
            </li>
           <%
           }
           %>

        <li class="nav-item" style="white-space: nowrap;">
          <a class="nav-link" href="findwine.jsp">오늘의 주류 추천</a>
        </li>
        
         <li class="nav-item" style="white-space: nowrap;">
         <%
         	if(memid != null){
         %>
         	<a class="nav-link" href="../usedProduct/up_main.jsp">중고 거래 커뮤니티</a>
         <% 		
         	}else{
         %>
          <a class="nav-link" href="../../login2.jsp">중고 거래 커뮤니티</a>
         <%
         }
         %>
        </li>
        
        <li class="nav-item" style="white-space: nowrap;">
        <a class="nav-link" href="../../login4.jsp">마이 페이지</a>
  	  </li>
        
        <li class="cart">
         <a class="cart" href="mall_cartList.jsp"><img src="../../images/장바구니.png" height="50" width="50"></a> 
        </li>

      </ul>
    </div>
  </div>
  <br><hr style="color: black;" width="80%"><br>
</nav>

	
	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
