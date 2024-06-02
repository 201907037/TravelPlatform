<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    *{
        box-sizing: border-box;
    }
    .left-bar{
        height: 930px;
        width : 20%;
        border: 1px solid red;
        background-color: lightgray;
    }
    .tbox{
        width : 100%;
        height : 100px;
        border : 1px solid green;
        border-radius : 15px;
        margin: auto;
        margin-top: 15px;
    }
    .timg{
        width : 40%;
        height : 100%;
        border : 1px solid black;
        float : left
    }
    .timg>img{
        width : 100%;
        height : 100%;
    }
    .tname{
        width: 50%;
        height: 100%;
        border: 1px solid black;
        float : right;
    }
</style>
<link rel="stylesheet" href="resources/css/styles.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body id="body-pd">
<div class="l-navbar" id="navbar">
    <nav class="nav">
        <div>
            <div class="nav__brand">
                <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
                <a href="#" class="nav__logo">플래너</a>
            </div>
            <div class="nav__list">
                <a href="#" class="nav__link active">
                    <span class="material-symbols-outlined">
					map
					</span>
                    <span class="nav_name"> 숙소</span>
                </a>
                 <a href="#" class="nav__link active">
                    <span class="material-symbols-outlined">
					apartment
					</span>
                    <span class="nav_name">관광지</span>
                </a>
                 <a href="#" class="nav__link active">
                    <span class="material-symbols-outlined">
					ramen_dining
					</span>
                    <span class="nav_name">식당</span>
                </a>
            </div>
            
        </div>
    </nav>
</div>
 <!-- IONICONS -->
 <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
 <!-- JS -->
 <script src="resources/js/main.js"></script>
</body>
</html>