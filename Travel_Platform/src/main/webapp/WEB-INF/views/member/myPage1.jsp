<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<style>

    body{
        background-size: cover;
    }
    

    #wrap{
        margin: auto;
        width: 60%;
        height: 1300px;
        background-color: whitesmoke;
        padding: 24px;
        border-radius: 40px;
        
       
        
    }

    #profile{
        margin-left: 25px;
        
    }

    #first{
        width: 100%;
        height: 400px;
        text-align: center;
    }

    #btn{
        background-color:   whitesmoke;
        border: 1px solid black;
        
        outline: none;
        padding: 12px;
        width: 400px;
        cursor: pointer;
    }
    #btn > a{
        width: 100%;
    }

    #btn:hover{
        color: white;
        background-color: black;
    }

    #btn2{
        background-color:   whitesmoke;
        border: 1px solid black;
        border-radius: 2px;
        outline: none;
        padding: 12px;
        width: 800px;
        cursor: pointer;
    }

    #btn2:hover{
        color: white;
        background-color: black;
    }

    
</style>
</head>
<body background="resources/image/pado.gif">
    <jsp:include page="../common/header1.jsp" />
    <br><br><br><br><br><br><br>
    <div id="wrap" class="animate__animated animate__fadeInLeft">
        
        <h1 align="center">마이페이지</h1>
        <br><br>

        <div id="first">
            <div>
                <img id="profile" class="profile" src="${sessionScope.loginUser.changeName}" alt="Profile Image" style="width: 120px; height: 120px; border-radius: 70px;">
            </div>
            <br><br>
            <h2>${ sessionScope.loginUser.nickName }</h2>
            <br><br>
            <button id="btn" onclick="location.href='myPage.me'">
                프로필 편집
            </button>

            <button id="btn" onclick="location.href='updatePassword.me'">
                비밀번호 변경
            </button>
            <br><br>

            <button id="btn2" class="nn" onclick="location.href=''">
                플래너 수정
            </button>

            

            
        </div>

            <h1>내 플래너</h1>

            <div class="planner-gallery">
            </div>
            <!-- 페이징바 -->
            <div align="center" class="paging-area">
            </div>

        <div>
            
            


        </div>







    </div>

    




</body>
</html>