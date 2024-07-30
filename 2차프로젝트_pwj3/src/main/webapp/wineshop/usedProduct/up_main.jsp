<%@page import="wine.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>중고거래 전용 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<style>

input[type="submit"], input[type="button"] {
    cursor: pointer;
    background-color: #2a6bf7;
    color: #fff;
    border: none;
    padding: 10px 20px;
    margin: 10px;
    border-radius: 5px;
    font-size: 16px;
}

.fixed-button {
	position: fixed;
	bottom: 100px;
	right: 100px;
	z-index: 1000;
	size: 500px;
}

input[type="submit"] {
	background-color: #2a6bf7;
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

//System.out.println("로그인 세션으로 넘어오는 msubaddr : " + msubaddr);
%>

	<header>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container">
				<a class="navbar-brand" href="up_main.jsp">중고 거래 커뮤니티</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="../display/mall.jsp">쇼핑몰로 이동하기</a></li>
						<li class="nav-item"><a class="nav-link"
							href="myPage.jsp?memid=<%= memid %>">마이페이지</a></li>

					</ul>

					<div style="color: white;">
						<%=memid%>님, 반갑습니다!<br> 나의 동네 :
						<%=msubaddr%>
					</div>

					<div>
						<a href="../../login3.jsp">로그인</a> | <a href="../../logout.jsp">로그아웃</a>
					</div>
				</div>
			</div>
		</nav>
	</header>

	<br>
	<section style="display: flex; justify-content: center;">
		<div class="bg-image"
			style="height: 30vh; width: 30%; background-image: url('../../images/중고거래.jpg'); background-size: cover; background-position: center; cursor: pointer;"
			onclick="redirectToPage()"></div>
	</section>
	<br>

	<br>
	<div align="center" style="font-weight: bold;">
		<form name="myform" action="up_productView.jsp">
			<select id="province" style="width: 70px" onchange="provinceChange()">
				<option value="">도/시</option>
				<option value="서울특별시">서울특별시</option>
				<option value="부산광역시">부산광역시</option>
				<!-- 다른 도/시 추가하기 -->
			</select> <select id="district" style="width: 70px"
				onchange="districtChange()">
				<option value="">구</option>
			</select> <select id="neighborhood" style="width: 70px" name="addr">
				<option value="">동네</option>
			</select> <br> <br> <input type="submit" value="매물 조회하기"
				onClick="return check()">

		</form>
		<hr>
		<br>
	</div>
	<button class="fixed-button btn btn-primary btn-lg"
		onclick="window.location.href='insertUsedProduct.jsp'">상품
		등록하기!</button>

	<div align="center">
		<%--<%@ include file="../../index.jsp"%>  --%>
	</div>
	<br>

	<footer>
		<!-- 푸터 내용 -->
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script>

function check(){
    var memberNeighborhood = "<%=msubaddr%>"; // 회원의 동네 정보
    var selectedNeighborhood = document.getElementById("neighborhood").value;
    
    if(memberNeighborhood !== selectedNeighborhood) {
        alert("회원님의 동네 상품만 조회가 가능합니다.");
        return false; 
    }
    return true; // 폼 제출
}



function provinceChange() {
    var provinceSelect = document.getElementById("province");
    var districtSelect = document.getElementById("district");
    var neighborhoodSelect = document.getElementById("neighborhood");

    // 선택된 도/시 값 가져오기
    var selectedProvince = provinceSelect.value;

    // 구 목록 초기화
    districtSelect.innerHTML = "<option value=''>구</option>";

    // 도/시에 따라 구 목록 설정
    if (selectedProvince === "서울특별시") {
        // 서울특별시의 구 목록 설정
        var districts = ["강남구", "강동구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"];

        // 구 목록에 추가
        districts.forEach(function(district) {
            districtSelect.innerHTML += "<option value='" + district + "'>" + district + "</option>";
        });
    } else if (selectedProvince === "부산광역시") {
        // 부산광역시의 구 목록 설정
        var districts = ["중구", "서구", "동구", "영도구", "부산진구", "동래구", "남구", "북구", "해운대구", "사하구", "금정구", "강서구", "연제구", "수영구", "사상구", "기장구"];

        // 구 목록에 추가
        districts.forEach(function(district) {
            districtSelect.innerHTML += "<option value='" + district + "'>" + district + "</option>";
        });
    }
    // 선택된 도/시 값이 없으면 동네 목록 초기화
    if (!selectedProvince) {
        neighborhoodSelect.innerHTML = "<option value=''>동네</option>";
    }
}

function districtChange() {
    var districtSelect = document.getElementById("district");
    var neighborhoodSelect = document.getElementById("neighborhood");

    // 선택된 구 값 가져오기
    var selectedDistrict = districtSelect.value;

    // 동네 목록 초기화
    neighborhoodSelect.innerHTML = "<option value=''>동네</option>";

    // 선택된 구에 따라 동네 목록 설정
    if (selectedDistrict === "강남구") {
        var neighborhoods = ["대치동", "도곡동", "삼성동", "압구정동", "역삼동", "일원동"];

        neighborhoods.forEach(function(neighborhood) {
            neighborhoodSelect.innerHTML += "<option value='" + neighborhood + "'>" + neighborhood + "</option>";
        });
    }
    // 다른 구에 대한 동네 목록 추가하기
    
     if (selectedDistrict === "마포구") {
        var neighborhoods = ["서교동", "성산동", "아현동", "망원동", "합정동", "상암동", "연남동"];

        neighborhoods.forEach(function(neighborhood) {
            neighborhoodSelect.innerHTML += "<option value='" + neighborhood + "'>" + neighborhood + "</option>";
        });
    }
}

window.onload = function() {
    provinceChange(); 
};

function redirectToPage() {
 
    var url = 'up_main.jsp';
    window.location.href = url;
}
</script>
</body>
</html>

