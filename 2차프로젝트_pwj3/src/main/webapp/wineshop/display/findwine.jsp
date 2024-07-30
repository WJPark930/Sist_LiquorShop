<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ include file="malltop.jsp" %> 
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>와인 추천 설문조사</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>


<body>

<div class="container mt-5">
    <h1 class="text-center mb-4">오늘 무슨 술 마시지?</h1>
    <form action="recommend.jsp" method="post">
        <div class="mb-3">
            <label for="sweetness" class="form-label">원하시는 당도를 선택하세요:</label>
            <select class="form-select" id="sweetness" name="sweetness">
                <option value="dry">드라이한 맛</option>
                <option value="semi-dry">무난한 단맛</option>
                <option value="sweet">달콤한 맛</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="acidity" class="form-label">원하시는 산도를 선택하세요:</label>
            <select class="form-select" id="acidity" name="acidity">
                <option value="low">낮은 산도</option>
                <option value="medium">중간 산도</option>
                <option value="high">높은 산도</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="body" class="form-label">원하시는 바디감을 선택하세요:</label>
            <select class="form-select" id="body" name="body">
                <option value="light">가벼운 바디감</option>
                <option value="medium">보통 바디감</option>
                <option value="full">풍부한 바디감</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="body" class="form-label">원하시는 도수를 선택하세요:</label>
            <select class="form-select" id="body" name="alch">
                <option value="low-alch">낮은 도수</option>
                <option value="med-alch">보통 도수</option>
                <option value="high-alch">높은 도수</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="body" class="form-label">같이 먹을 안주를 선택하세요:</label>
            <select class="form-select" id="body" name="food">
                <option value="red">바베큐, 스테이크와 같은 붉은 육류</option>
                <option value="white">회, 생선구이 같은 해산물류</option>
                <option value="dessert">치즈, 초콜릿과 같은 디저트류</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">추천 받기!</button>
    </form>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
<%@ include file="mallbottom.jsp" %> 
