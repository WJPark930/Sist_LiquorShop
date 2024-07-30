<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="malltop.jsp"%>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>와인 추천 결과</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<style>

.wine-card {
	border: 1px solid #ccc;
	border-radius: 10px;
	padding: 20px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.wine-image {
	width: 100%;
	border-radius: 10px;
}


.wine-description {
	margin-top: 20px;
	font-size: 16px;
}


.buy-button {
	margin-top: 20px;
}
</style>
</head>
<body>

	<div class="container mt-5 text-center">
		<h1 class="mb-4">와인 추천 결과</h1>
		<div class="card wine-card">
			<div class="card-body">
				<h5 class="card-title">당신을 위한 와인 추천</h5>
				<div class="wine-info">
					<% 
                    
                    String sweetness = request.getParameter("sweetness");
                    String acidity = request.getParameter("acidity");
                    String body = request.getParameter("body");
                    String alch = request.getParameter("alch");
                    String food = request.getParameter("food");

 
                    String recommendedWineName = "";
                    String recommendedWineType = "";
                    String recommendedWineDescription = "";
                    String recommendedWineImage = ""; // 와인 이미지 경로

                  
                    if (sweetness.equals("dry") && acidity.equals("low") && body.equals("full") && alch.equals("low-alch") && food.equals("red") ) {
                        recommendedWineName = "오퍼스 원,700ml";
                        recommendedWineType = "레드 와인, 메를로";
                        recommendedWineDescription = "피니시는 강렬하지만, 맛은 부드럽고 풍부한 과일 향이 특징인 와인입니다.";
                        recommendedWineImage = "../wineimages/오퍼스원.jpg"; 
                    } else if (sweetness.equals("semi-dry") && acidity.equals("high") && body.equals("full") && alch.equals("low-alch") && food.equals("white")) {
                        recommendedWineName = "AB부르고뉴";
                        recommendedWineType = "화이트 와인, 샤르도네";
                        recommendedWineDescription = "깔끔하고 상큼한 느낌의 화이트 와인입니다.";
                        recommendedWineImage = "../wineimages/AB부르고뉴.png"; 
                    } else if (sweetness.equals("dry") && acidity.equals("low") && body.equals("full") && alch.equals("high-alch") && food.equals("red")) {
                        recommendedWineName = "맥캘란 12y, 700ml";
                        recommendedWineType = "싱글몰트 위스키";
                        recommendedWineDescription = "풍부한 과일향이 특징이며, 싱글몰트 특유의 맛과 더불어 쉐리 케스크의 특징을 잘 느낄 수 있는 위스키 입니다.";
                        recommendedWineImage = "../wineimages/맥캘란12.jpg"; // 이미지 경로 설정
                    } else {
                        recommendedWineName = "추천 와인 없음";
                        recommendedWineType = "-";
                        recommendedWineDescription = "선택한 조건에 맞는 와인이 없습니다.";
                        recommendedWineImage = ""; // 이미지가 없는 경우 빈 문자열로 설정
                    }

                    // 와인 정보 및 이미지 표시
                    if (!recommendedWineName.equals("추천 와인 없음")) { 
                %>
					<img src="<%= recommendedWineImage %>" alt="와인 이미지"
						class="wine-image" style="width: 350px; height: 400px;">
					<h2 class="mt-3"><%= recommendedWineName %></h2>
					<p class="mb-3"><%= recommendedWineType %></p>
					<p class="wine-description"><%= recommendedWineDescription %></p>
					<%
   					 // 추천 와인에 따라 다른 상품 페이지 번호를 설정
   					 String productPageNum = "";
   					 if (recommendedWineName.equals("오퍼스 원,700ml")) {
    			    productPageNum = "7"; 
  					  } else if (recommendedWineName.equals("AB부르고뉴")) {
 			       productPageNum = "12"; // 해당 와인에 대한 상품 페이지 번호
 					   } else if (recommendedWineName.equals("맥캘란 12y, 700ml")) {
   				     productPageNum = "17"; // 해당 와인에 대한 상품 페이지 번호
 					   }
					%>

					<a
						href="../display/mall_prodView.jsp?pnum=<%= productPageNum %>"
						class="btn btn-primary buy-button">와인 구매하러 가기!</a>

					<% } else { %>
					<p class="mt-3">추천 와인이 없습니다.</p>
					<% } %>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>
<%@ include file="mallbottom.jsp"%>
