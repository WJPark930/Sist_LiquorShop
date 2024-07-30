<%@page import="wine.member.MemberDTO"%>
<%@page import="wine.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

    <%@include file = "malltop.jsp" %>
    
   <%
   MemberDao mdao = MemberDao.getInstance();
   String id = (String)session.getAttribute("memid");
   Integer memno = (Integer)session.getAttribute("memno");
   MemberDTO md = mdao.getMemberById(id);
   %>
    
     <div align="center">
    	<p style="font-size: 30px; font-weight: bold;" align="center">마이페이지</p>
    	<a align="center" href="#" style="text-decoration: none;">내 정보 수정하기</a> | 
    	<a align="center" href="mypage_order.jsp" style="text-decoration: none;">내 주문 정보 보기</a>
      <hr style="width: 80%;">
    </div>
    
 <section style="width: 30%; margin: auto;" align="center">    
   
    
    <main class="form-signin">
    <form class="was-validated" action="updateMemberProc.jsp">
        <h2 class="mb-3">내 정보 수정하기</h2>
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <div class="mb-3">
            <label for="validationTextarea" class="form-label">이름</label>
            <input type="text" name="name" class="form-control" id="validationTextarea" required value="<%= md.getName()%>" disabled="disabled">
            <div class="invalid-feedback">이름 필수로 입력하셔야 합니다.</div>
       		
        </div>
        
        <div class="mb-3">
    <label for="id" class="form-label">아이디</label>
    <input type="text" name="id" class="form-control" id="id" required value="<%=md.getId()%>">
    <div class="invalid-feedback">아이디를 입력하세요.</div>
    <span id="idCheckResult"></span> 
   	<br>
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
            <input type="text" name="email" class="form-control" id="validationTextarea" required value="<%=md.getEmail()%>">
            <div class="invalid-feedback">이메일 필수로 입력하셔야 합니다.</div>
        </div>
        
         <div class="row mb-3">
            <div class="col">
                <label for="rrn1" class="form-label">주민번호 앞 6자리</label>
                <input type="text" name="rrn1" class="form-control" id="rrn1" maxlength="6" required value="<%= md.getRrn1()%>" disabled="disabled">
                <div class="invalid-feedback">앞 6자리 입력하세요.</div>
            </div>
            <div class="col">
                <label for="rrn2" class="form-label">뒷 7자리</label>
                <input type="password" name="rrn2" class="form-control" id="rrn2" maxlength="7" required disabled="disabled">
                <div class="invalid-feedback">뒷 7자리 입력하세요.</div>
            </div>
        </div>
        
<div class="row mb-3">
    <div class="col">
        <label for="hp1" class="form-label">전화번호</label>
        <input type="text" name="hp1" class="form-control" id="hp1" maxlength="3" required value="<%= md.getHp1()%>">
        <div class="invalid-feedback">앞번호 3자리</div>
    </div>
    <div class="col">
    <label for="hp1" class="form-label"></label>
        <input type="text" name="hp2" class="form-control" id="hp2" maxlength="4" required value="<%= md.getHp2()%>">
        <div class="invalid-feedback">가운데 4자리</div>
    </div>
    <div class="col">
    <label for="hp1" class="form-label"></label>
        <input type="text" name="hp3" class="form-control" id="hp3" maxlength="4" required value="<%= md.getHp3()%>"> 
        <div class="invalid-feedback">뒷번호 4자리</div>
    </div>
</div>
		
<div class="mb-3">
    <label for="joindate" class="form-label">가입일</label>
    <input type="text" name="joindate" class="form-control" id="joindate" required readonly value="<%= md.getJoindate()%>">
</div>




         <div class="mb-3">
            <label for="validationTextarea" class="form-label">결제하실 카드 번호</label>
            <input type="text" name = "card" class="form-control" id="validationTextarea" required value="<%= md.getCard()%>">
            <div class="invalid-feedback">카드정보 필수로 입력하셔야 합니다.</div>
        </div>
        
<div class="mb-3">
    <input type="button" onclick="sample6_execDaumPostcode()" class="btn btn-primary" value="우편번호 찾기"><br><br>
    <input type="text" id="sample6_postcode" class="form-control" placeholder="우편번호">
    <input type="text" id="sample6_address" name = "addr" class="form-control" placeholder="주소" value="<%= md.getAddr()%>"><br>
    <input type="text" id="sample6_detailAddress" class="form-control" placeholder="상세주소" >
    <input type="text" id="sample6_extraAddress" name= "subaddr" class="form-control" placeholder="이 자리는 ㅇㅇ동 을 입력해주세요" value="<%=md.getSubaddr()%>">
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>



        
        <div class="mb-3 form-check">
            <input type="checkbox" class="form-check-input" id="validationFormCheck1" required>
            <label class="form-check-label" for="validationFormCheck1">개인정보 이용동의</label>
            <div class="invalid-feedback">동의하신다면, 체크를 해주세요</div>
        </div>
        <button class="btn btn-primary w-100" type="submit">정보 수정하기</button><br><br>
        <button class="btn btn-primary w-100" type="button" onclick="gotoLogin()">로그인 페이지로 이동하기</button><br><br>
        <button class="btn btn-primary w-100" type="button" onclick="gotoMall()">로그인 없이 쇼핑몰 구경하기</button>
    </form>
</main>

</section>


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

   
    document.getElementById('joindate').value = getCurrentDate();

    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = ''; 
                var extraAddr = '';

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

    function duplicate() {
        var id = document.getElementById("id").value;

        // 아이디가 빈 문자열인지 확인
        if (id === "") {
            alert("아이디를 입력하세요.");
            return;
        }

        // AJAX 요청을 통해 아이디 중복 확인
        $.ajax({
            url: "../member/id_check.jsp",
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    <%@include file = "mallbottom.jsp" %>