<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/style.css">
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
        #leftbutton:hover{
            color: grey;
        }

        #optiontitle > a{
            transition: .4s;
        }

        #optiontitle > a:hover{
            color: grey;
        }
    </style>
    
</head>
<body>
	<footer id="footer">
        <div id="footerwrap">
            <div id="footertop">
                <div id="left">
                    <p id="leftment">다양한 후기들이 궁금하다면.</p>

                    <button class="start-button" id="leftbutton">다양한 후기</button>

                    <p id="leftment2">Download the app</p>

                    <a id="appstore" href=""><img src="https://assets-global.website-files.com/65e9eb12a7b59f0d08eda049/65ef843d7a4c96934b054082_app-store.webp"></a>
                    <a id="playstore" href=""><img src="https://assets-global.website-files.com/65e9eb12a7b59f0d08eda049/65ef843df85cb802f781e68b_google-play.webp"></a>

                </div>

                <div id="right">
                    <ul id="rightoption1">
                        <li id="optiontitle" ><a href="noticeList.bo">NOTICE</a></li>
                        <br>
                        

                    </ul>

                    <ul id="rightoption2">
                        <li id="optiontitle" ><a href="eventList.bo">FESTIVAL</a></li>
                        <br>
                        

                    </ul>

                    <ul id="rightoption3">
                        <li id="optiontitle" ><a href="msgPage.mg">GROUP MESSAGE</a></li>
                        <br>
                       

                    </ul>

                    <p id="okment">Travely가 궁금하다면?</p>

                    <button class="start-button" id="ok">Travlely?</button>
                    

                    <ul id="righticon" >
                        <li><a href=""><img src="resources/image/facebook.png"></a></li>
                        <li><a href=""><img src="resources/image/instar.png"></a></li>
                        <li><a href=""><img  id="icon" src="resources/image/x2.png"></a></li>
                        <li><a href=""><img src="resources/image/tiktok.png"></a></li>

                    </ul>

                    <p id="rightment1" >© Copyright 2024 Travley</p>

                </div>

                <div id="bottom">
                    <p id="footerment" >JUST TRAVLE</p>
                </div>
            </div>
            
                
            
        </div>
   
        <script>
        	$(function(){
        		$("#leftbutton").click(function(){
        			location.href="selectList.bo";
        		});
        	});


            $(function(){
        		$("#ok").click(function(){
        			location.href="intro.me";
        		});
        	});
        </script>
    </footer>

</body>
</html>