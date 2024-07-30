findid.jsp<br>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!doctype html>
<html lang="kr" data-bs-theme="auto">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="generator" content="Hugo 0.122.0">
    <title>쌍용 주류샵 아이디 찾기</title>

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
 <form action="findidProc.jsp" method="post">
    <h1 class="login">아이디 찾기</h1><br>

    <div class="form-floating mb-3">
        <input type="text" name="name" class="form-control" id="floatingInput" required autofocus>
        <label for="floatingInput">가입하신 이름을 입력해 주세요</label>
    </div>
    
    <div class="row mb-3">
        <div class="col-6">
            <div class="form-floating">
                <input type="text" name="rrn1" class="form-control" id="rrn1" maxlength="6" required oninput="moveToNextField(event, 'rrn2')">
                <label for="rrn1">주민번호 앞자리</label>
            </div>
        </div>
        <div class="col-6">
            <div class="form-floating">
                <input type="password" name="rrn2" class="form-control" id="rrn2" maxlength="7" required>
                <label for="rrn2">주민번호 뒷자리</label>
            </div>
        </div>
    </div>

    <div class="row mb-3">
        <div class="col-4">
            <div class="form-floating">
                <input type="text" name="hp1" class="form-control" id="hp1" maxlength="3" required oninput="moveToNextField(event, 'hp2')">
                <label for="hp1">휴대폰 번호</label>
            </div>
        </div>
        <div class="col-4">
            <div class="form-floating">
                <input type="text" name="hp2" class="form-control" id="hp2" maxlength="4" required oninput="moveToNextField(event, 'hp3')">
                <label for="hp2" class="form-label">가운데 자리</label>
            </div>
        </div>
        <div class="col-4">
            <div class="form-floating">
                <input type="text" name="hp3" class="form-control" id="hp3" maxlength="4" required>
           		<label for="hp3" class="form-label">뒷자리</label>
            </div>
        </div>
    </div>
    
    <button class="btn btn-primary w-100 py-2" type="submit">아이디 찾기</button><br><br>
    <button class="btn btn-primary w-100 py-2" type="button" onclick="findpw()">비밀번호를 잊으셨나요?</button><br><br>
    <button class="btn btn-primary w-100 py-2" type="button" onclick="gotoLogin()">로그인 하러 가기!</button><br><br>
    <button class="btn btn-primary w-100 py-2" type="button" onclick="gotoMall()">쇼핑몰 구경하기!</button>
</form>



<script>
    function moveToNextField(event, nextFieldId) {
        const input = event.target;
        const maxLength = input.getAttribute('maxlength');
        const currentLength = input.value.length;

        if (currentLength >= maxLength) {
            const nextField = document.getElementById(nextFieldId);
            nextField.focus();
        }
    }
    
    function gotoLogin() {
        window.location.href = "../../login.jsp";
    }
    
    function findpw() {
        window.location.href = "findpw.jsp";
    }
    
    function gotoMall() {
        window.location.href = "../display/mall.jsp";
    }
    
</script>


    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
