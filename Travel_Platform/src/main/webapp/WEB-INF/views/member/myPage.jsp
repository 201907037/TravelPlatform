<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    
    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    
     <!-- 부트스트랩에서 제공하고 있는 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
   
   	<!-- alertify 연동 구문 -->
   	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/alertify.min.js"></script>
	
	<!-- CSS -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/alertify.min.css"/>
    <!-- Default theme -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/default.min.css"/>
    <!-- Semantic UI theme -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/semantic.min.css"/>
	
	
   
   
   <style>

	body{
		background-size: cover;
		background-color: #fff;
	}


   #updateForm{
   	
   	width : 50%;
   	height : 55%;
	
	padding: 24px;
	border-radius: 20px;
	
	background-color: whitesmoke;
	





	
   }
   
   form{
    margin: auto;
   }

   form label{
	color: black;
	font-weight: bold;
   }

   

   .form-control{
	border-width: 0 0 1px;
	background-color: whitesmoke;
   }

   #sample4_detailAddress{
	border-width: 0 0 1px;
	
   }

   #sample4_postcode{
	border-width: 0 0 1px;

	border-bottom: lightgrey;

   }

   #sample4_roadAddress{
	border-width: 0 0 1px;
	
	border-bottom: none;


   }

   
   
   a{
            color: black;
        }

   a:hover{
       color: black;
       text-decoration: none;
   }

   #guide{
	font-weight: bold;
   }

   #title{
	text-align: center;
   }

   

	.form-control:focus{
	border-color: crimson;
	box-shadow: none;
	background-color: whitesmoke;
   }

   

   

  

   

   #dd{
    font-size: 30px;
   }

   
   
   </style>
</head>
<body background="resources/image/pado.gif">
    
    <!-- 메뉴바 -->
    <jsp:include page="../common/header1.jsp" />
    
	<div class="content">
        <br><br><br><br><br>
        <div class="innerOuter">
			
            
            <br><br><br>

            <form id="updateForm" action="update.me" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <h1 id="title">프로필 편집</h1>
					<br><br>
                    
                    <input type="text" class="form-control" id="userId" value="${ sessionScope.loginUser.userId }" name="userId" maxlength="14" required style="display: none;"> <br>
					<div id="checkResult" 
						 style="font-size : 0.8em; display : none;">
					</div>
					<br><br>

                    

                    <label for="userName">이름 : </label>
                    <input type="text" class="form-control" id="name" value="${ sessionScope.loginUser.name }" name="name" required maxlength="30"> <br><br>
                    
                    <label for="nickName">닉네임 :  </label>
                    <input type="text" class="form-control currentNick"  id="nickName" value="${ sessionScope.loginUser.nickName }" name="nickName" maxlength="8" required> <br>
                    <div id="checkResult1" 
						 style="font-size : 0.8em; display : none;">
					</div>
					<br><br>

                    <label for="profileImage">프로필 사진</label> <br>
                    <input type="file" name="profileImageFile" id="profileImage" onchange="previewImage(this);" /><br><br>
                    <img id="profile-preview" src="resources/profileImages" alt="Preview" style="display:none; width: 100px; height: 100px; border-radius: 70px;">
                    
                    
                    

                   
                    
                  
					<br><br>

                

                    <label for="phone">전화번호 : </label>
                    <input type="tel" class="form-control" id="phone" value="${ sessionScope.loginUser.phone }" name="phone" maxlength="11"> <br>
                    
                    <span class="signUp-message" id="telMessage"></span> <br><br>
                    
                    
                    
                    
					
					
                    
                   
                 
                <br>
                <div class="btns" align="center">
                    <button type="submit" class="btn btn-outline-info" id="new" disabled>수정하기</button>
                    <button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#deleteForm">회원탈퇴</button>
                </div>
                </div>
            </form>
        </div>
        <br><br>

         <!-- 회원탈퇴 버튼 클릭 시 보여질 Modal -->
    <div class="modal fade" id="deleteForm">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 id="dd" class="modal-title">회원탈퇴</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <form action="delete.me" method="post">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div align="center">
                            탈퇴 후 복구가 불가능합니다. <br>
                            정말로 탈퇴 하시겠습니까? <br>
                        </div>
                        <br>
                            <label for="userPwd" class="mr-sm-2">비밀번호 : </label>
                            <input type="password" class="form-control mb-2 mr-sm-2" placeholder="다시 한번 생각해 보세요." id="userPwd" name="userPwd" required> <br>
                            <!-- 회원 탈퇴 시 PK 에 해당하는 회원의 아이디도 같이 넘겨야함 -->
                            <input type="hidden" name="userId" value="${ sessionScope.loginUser.userId }">
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer" align="center">
                        <button type="submit" class="btn btn-danger">탈퇴하기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
        
        <script>
        
        // phone 숫자만 받게 하는 스크립트
        
        $("#phone").keyup(function(event){
        	
        	var inputVal = $(this).val();
        	$(this).val(inputVal.replace(/[^0-9]/g, ''));
        	
        });


        // 전화번호 유효성 검사
        const phone= document.getElementById("phone");
            	const telMessage = document.getElementById("telMessage");

            	phone.addEventListener("input", ()=>{

            	    if(!phone.value.trim().length ==0){

            	        const regEx = /^0(1[01679]|2|[3-6][1-5]|70)\d{3,4}\d{4}$/;

            	        if(regEx.test(phone.value)){
            	        $("#updateForm button[type=submit]").attr("disabled", false);
						$("#telMessage").css("color", "green");

            	            telMessage.innerText="유효한 전화번호입니다.";
            	            telMessage.classList.add("confirm");
            	            telMessage.classList.remove("error");
            	    
            	            checkObj.phone=true;
            	            
            	        }else{
            	       	$("#updateForm button[type=submit]").attr("disabled", true);
						$("#telMessage").css("color", "red");

            	            telMessage.innerText="전화번호가 유효하지 않습니다.";
            	            telMessage.classList.add("error");
            	            telMessage.classList.remove("confirm");
            	           
            	            checkObj.phone=false;
            	        }


            	    }else{
						$("#telMessage").css("color", "black");
						
            	        telMessage.innerText = ""
            	        telMessage.classList.remove("confirm", "error");


            	        checkObj.phone=false;
            	       
            	    }
            	    


            	})
            	
            	
           	
            	
            	

            $(function() {
			const $idInput = $("#updateForm input[name=userId]");

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
								// 사용 불가능한 아이디일 경우
								$("#checkResult").show()
												.css("color", "red")
												.text("이미 사용중이거나 탈퇴한 회원의 아이디입니다. 다시 입력해주세요.");
								
							} else {
								// 사용 가능한 아이디일 경우
								$("#checkResult").show().css("color", "green").text("멋진 아이디네요!");
								
							}
						},
						error : function() {
							console.log("아이디 중복 체크용 ajax 통신 실패!");
						}
					});
				} else {
					// 입력된 값이 조건에 맞지 않을 때	
					
					// $("#checkResult").hide(); // 메세지 숨기기
					$("#checkResult").show()
												.css("color", "red")
												.text("사용 할 수 없는 아이디입니다.");
				}
			});
		});
		
		
		
        $(function() {
            const $nickInput = $("#updateForm input[name=nickName]");
            const currentNick = $(".currentNick").val();  // 현재 사용자의 닉네임 가져오기

            $nickInput.keyup(function() {
                const regEx = /^[A-Za-z가-힣0-9]{2,8}$/;

                if (regEx.test($nickInput.val())) {
                    // 입력한 닉네임이 현재 사용자의 닉네임과 다를 때만 AJAX 요청 보내기
                    if ($nickInput.val() !== currentNick) {
                        $.ajax({
                            url: "nickCheck.me",
                            type: "get",
                            data: {
                                checkNick: $nickInput.val()
                            },
                            success: function(result) {
                                console.log("성공");
                                if (result === "NNNNN") {
                                    $("#checkResult1").show()
                                        .css("color", "red")
                                        .text("이미 사용중인 닉네임입니다.");
                                } else {
                                    $("#checkResult1").show()
                                        .css("color", "green")
                                        .text("멋진 닉네임이에요!");
                                }
                            },
                            error: function() {
                                console.log("닉네임 중복 체크용 ajax 통신 실패!");
                            }
                        });
                    } else {
                        // 현재 사용자의 닉네임과 입력한 닉네임이 동일한 경우
                        $("#checkResult1").show()
                            .css("color", "green")
                            .text("");
                    }
                } else {
                    // 입력된 값이 조건에 맞지 않을 때    
                    $("#updateForm button[type=submit]").attr("disabled", true);
                    $("#checkResult1").show()
                        .css("color", "red")
                        .text("사용 할 수 없는 닉네임입니다");
                }
            });
        });

        // 프로필 사진 미리보기 기능 추가
        function previewImage(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#profile-preview').attr('src', e.target.result).show();
                };

                reader.readAsDataURL(input.files[0]);
            } else {
                $('#profile-preview').hide();
            }
            enableSubmitButton();
        }

        // 수정사항이 있을 때 버튼 활성화
        function enableSubmitButton() {
            $('#new').prop('disabled', false);
        }

        // 모든 입력 필드에 변경 이벤트 리스너 추가
        $('#name, #nickName').on('input', enableSubmitButton);

       

        </script>
</body>
</html>
