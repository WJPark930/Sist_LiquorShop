<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>homepage</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        header {
            background: linear-gradient(to right, #333, #666);
            color: #fff;
            padding: 10px 0;
            text-align: center;
        }

        nav {
            background-color: #f4f4f4;
            padding: 10px;
        }

        nav ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
            text-align: center;
        }

        nav ul li {
            display: inline;
            margin-right: 20px;
            position: relative;
        }

        nav ul li a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
            transition: color 0.3s;
        }

        nav ul li a:hover {
            color: #000;
        }

        .container {
            width: 100%;
            margin: 100px auto;
        }

        .left {
            width: 55%;
            background-color: #f9f9f9;
            padding: 20px;
            float: left;
            box-sizing: border-box;
            margin: 30px 70px 50px 30px;
        }

        .right {
            width: 30%;
            float: right;
            position: relative; 
            overflow: hidden;
            height: 350px; 
            margin: 30px 70px 50px 30px;
        }

        .right img {
            position: absolute; 
            top: 0; 
            left: 0; 
            width: 100%;
            height: auto; 
            opacity: 0;
            transition: opacity 1s ease;
            margin-bottom: 40px;
        }

        .right img.active {
            opacity: 1; 
        }

        footer {
            background: linear-gradient(to right, #333, #666);
            color: #fff;
            text-align: center;
            padding: 10px 0;
            position: fixed;
            bottom: 0;
            width: 100%;
        }


        p {
            font-size: 15px;
        }

        #clock {
            font-size: 10px;
            margin-bottom: 10px;
        }

        nav ul ul {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            background-color: #f4f4f4;
            padding: 10px;
            min-width: 100px;
            z-index: 1;
        }

        nav ul li:hover > ul {
            display: block;
        }

      
        @media only screen and (max-width: 768px) {
            .container {
                margin: 50px auto;
                width: 90%;
            }

            .left, .right {
                width: 100%;
                float: none;
                margin: 0;
            }

            .right {
                display: none;
            }

            nav ul {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                background-color: #333;
                padding: 10px 0;
                z-index: 9999;
            }

            nav ul li {
                display: block;
                text-align: center;
                margin: 10px 0;
            }

            nav ul li a {
                color: #fff;
            }

            nav ul li:hover > ul {
                display: none;
            }

            nav ul ul {
                display: none;
                position: static;
                background-color: transparent;
                padding: 0;
                width: auto;
            }
        }
    </style>

</head>
<body>
<header>
    <h3>박원준의 홈페이지 입니다.</h3>
    <div id="clock"></div>
</header>
<nav>
    <ul>
        <li><a href="./박원준.html">Home</a></li>

        <li>
            <a href="#">Practice</a>
            <ul>
                <li><a href="./PracticeHtml.html">HTML</a></li>
                <li><a href="./PracticeCss.html">CSS</a></li>
                <li><a href="./PracticeJavaScript.html">JavaScript</a></li>
                <li><a href="./PracticeJQuery.html">JQuery</a></li>
            </ul>
        </li>
        <li>
            <a href="#">Contact</a>
            <ul>
                <li><a href="./ContactMe.html">Reservation</a></li>
                <li><a href="https://www.instagram.com/one__jjune/">Instagram</a></li>
                <li><a href="https://www.facebook.com/?locale=ko_KR">FaceBook</a></li>
            </ul>
        </li>
    </ul>
</nav>
<div class="container">
    <div class="left">
        <h2>Welcome to My Website</h2>
        <p>I was born in Daejeon, South Korea on September 30, 1998.</p>
        <p>I went to Daejeon until high school, and I graduated from <br>Kongju National University (Major: Information and Communication Engineering).</p>
        <p>I want to be a back-end developer, so I am training at the 'SsangYong <br>Education Center'.</p>
        <p>I have AWS Certified Solutions Architect-associate certificate and <br>NCP Certified Professional certificate.</p>
        <p>The buttons below put my favorite songs by season.</p>
        <button onclick="openPopup()">봄</button>
        <button onclick="openPopup2()">여름</button>
        <button onclick="openPopup3()">가을</button>
        <button onclick="openPopup4()">겨울</button>
    </div>
    <div class="right">
        <img src="./images/런던에서.jpg" alt="런던에서" class="active"> 
        <img src="./images/런던에서2.jpg" alt="런던에서2"> 
        <img src="./images/파리에서.jpg" alt="파리에서">
    </div>
</div>

<footer>
    <p>&copy; wonjun's Website. All rights reserved.</p>
</footer>

<script>
    function updateClock() {
        var now = new Date();
        var days = ['일','월','화','수','목','금','토'];
        var dayOfWeek = days[now.getDay()];

        var year = now.getFullYear();
        var month = ('0' + (now.getMonth() + 1)).slice(-2);
        var day = ('0' + now.getDate()).slice(-2);

        var hours = now.getHours();
        var minutes = ('0' + now.getMinutes()).slice(-2);
        var seconds = ('0' + now.getSeconds()).slice(-2);

     
        document.getElementById('clock').textContent = year + '년 ' + month + '월 ' + day + '일 ' + dayOfWeek + '요일 ' + hours + ':' + minutes + ':' + seconds;
    }


    setInterval(updateClock, 1000);

   
    function openPopup() {
     
        var url = "https://www.youtube.com/watch?v=iRGOb6aKcgw";
        window.open(url, "_blank", "width=600,height=400");
    }

    function openPopup2() {
      
        var url = "https://www.youtube.com/watch?v=t8nSG4dW__A";
        window.open(url, "_blank", "width=600,height=400");
    }

    function openPopup3() {
   
        var url = "https://www.youtube.com/watch?v=wnGpr6YKhow";
        window.open(url, "_blank", "width=600,height=400");
    }

    function openPopup4() {
        var url = "https://www.youtube.com/watch?v=vfR-vKuKct8";
        window.open(url, "_blank", "width=600,height=400");
    }

    var images = document.querySelectorAll('.right img'); // 
    var currentImageIndex = 0; 


    function changeImage() {
        images[currentImageIndex].classList.remove('active');
        currentImageIndex = (currentImageIndex + 1) % images.length; 
        images[currentImageIndex].classList.add('active'); 
    }

    setInterval(changeImage, 3000); 
</script>

</body>
</html>