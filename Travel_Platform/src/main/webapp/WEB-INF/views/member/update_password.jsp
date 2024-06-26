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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
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

		.user{
			height: 400px;
		}
        
        

    </style>


</head>

<body background="resources/image/pado.gif">

	<script type="text/javascript">
        window.onload = function() {
            <c:if test="${not empty alertMsg}">
                alert("${alertMsg}");
            </c:if>
        }
    </script>

    <jsp:include page="../common/header1.jsp" />

    <div id="oo" class="container animate__animated animate__fadeInDown">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div id="dd" class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block"><img id="cc" src="resources/image/jeju.jpg" alt=""></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-2">비밀번호 변경</h1>
                                        <p class="mb-4">간단한 절차를 통해 잊어버린 비밀번호를 변경해보세요!</p>
                                    </div>
   

									<form class="user" action="updatePassword.me" id="updatePassword" method="post">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                id="userId" name="userId" required aria-describedby="emailHelp"
                                                placeholder="사용자 아이디">
												<br>
                                                <div id="checkResult" 
													 style="font-size : 0.8em; display : none;">
												</div> <br>
                                                
                                                
                                            <input type="password" class="form-control form-control-user"
                                                id="currentPassword" name="currentPassword" required aria-describedby="emailHelp"
                                                placeholder="현재 비밀번호"> <br>
                                                
                                            <input type="password" class="form-control form-control-user"
                                                id="memberPw" name="newPassword" required aria-describedby="emailHelp"
                                                placeholder="변경할 비밀번호">       <br> 
                                                
                                            <input type="password" class="form-control form-control-user"
                                                id="memberPwConfirm"  required aria-describedby="emailHelp"
                                                placeholder="변경할 비밀번호 확인">       <br>  
                                                
                                            <span class="signUp-message" id="pwMessage" name="pwMessage"></span>      
                                                 
                                        </div>
                                        <button type="submit" class="btn btn-outline-info btn-user btn-block" disabled>
                                            	비밀번호 변경
                                        </button>
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
    
    <script>
    
    $(function() {
		const $idInput = $("#updatePassword input[name=userId]");

		$idInput.keyup(function() {
			// 입력된 값이 영어와 숫자로만 구성되고, 6글자부터 14글자까지인지를 확인
			const regEx = /^[A-Za-z0-9]{6,14}$/;
			
			if(regEx.test($idInput.val())) {
				// ajax로 아이디 중복 확인 요청 보내기
				$.ajax({
					url : "idCheck.me",
					type : "get",
					data : {
						checkId : $idInput.val()
					},
					success : function(result) {
						console.log("성공");
						if(result == "NNNNN") {
							
							$("#checkResult").show()
											.css("color", "green")
											.text("정확해요.");
							
							
						} else {
							
							$("#checkResult").show().css("color", "red").text("존재하지 않는 아이디입니다.");
							
						}
					},
					error : function() {
						console.log("아이디 중복 체크용 ajax 통신 실패!");
					}
				});
			} else {
				
				
				// $("#checkResult").hide(); // 메세지 숨기기
				$("#checkResult").show()
											.css("color", "red")
											.text("유효하지 않은 형식입니다.");
			}
		});
	});
    
    
    
    
    const checkObj = {
    	    
    	    "memberPw": false
    	    
    	}
    
    
    
 // 비밀번호 / 비밀번호 확인 유효성 검사

	const memberPw = document.getElementById("memberPw");
	const memberPwConfirm = document.getElementById("memberPwConfirm");
	const pwMessage = document.getElementById("pwMessage")



	// 비밀번호 입력시 유효성 검사
	memberPw.addEventListener("input", ()=>{

		if(memberPw.value.trim().length == 0 ){
			memberPw.value="";
		
			pwMessage.innerText=""

			$("#pwMessage").css("color", "black");

			pwMessage.classList.remove("confirm","error"); //검정글씨
			
			checkObj.memberPw = false
			return;
		}
		
		// 정규표현식을 이용한 비밀번호 유효성 검사
		//영어 숫자, 특수 문자(!,@,#,-,_) 6~20글자사이
		const regEx = /^[A-Za-z0-9\!\@\#\-\_]{6,14}$/
	
		// 입력한 비밀번호가 유효한 경우 
		if(regEx.test(memberPw.value) ){
			checkObj.memberPw = true;
			
			// 비밀번호가 유효하게 작성된 상태에서 
			// 비밀번호 확인이 입력되지 않았을 때 
			if(memberPwConfirm.value.trim().length ==0){
				$("#pwMessage").css("color", "green");

				pwMessage.innerText="유효한 비밀번호 형식입니다";
				pwMessage.classList.add("confirm");
				pwMessage.classList.remove("error");
			}else{
				// 비밀번호가 유효하게 작성된 상태에서 
				// 비밀번호 확인이 입력되어 있을 때 

				// 비밀번호 == 비밀번호 확인 (같은경우)
				if(memberPwConfirm.value == memberPw.value){
					$("#pwMessage").css("color", "green");


					pwMessage.innerText="비밀번호가 일치 합니다.";
					pwMessage.classList.add("confirm");
					pwMessage.classList.remove("error");
		
					checkObj.memberPwConfirm = true;
				}else{ //다른 경우 
					$("#pwMessage").css("color", "red").css("font-size", "15px");

					pwMessage.innerText="비밀번호가 일치하지 않습니다.";
					pwMessage.classList.remove("confirm");
					pwMessage.classList.add("error");
		
					checkObj.memberPwConfirm = false;
				}
			}
		
		
		}else{
			//유효하지 않은 경우 
			$("#pwMessage").css("color", "red").css("font-size", "15px");

			pwMessage.innerText="비밀번호 형식이 유효 하지 않습니다.";
			pwMessage.classList.add("error");
			pwMessage.classList.remove("confirm");
			checkObj.memberPw = false;
			
			
		}
	})

	memberPwConfirm.addEventListener("input", ()=>{

		if(checkObj.memberPw){ //비밀번호가 유효하게 작성된 경우에

			//비밀번호 == 비밀번호 확인(같을 경우)
			if(memberPwConfirm.value == memberPw.value){
			$("#pwMessage").css("color", "green");
			$("#updatePassword button[type=submit]").attr("disabled", false);


				pwMessage.innerText="비밀번호가 일치 합니다.";
				pwMessage.classList.add("confirm");
				pwMessage.classList.remove("error");

				checkObj.memberPwConfirm = true;
			}else{ //다른 경우 
			$("#pwMessage").css("color", "red");

				pwMessage.innerText="비밀번호가 일치하지 않습니다.";
				pwMessage.classList.remove("confirm");
				pwMessage.classList.add("error");

				checkObj.memberPwConfirm = false;

			}

		}else{ //비밀번호가 유효하지 않은 경우
			// memberPw가 유효하지 않으면 memberPwConfirm도 유효하지 않음
			checkObj.memberPwConfirm = false;
		}
		})
    
    

 

 
</script>




</body>

</html>
