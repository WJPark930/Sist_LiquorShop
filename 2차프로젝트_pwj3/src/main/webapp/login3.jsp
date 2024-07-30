<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>


<!doctype html>
<html lang="kr" data-bs-theme="auto">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="generator" content="Hugo 0.122.0">
    <title>쌍용 주류샵 로그인</title>

    <link rel="canonical" href="https://getbootstrap.kr/docs/5.3/examples/sign-in/">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <style>
     
		

        .b-example-divider {
            width: 100%;
            height: 3rem;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
        }

        .b-example-vr {
            flex-shrink: 0;
            width: 1.5rem;
            height: 100vh;
        }

        .bi {
            vertical-align: -.125em;
            fill: currentColor;
        }

        .nav-scroller {
            position: relative;
            z-index: 2;
            height: 2.75rem;
            overflow-y: hidden;
        }

        .nav-scroller .nav {
            display: flex;
            flex-wrap: nowrap;
            padding-bottom: 1rem;
            margin-top: -1px;
            overflow-x: auto;
            text-align: center;
            white-space: nowrap;
            -webkit-overflow-scrolling: touch;
        }

        .btn-bd-primary {
            --bd-violet-bg: #712cf9;
            --bd-violet-rgb: 112.520718, 44.062154, 249.437846;
            --bs-btn-font-weight: 600;
            --bs-btn-color: var(--bs-white);
            --bs-btn-bg: var(--bd-violet-bg);
            --bs-btn-border-color: var(--bd-violet-bg);
            --bs-btn-hover-color: var(--bs-white);
            --bs-btn-hover-bg: #6528e0;
            --bs-btn-hover-border-color: #6528e0;
            --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
            --bs-btn-active-color: var(--bs-btn-hover-color);
            --bs-btn-active-bg: #5a23c8;
            --bs-btn-active-border-color: #5a23c8;
        }

        .bd-mode-toggle {
            z-index: 1500;
        }

        .bd-mode-toggle .dropdown-menu .active .bi {
            display: block !important;
        }

        body {
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #1f0c33;
        }

        .form-signin {
            width: 100%;
            max-width: 400px;
            padding: 15px;
            margin: auto;
        }
        
        .login{
			color: white;
		}
		
		.form-check-label{
			color: white;
			}
    </style>
    <link href="sign-in.css" rel="stylesheet">
</head>
<body>

  

    <main class="form-signin">
     <form action="loginPro3.jsp" method="post">
        <h1 class="login">LOGIN</h1>

        <div class="form-floating">
            <input type="text" name="id" class="form-control" id="floatingInput" required>
            <label for="floatingInput">아이디 또는 이메일</label>
        </div>
        
        <br>
        
        <div class="form-floating">
            <input type="password" name="pw" class="form-control" id="floatingPassword" required>
            <label for="floatingPassword">비밀번호</label>
        </div> 

        <div class="form-check text-start my-3">
            <input class="form-check-input" type="checkbox" value="이메일 기억하기" id="flexCheckDefault">
            <label class="form-check-label" for="flexCheckDefault">
                아이디 기억하기
            </label>
        </div>
        
        <div class="d-flex justify-content-between align-items-center mb-3">
            <!-- 카카오 아이디로 로그인 버튼 -->
            <button onclick="kakaoLogin();" style="background: url('./images/카카오로그인버튼.png') no-repeat; border: none; width: 150px; height: 45px; background-size: contain;"></button>
         
            <!-- 네이버 아이디로 로그인 버튼 -->
            <%@ page import="java.net.URLEncoder" %>
            <%@ page import="java.security.SecureRandom" %>
            <%@ page import="java.math.BigInteger" %>

            <%
                String clientId = "KyiXRoexmRWWJicfqgjB"; // 애플리케이션 클라이언트 아이디값
                String redirectURI = URLEncoder.encode("navercallback.jsp", "UTF-8");
                SecureRandom random = new SecureRandom();
                String state = new BigInteger(130, random).toString();
                String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code"
                         + "&client_id=" + clientId
                         + "&redirect_uri=" + redirectURI
                         + "&state=" + state;
                session.setAttribute("state", state);
            %>
            <a href="<%=apiURL%>"><img width: 200px; height=45px; src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
          
        </div>
        

        <button class="btn btn-primary w-100 py-2" type="submit">로그인</button><br><br>
        <button class="btn btn-primary w-100 py-2" type="button" onclick="forgotPassword()">아이디 혹은 비밀번호를 잊으셨나요?</button><br><br>
        <button class="btn btn-primary w-100 py-2" type="button" onclick="register()">회원가입 하기</button>

        <script>
            function login() {
                window.location.href = "login.jsp"; // 로그인 페이지 URL로 변경
            }

            function forgotPassword() {
                window.location.href = "./wineshop/member/findid.jsp"; // 비밀번호 찾기 페이지 URL로 변경
            }

            function register() {
                window.location.href = "./wineshop/member/register.jsp"; // 회원가입 페이지 URL로 변경
            }
            function goToMall() {
                window.location.href = "./wineshop/display/mall.jsp"; // 비회원으로 구경하기 페이지 URL로 변경
            }
        </script>
    </form>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
