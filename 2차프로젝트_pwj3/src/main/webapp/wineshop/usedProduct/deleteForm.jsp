<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="wine.shop.CategoryDao"%>

<link rel="stylesheet" href="style.css" type="text/css">  
<style>
	body{
		text-align: center;
	}
	table{
		margin: 5px auto;
	}
</style> 
<script>
   	function check(){
   		if(delForm.passwd.value == ""){
   			alert("비밀번호를 입력하세요.");
   			delForm.passwd.focus();
   			return false;
   		}
   	}
</script>

<%
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum =  request.getParameter("pageNum");
	System.out.println("deleteForm.jsp num:" + num);
	System.out.println("deleteForm.jsp pageNum:" + pageNum);
%>



<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>중고거래 전용 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
         .fixed-button {
            position: fixed;
            bottom: 100px; /* 하단 여백 조절 */
            right: 100px; /* 우측 여백 조절 */
            z-index: 1000; /* 다른 요소 위에 표시되도록 설정 */
           	size: 500px;
        }
    </style>
</head>
<body>

<%
CategoryDao cdao = CategoryDao.getInstance();
String contextPath = request.getContextPath();
String memid = (String)session.getAttribute("memid");
String mname = (String)session.getAttribute("mname");
String msubaddr = (String)session.getAttribute("msubaddr");

System.out.println("로그인 세션으로 넘어오는 msubaddr : " + msubaddr);
%>

<header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="up_main.jsp">중고 판매샵</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="../display/mall.jsp">쇼핑몰로 이동하기</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="myPage.jsp?memid=<%= memid %>">마이페이지</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">고객 지원</a>
                    </li>
                </ul>
                
                <div style="color: white;">
                	<%=memid%>님, 반갑습니다!<br>
                	나의 동네 : <%=msubaddr%>
                </div>
                
                <div>
                	<a href="../../login3.jsp">로그인</a> |  
                	<a href="../../logout.jsp">로그아웃</a>
                </div>
            </div>
        </div>
    </nav>
</header>

<br>
<section style="display: flex; justify-content: center;">
   <div class="bg-image" style="height: 30vh; width:30%; background-image: url('../../images/중고거래.jpg'); background-size: cover; background-position: center; cursor: pointer;" onclick="redirectToPage()">
    </div>
</section>
<br>

<br>

    <hr><br>
</div>
	    <button class="fixed-button btn btn-primary btn-lg" onclick="window.location.href='insertUsedProduct.jsp'">상품 등록하기!</button>

<div align="center">
	<body>

  <form name="delForm" action="deleteProc.jsp?pnum=<%=pnum%>" method="post" class="needs-validation" novalidate>
    <input type="hidden" name="num" value="<%=num %>">
    <input type="hidden" name="pageNum" value="<%=pageNum%>">
    <div class="container mt-5">
        <div class="row justify-content-md-center">
            <div class="col-md-6">
                <div class="card">
                    <h5 class="card-header">글 삭제</h5>
                    <div class="card-body">
                        <div class="mb-3">
                            <label for="passwd" class="form-label">비밀번호를 입력해주세요</label>
                            <input type="password" class="form-control" id="passwd" name="passwd" required>
                            <div class="invalid-feedback">
                                비밀번호를 입력해주세요.
                            </div>
                        </div>
                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                            <button type="submit" class="btn btn-primary" onClick="return check()">글삭제</button>
                            <button type="button" class="btn btn-secondary" onclick="location.href='up_prodView.jsp?pnum=<%= pnum %>'">상품보기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

<script>
(function () {
    'use strict'


    var forms = document.querySelectorAll('.needs-validation')

    Array.prototype.slice.call(forms)
        .forEach(function (form) {
            form.addEventListener('submit', function (event) {
                if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                }

                form.classList.add('was-validated')
            }, false)
        })
})();

function check(){
    if(delForm.passwd.value == ""){
        alert("비밀번호를 입력하세요.");
        delForm.passwd.focus();
        return false;
    }
}
</script>

</body>
</div>
<br>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script>


