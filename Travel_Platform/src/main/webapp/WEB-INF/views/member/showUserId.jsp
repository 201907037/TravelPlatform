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

    <title>SB Admin 2 - Forgot Password</title>

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
        
        

    </style>


</head>

<body background="resources/image/pado.gif">

    <jsp:include page="../common/header1.jsp" />

    <div id="oo" class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div id="dd" class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div  class="col-lg-6 d-none d-lg-block"><img id="cc" src="resources/image/frog.png" alt=""></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-2">아이디를 잊으셨나요?</h1>
                                        <p class="mb-4">간단한 절차를 통해 잊어버린 아이디를 찾아보세요!</p>
                                    </div>
   

									
                                        <p>당신의 아이디는 : ${userId} 입니다</p>
                                           
                                       
                                        <button type="submit" class="btn btn-primary btn-user btn-block">
                                            	홈으로
                                        </button>
                                   
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="register.html">Create an Account!</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="login.html">Already have an account? Login!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
    
    <script>
    
   

 

 
</script>


     

    

    <jsp:include page="../common/footer1.jsp" />

</body>

</html>