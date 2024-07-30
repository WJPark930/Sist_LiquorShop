<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="ko" class="h-100">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쌍용 주류 판매샵</title>
    <style>


		body {
   			 background-color : #1f0c33;
   			 background-size: cover;
  			  background-position: center;
			}


        body, html {
            height: 100%;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            background-color: rgba(0, 0, 0, 0.5); /* 투명한 배경색 */
        }

        header h3 {
            margin: 0;
            font-size: 24px;
            color: white;
        }

        .btn {
            display: inline-block;
            font-size: 18px;
            padding: 10px 20px;
            text-decoration: none;
            color: #712cf9;
            border: 2px solid #712cf9;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
        }

        .btn:hover {
            background-color: #712cf9;
            color: #fff;
        }

        .content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            text-align: center;
        }

        .content h2 {
            font-size: 36px;
            margin-top: 0;
            color: white;
        }

        .content p {
            font-size: 18px;
            color : white;
        }
      
    </style>
</head>
<body>

<header>
    <h3>쌍용 주류 판매샵</h3>
    <div>
        <a href="login.jsp" class="btn">로그인</a>
        <a href="./wineshop/member/register.jsp" class="btn">회원가입</a>
    </div>
</header>

<div class="content">
    <h2>쌍용 주류샵에 오신걸 환영합니다</h2>
    <p>19세 미만은 뒤로가기 버튼을 눌러주세요!</p>
    <a href="./wineshop/display/mall.jsp" class="btn">와인 구경하러 가기!</a>
</div>

</body>
</html>
