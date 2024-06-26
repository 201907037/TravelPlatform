<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Login</title>

    <!-- Custom fonts for this template-->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
    
    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <style>
        body{
            background-size:cover ;
        }



        #dd{
            top: 160px;
        }

        #cc{
            width: 100%;
            height: 100%;
        }

        #oo{
            height: 1200px;
        }

        a{
            color: black;
        }

        a:hover{
            color: black;
            text-decoration: none;
        }

        #mm{
            background-color: lightskyblue;
            color: white;
        }

        #mm:hover{
            background-color: cornflowerblue;
        }

        #kk{
            margin-top: 100px;
        }
        
        
        

    </style>

</head>

<body background="resources/image/pado.gif">

    <jsp:include page="../common/header1.jsp" />

    <div id="oo" class="container animate__animated animate__fadeInDown">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div id="dd" class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block"><img id="cc" src="resources/image/login1.jpg" alt=""></div>
                            <div class="col-lg-6">
                                <div class="p-5" id="kk">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">환영해요!</h1>
                                    </div>
                                    <form class="user" method="post" action="login.me" id="login-form">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                id="userId" name="userId" 
                        						value="${ cookie.saveId.value }" required aria-describedby="emailHelp"
                                                placeholder="아이디를 입력하세요.">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                id="userPwd" name="userPwd" required placeholder="비밀번호를 입력하세요.">
                                        </div>
                                        
                        <c:choose>
                    	<c:when test="${ not empty cookie.saveId }">
                    		<!-- 만약 saveId 라는 쿠키가 있다면 : 체크박스가 체크되게끔 -->
	                    	<div class="form-group">
                                <div class="custom-control custom-checkbox small">
                                    <input type="checkbox" class="custom-control-input" id="saveId" 
         							   name="saveId" value="y">
                                    <label class="custom-control-label" for="saveId">아이디 저장
                                       	</label>
                                </div>
                            </div>
                    	</c:when>
                    	<c:otherwise>
	                    	<div class="form-group">
                                <div class="custom-control custom-checkbox small">
                                    <input type="checkbox" class="custom-control-input" id="saveId" 
         							   name="saveId" value="y">
                                    <label class="custom-control-label" for="saveId">아이디 저장
                                        </label>
                               </div>
                            </div>
                    	</c:otherwise>
                    	</c:choose>
                                        
                                        
                                        
                                        
                                        <input type="submit" value="로그인"  id="loginBtn" class="btn btn-outline-warning  btn-block">
                                        
                                        <hr>
                                        <a href="searchId.me"  class="btn btn-outline-secondary  btn-block">
                                            		 아이디 찾기
                                        </a>
                                        <a href="resetPassword.me" class="btn btn-outline-secondary  btn-block">
                                            		 비밀번호 찾기
                                        </a>
                                    </form>
                                    <hr>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    

</body>

</html>