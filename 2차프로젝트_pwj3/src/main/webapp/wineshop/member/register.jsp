<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>



<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>쌍용 주류샵 회원가입</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
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
            color: white;
        }
    </style>
</head>
<body>

<main class="form-signin">
    <form class="was-validated" action="registerPro.jsp">
        <h1 class="mb-3">회원가입</h1>
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <div class="mb-3">
            <label for="validationTextarea" class="form-label">이름</label>
            <input type="text" name="name" class="form-control" id="validationTextarea" required>
            <div class="invalid-feedback">이름 필수로 입력하셔야 합니다.</div>
       		
        </div>
        
        <div class="mb-3">
    <label for="id" class="form-label">아이디</label>
    <input type="text" name="id" class="form-control" id="id" required>
    <div class="invalid-feedback">아이디를 입력하세요.</div>
    <span id="idCheckResult"></span> 
    <button type="button" id="checkIdBtn" onclick="duplicate()" class="btn btn-primary">중복 확인</button><br><br>
	</div>
        
          <div class="mb-3">
            <label for="password" class="form-label">비밀번호</label>
            <input type="password" name="password" class="form-control" id="password" required>
            <div class="invalid-feedback">비밀번호 입력해주세요.</div>
        </div>
        
        <div class="mb-3">
            <label for="repassword" class="form-label">비밀번호 확인</label>
            <input type="password" name="repassword" class="form-control" id="repassword" required>
            <div id="passwordMatchError" class="invalid-feedback">비밀번호가 일치하지 않습니다.</div>
        </div>
 
         <div class="mb-3">
            <label for="validationTextarea" class="form-label">E-MAIL</label>
            <input type="text" name="email" class="form-control" id="validationTextarea" required>
            <div class="invalid-feedback">이메일 필수로 입력하셔야 합니다.</div>
        </div>
        
         <div class="row mb-3">
            <div class="col">
                <label for="rrn1" class="form-label">주민번호 앞 6자리</label>
                <input type="text" name="rrn1" class="form-control" id="rrn1" maxlength="6" required>
                <div class="invalid-feedback">앞 6자리 입력하세요.</div>
            </div>
            <div class="col">
                <label for="rrn2" class="form-label">뒷 7자리</label>
                <input type="password" name="rrn2" class="form-control" id="rrn2" maxlength="7" required>
                <div class="invalid-feedback">뒷 7자리 입력하세요.</div>
            </div>
        </div>
        
<div class="row mb-3">
    <div class="col">
        <label for="hp1" class="form-label">전화번호</label>
        <input type="text" name="hp1" class="form-control" id="hp1" maxlength="3" required>
        <div class="invalid-feedback">앞번호 3자리</div>
    </div>
    <div class="col">
    <label for="hp1" class="form-label"></label>
        <input type="text" name="hp2" class="form-control" id="hp2" maxlength="4" required>
        <div class="invalid-feedback">가운데 4자리</div>
    </div>
    <div class="col">
    <label for="hp1" class="form-label"></label>
        <input type="text" name="hp3" class="form-control" id="hp3" maxlength="4" required>
        <div class="invalid-feedback">뒷번호 4자리</div>
    </div>
</div>
		
<div class="mb-3">
    <label for="joindate" class="form-label">가입일</label>
    <input type="text" name="joindate" class="form-control" id="joindate" required readonly>
</div>

<script>
    // 현재 날짜를 가져오는 함수
    function getCurrentDate() {
        var currentDate = new Date();
        var year = currentDate.getFullYear();
        var month = currentDate.getMonth() + 1;
        var day = currentDate.getDate();

        // 한 자리 숫자일 경우 앞에 0을 붙여 두 자리로 만듭니다.
        month = month < 10 ? '0' + month : month;
        day = day < 10 ? '0' + day : day;

        return year + '-' + month + '-' + day;
    }

    // 가입일 input 요소에 현재 날짜를 설정합니다.
    document.getElementById('joindate').value = getCurrentDate();
</script>


         <div class="mb-3">
            <label for="validationTextarea" class="form-label">결제하실 카드 번호</label>
            <input type="text" name = "card" class="form-control" id="validationTextarea" required>
            <div class="invalid-feedback">카드정보 필수로 입력하셔야 합니다.</div>
        </div>
        
<div class="mb-3">
    <input type="button" onclick="sample6_execDaumPostcode()" class="btn btn-primary" value="우편번호 찾기"><br>
    <input type="text" id="sample6_postcode" class="form-control" placeholder="우편번호">
    <input type="text" id="sample6_address" name = "addr" class="form-control" placeholder="주소"><br>
    <input type="text" id="sample6_detailAddress" class="form-control" placeholder="상세주소">
    <input type="text" id="sample6_extraAddress" name= "subaddr" class="form-control" placeholder="이 자리는 ㅇㅇ동 을 입력해주세요">
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

        
        <div class="mb-3 form-check">
            <input type="checkbox" class="form-check-input" id="validationFormCheck1" required>
            <label class="form-check-label" for="validationFormCheck1">개인정보 이용동의</label>
            <div class="invalid-feedback">동의하신다면, 체크를 해주세요</div>
        </div>
        <button class="btn btn-primary w-100" type="submit">회원가입</button><br><br>
        <button class="btn btn-primary w-100" type="button" onclick="gotoLogin()">로그인 페이지로 이동하기</button><br><br>
        <button class="btn btn-primary w-100" type="button" onclick="gotoMall()">로그인 없이 쇼핑몰 구경하기</button>
    </form>
</main>

<script>
    (function () {
        'use strict';

        var forms = document.querySelectorAll('.needs-validation');

        Array.prototype.slice.call(forms)
            .forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }

                    form.classList.add('was-validated');
                }, false);
            });
    })();
</script>

<script>
    function validatePassword() {
        var password = document.getElementById("password").value;
        var repassword = document.getElementById("repassword").value;
        var errorMessage = document.getElementById("repassword-error");

        if (password !== repassword) {
            document.getElementById("repassword").setCustomValidity("Passwords do not match");
        } else {
            document.getElementById("repassword").setCustomValidity('');
        }
    }
</script>

<script>

	function gotoLogin() {
 	   window.location.href = "../../login.jsp";
	}


	function gotoMall() {
    	window.location.href = "../display/mall.jsp";
	}

    document.addEventListener('DOMContentLoaded', function () {
        var password = document.getElementById('password');
        var repassword = document.getElementById('repassword');
        var passwordMatchError = document.getElementById('passwordMatchError');
        var submitBtn = document.getElementById('submitBtn');

        function checkPasswordMatch() {
            if (password.value !== repassword.value) {
                passwordMatchError.style.display = 'block';
                submitBtn.disabled = true;
            } else {
                passwordMatchError.style.display = 'none';
                submitBtn.disabled = false;
            }
        }

        password.addEventListener('input', checkPasswordMatch);
        repassword.addEventListener('input', checkPasswordMatch);
    });
</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<script>
    function duplicate() {
        var id = document.getElementById("id").value;

        // 아이디가 빈 문자열인지 확인
        if (id === "") {
            alert("아이디를 입력하세요.");
            return;
        }

        // AJAX 요청을 통해 아이디 중복 확인
        $.ajax({
            url: "id_check.jsp",
            type: "POST",
            data: { id: id }, // 수정된 부분
            success: function(response) {
                if (response.trim() === 'YES') { // trim()을 사용하여 응답 문자열의 양쪽 공백 제거
                    $("#idCheckResult").html("사용 가능한 아이디입니다.").css("color", "green");
             		
                } else if (response.trim() === 'NO') { // trim()을 사용하여 응답 문자열의 양쪽 공백 제거
                    $("#idCheckResult").html("이미 사용 중인 아이디입니다.").css("color", "red");
                	return false;
                } else {
                    $("#idCheckResult").html("서버 오류가 발생했습니다.").css("color", "red");
               		return false;
                }
            },
            error: function() {
                $("#idCheckResult").html("서버와의 통신에 문제가 발생했습니다.").css("color", "red");
           			return false;
            }
        });
    }
</script>


</body>
</html>
