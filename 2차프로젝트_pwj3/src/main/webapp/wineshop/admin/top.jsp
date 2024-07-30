<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<style>

    body {
        background-color: white; 
    }

  
    nav {
        background-color: white; 
        text-align: center;
    }

    .navbar-nav {
        margin: 0 auto; 
        display: table; 
    }

    .navbar-nav li {
        display: inline-block;
        margin: 0 10px; 
    }
</style>



<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<%
String contextPath = request.getContextPath();
String memid = (String)session.getAttribute("memid");
%>

<body>
<br><br>
<header align="center">
	<div align="left" style="margin-left: 75px;">
	<a class="login" style="text-decoration: none;" href="../member/register.jsp"> 회원가입 </a> | 
	<a class="login" style="text-decoration: none;" href="../../login.jsp"> 로그인 </a> |
	<a class="login" style="text-decoration: none;" href="../../logout.jsp"> 로그아웃 </a> <br>
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
	
	
	
	
	<a href="main.jsp"><img src="../../images/메인로고.png" class="navbar-brand" height="120" width="400" alt="로고"></a>
</header>

<div align="center">
		<hr style="color: black;" width="80%"><br>
</div>

<nav class="navbar navbar-expand-lg " style="background-color: white;">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  <div class="container-fluid justify-content-center"  >

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarScroll">
      <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
       
        
        <li class="nav-item">
          <a class="nav-link" href="cate_input.jsp">상품 카테고리 등록</a>
        </li>
        
         <li class="nav-item">
          <a class="nav-link" href="cate_list.jsp">상품 카테고리 보기</a>
        </li>
        
         <li class="nav-item">
          <a class="nav-link" href="prod_input.jsp">상품 등록</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="prod_list.jsp">상품 보기</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="shopping_list.jsp">전체 주문 조회</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="shopping_list_by_Id.jsp">고객 주문 조회</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="../display/mall.jsp">고객 페이지로 이동</a>
        </li>

      </ul>
    </div>
  </div>
</nav>

	<div align="center">
		<hr style="color: black;" width="80%"><br>
	</div>
	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
