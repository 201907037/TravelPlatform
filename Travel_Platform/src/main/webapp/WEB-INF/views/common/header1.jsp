<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="resources/css/style.css" />
    <script src="https://kit.fontawesome.com/13a6fd1fbd.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
    <script src="https://unpkg.com/scrollreveal"></script>  
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
    />
   
    
    




    <style>
       
        header{
            position: fixed;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 8px;
            height: 80px;
            z-index: 400;
            width: 100%;
            -webkit-transition-duration:0.4s;
            -webkit-transition-timing-function:ease;
            transition-duration:0.4s;
            transition-timing-function:ease;
            
  
        }

        .down {
            background-color:rgba(176, 196, 222, 0.233);
            
            -webkit-transition-duration:0.4s;
            -webkit-transition-timing-function:ease;
            transition-duration:0.4s;
            transition-timing-function:ease;
            }
    </style>

</head>
<body>

    <header id="header" class="header">
        <div class="h1">
            <a href="./	" class="yellow underline">travley</a>
        </div>
    
        <ul id="nav" class="nav">
            <li><a class="yellow underline" href="./">HOME</a></li>
            <!-- Notice 경로 추가(나현성) -->
            <li><a class="yellow underline" href="noticeList.bo">NOTICE</a></li>
            <li><a class="yellow underline" href="selectList.bo">COMUNITY</a></li>
            <li><a class="yellow underline" href="eventList.bo">SERVICE</a></li>
        </ul>
        
        <div class="h3">
            <a href="loginPage.me" class="yellow underline">login</a>
            <!-- 관리자 페이지 이동 임시버튼 -->
            <a href="adminPage.ad" class="yellow underline">AdminPage</a>
            
            <a href="enrollForm.me" class="yellow underline">회원가입</a>
        </div>
        
        <!-- 로그인 클릭 시 뜨는 모달 (기존에는 안보이다가 위의 a 클릭 시 보임) -->
    
    </header>

    <script>

$(function(){
  var $header = $('header'); //헤더를 변수에 넣기
  var $page = $('.mid'); //색상이 변할 부분
  var $window = $(window);
  var pageOffsetTop = $page.offset().top;//색상 변할 부분의 top값 구하기
  
  $window.resize(function(){ //반응형을 대비하여 리사이즈시 top값을 다시 계산
    pageOffsetTop = $page.offset().top;
  });
  
  $window.on('scroll', function(){ //스크롤시
    var scrolled = $window.scrollTop() >= pageOffsetTop; //스크롤된 상태; true or false
    $header.toggleClass('down', scrolled); //클래스 토글
  });
});

    </script>
    
</body>
</html>