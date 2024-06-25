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

   #mail-Check-Btn{
	background-color: cadetblue;
	border: none;
   }

   #new{
	background-color: rgb(176, 196, 222);
   }

   #reset{
	background-color: salmon;
	color: #fff;
   }

   .btn:focus{
	border: none;
	box-shadow: none;
   }

   #dd{
    font-size: 30px;
   }

   
   
   </style>
</head>
<body >
    
    <!-- 메뉴바 -->
    <jsp:include page="../common/header1.jsp" />
    
	<div class="content">
        <br><br><br><br><br>
        <div class="innerOuter">
			<h1 id="title">프로필 편집</h1>
            
            <br><br><br>

            <form id="updateForm" action="update.me" method="post" enctype="multipart/form-data">
                <div class="form-group">
					<br>
                    
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
                    
                    
                    
                    <input type="text" class="form-control" id="sample4_postcode" name="postcode" placeholder="우편번호" disabled><br>
					
					<input type="button" id="mail-Check-Btn" class="btn btn-primary" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br><br><br>
					
					<input type="text" class="form-control" id="sample4_roadAddress" name="roadAddress" placeholder="도로명주소"  size="60" disabled><br><br>
					<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소" name="jibunAddress"  size="60">
					<span id="guide" style="color:#0f0f0f;display:none"></span> <br><br>
					<input type="text" class="form-control" id="sample4_detailAddress" name="detailAddress" value="${ sessionScope.loginUser.address }"  size="60" required><br>
					<input type="hidden" id="sample4_extraAddress" placeholder="참고항목"  size="60">
					<input type="hidden" id="sample4_engAddress" placeholder="영문주소"  size="60" ><br>
					
                    
                   
                 
                <br>
                <div class="btns" align="center">
                    <button type="submit" class="btn" id="new" >수정하기</button>
                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteForm">회원탈퇴</button>
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
                            <label for="userPwd" class="mr-sm-2">Password : </label>
                            <input type="password" class="form-control mb-2 mr-sm-2" placeholder="Enter Password" id="userPwd" name="userPwd" required> <br>
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
        	$(this).val(inputVal.replace(/[^0-9]/gi,''));
        	
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
                    $("#checkResult1").show()
                        .css("color", "red")
                        .text("사용 할 수 없는 닉네임입니다");
                }
            });
        });


		
		
		
		
		
		
        	
        	
        	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
            function sample4_execDaumPostcode() {
                new daum.Postcode({
                    oncomplete: function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                        // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var roadAddr = data.roadAddress; // 도로명 주소 변수
                        var extraRoadAddr = ''; // 참고 항목 변수

                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraRoadAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                           extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraRoadAddr !== ''){
                            extraRoadAddr = ' (' + extraRoadAddr + ')';
                        }

                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        document.getElementById('sample4_postcode').value = data.zonecode;
                        document.getElementById("sample4_roadAddress").value = roadAddr;
                        document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                 
                        document.getElementById("sample4_engAddress").value = data.addressEnglish;
                               
                        // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                        if(roadAddr !== ''){
                            document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                        } else {
                            document.getElementById("sample4_extraAddress").value = '';
                        }

                        var guideTextBox = document.getElementById("guide");
                        // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                        if(data.autoRoadAddress) {
                            var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                            guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                            guideTextBox.style.display = 'block';

                        } else if(data.autoJibunAddress) {
                            var expJibunAddr = data.autoJibunAddress;
                            guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                            guideTextBox.style.display = 'block';
                        } else {
                            guideTextBox.innerHTML = '';
                            guideTextBox.style.display = 'none';
                        }
                    }
                }).open();
            }
        	
        	
        	
        	
        	
        	
            	

				

            	

				
            	

            	


            	// 전화번호 유효성 검사
            	const phone= document.getElementById("phone");
            	const telMessage = document.getElementById("telMessage");

            	phone.addEventListener("input", ()=>{

            	    if(!phone.value.trim().length ==0){

            	        const regEx = /^0(1[01679]|2|[3-6][1-5]|70)\d{3,4}\d{4}$/;

            	        if(regEx.test(phone.value)){
						$("#telMessage").css("color", "green");

            	            telMessage.innerText="유효한 전화번호입니다.";
            	            telMessage.classList.add("confirm");
            	            telMessage.classList.remove("error");
            	    
            	            checkObj.phone=true;
            	            
            	        }else{
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

            	

            function previewImage(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#profile-preview').attr('src', e.target.result);
                    $('#profile-preview').css('display', 'block');
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
        	
            
            
         
            
            
            
        </script>

    </div>

	

    

    <!-- 푸터바 -->
    

</body>
</html>