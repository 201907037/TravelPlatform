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
   	
	
	<!-- CSS -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/alertify.min.css"/>
	
	
   
   
   <style>
   #enrollForm{
   	
   	width : 70%;
   	height : 60%;
   }
   
   form{
    margin: auto;
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
<body>
    
    <!-- 메뉴바 -->
    <jsp:include page="../common/header1.jsp" />
    
	<div class="content">
        <br><br>
        <div class="innerOuter">
            
            <br>

            <form action="insert.me" method="post" id="enrollForm" name="enrollForm">
                <div class="form-group">
                    <label for="userId">아이디 : </label>
                    <input type="text" class="form-control" id="userId" placeholder="6 ~ 14글자로 생성해주세요." name="userId" maxlength="14" required> <br>
					<div id="checkResult" 
						 style="font-size : 0.8em; display : none;">
					</div>
					<br>

                    <label for="userPwd">비밀번호 : </label>
                    <input type="password" class="form-control" id="memberPw" placeholder="Please Enter Password" name="userPwd" maxlength="14" required> <br>

                    <label for="memberPwConfirm">비밀번호 확인 : </label>
                    <input type="password" class="form-control" id="memberPwConfirm" placeholder="Please Enter Password" maxlength="14" required> <br>
                    
                   	<span class="signUp-message" id="pwMessage" name="pwMessage">영어,숫자,특수문자(!,@,#,-,_) 6~14글자 사이로 입력해주세요.</span> <br><br>

                    <label for="userName">이름 : </label>
                    <input type="text" class="form-control" id="name" placeholder="Please Enter Name" name="name" required maxlength="30"> <br>
                    
                    <label for="nickName"> &nbsp; 닉네임 :  </label>
                    <input type="text" class="form-control" id="nickName" placeholder="2 ~ 8글자로 생성해주세요." name="nickName" maxlength="8" required> <br>
                    <div id="checkResult1" 
						 style="font-size : 0.8em; display : none;">
					</div>
                    
                    

                   
                    
                   <div class="form-group email-form">
						 <label for="email">이메일</label>
						 <div class="input-group">
						<input type="text" class="form-control" name="email1" id="userEmail1" placeholder="이메일" required>
						<select class="form-control" name="email2" id="userEmail2" >
						<option>@naver.com</option>
						<option>@daum.net</option>
						<option>@gmail.com</option>
						<option>@hanmail.com</option>
						 <option>@yahoo.co.kr</option>
						</select>
						
						
						
						
					
					
						  
					<div class="input-group-addon">
						<button type="button" class="btn btn-primary" id="mail-Check-Btn">본인인증</button>
					</div>
					</div>
					
					<div id="checkResult2" 
						 style="font-size : 0.8em; display : none;">
						</div>
					
					<br>
					
						<div class="mail-check-box">
					<input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
					</div>
						<span id="mail-check-warn"></span>
					</div>

                    <label for="age"> &nbsp; 나이 : </label>
                    <input type="number" class="form-control" id="age" placeholder="Please Enter Age" name="age"> <br>

                    <label for="phone"> &nbsp; 전화번호 : </label>
                    <input type="tel" class="form-control" id="phone" placeholder="Please Enter Phone (-없이)" name="phone" maxlength="11"> <br>
                    
                    <span class="signUp-message" id="telMessage">전화번호를 입력해주세요.(- 제외)</span> <br><br>
                    
                    
                    
                    <input type="text" id="sample4_postcode" name="address" placeholder="우편번호" disabled>
					<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample4_roadAddress" name="address" placeholder="도로명주소" size="60" disabled><br>
					<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소"  size="60">
					<span id="guide" style="color:#999;display:none"></span>
					<input type="text" id="sample4_detailAddress" name="address" placeholder="상세주소"  size="60" required><br>
					<input type="hidden" id="sample4_extraAddress" placeholder="참고항목"  size="60">
					<input type="hidden" id="sample4_engAddress" placeholder="영문주소"  size="60" ><br>
					
                    
                    <label for=""> &nbsp; 성별 : </label> &nbsp;&nbsp;
                    <input type="radio" id="Male" value="남" name="gender" checked>
                    <label for="Male">남자</label> &nbsp;&nbsp;
                    <input type="radio" id="Female" value="여" name="gender">
                    <label for="Female">여자</label> &nbsp;&nbsp;
                 
                <br>
                <div class="btns" align="center">
                    <button type="submit" class="btn btn-primary" disabled>회원가입</button>
                    <button type="reset" class="btn btn-danger">초기화</button>
                </div>
                </div>
            </form>
        </div>
        <br><br>
        
        <script>
        
        // phone 숫자만 받게 하는 스크립트
        
        $("#phone").keyup(function(event){
        	
        	var inputVal = $(this).val();
        	$(this).val(inputVal.replace(/[^0-9]/gi,''));
        	
        })
        
        
         $(document).ready(function(){    
        	 $("input[name=email]").keyup(function(event){    
        		 if (!(event.keyCode >=37 && event.keyCode<=40)) {    
        			 var inputVal = $(this).val();    $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));   }  });});

        
        
        
        
        // var email = document.getElementById("userEmail1") + document.getElementById("userEmail2");
        
        function generateRandomNumber() {
	    // Math.random()은 0 (포함)과 1 (제외) 사이의 부동 소수점 난수를 반환합니다.
	    // 이 값을 888888으로 곱한 후, 111111을 더하여 111111 ~ 999999 범위의 난수를 생성합니다.
	    return Math.floor(Math.random() * 888888) + 111111;
	}
        
        
	    $('#mail-Check-Btn').click(function() {
	    const email = document.getElementById("userEmail1").value + document.getElementById("userEmail2").value;
	    console.log('완성된 이메일 : ' + email); // 이메일 확인
	    
	    const checkInput = $('.mail-check-input'); // 인증번호 입력란
	    const randomNumber = generateRandomNumber();
	    $.ajax({
	        type: 'GET',
	        url: '/travely/mailCheck.do',
	        data: { email: email,
	        		randomNumber : randomNumber}, // 이메일을 파라미터로 전달
	        success: function(data) {
	            console.log("data : " +  randomNumber); // 서버에서 받은 데이터 출력
	            checkInput.prop('disabled', false); // 입력란 활성화
	            code = data; // 받은 데이터를 코드 변수에 저장
	            alert('인증번호가 전송되었습니다.');
	        },
	        error: function(xhr, status, error) {
	            console.error("에러 발생: " + error); // 오류 메시지 출력
	        }
	    });
	});

// 인증번호 비교
$('.mail-check-input').blur(function () {
    const inputCode = $(this).val(); // 입력된 인증번호
    const $resultMsg = $('#mail-check-warn'); // 결과 메시지 영역
    
    if (inputCode === code) {
        $resultMsg.html('인증번호가 일치합니다.');
        $resultMsg.css('color', 'green');
        $('#mail-Check-Btn').prop('disabled', true); // 버튼 비활성화
        $('#userEmail1').prop('readonly', true); // 이메일 입력란 읽기 전용 처리
        $('#userEmail2').prop('readonly', true); // 이메일 입력란 읽기 전용 처리
        $('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
        $('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
        $("#enrollForm button[type=submit]").prop("disabled", false); // 폼 제출 버튼 활성화
    } else {
        $resultMsg.html('인증번호가 일치하지 않습니다. 다시 확인해주세요.');
        $resultMsg.css('color', 'red');
        $("#enrollForm button[type=submit]").prop("disabled", true); // 폼 제출 버튼 비활성화
    }
});


		$(function() {
			const $idInput = $("#enrollForm input[name=userId]");

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
					$("#enrollForm button[type=submit]").attr("disabled", true);
					// $("#checkResult").hide(); // 메세지 숨기기
					$("#checkResult").show()
												.css("color", "red")
												.text("사용 할 수 없는 아이디입니다.");
				}
			});
		});
		
		
		
		$(function() {
			const $nickInput = $("#enrollForm input[name=nickName]");

			$nickInput.keyup(function() {
				
				const regEx = /^[A-Za-z가-힣0-9]{2,8}$/
				
				if(regEx.test($nickInput.val())) {
					
					$.ajax({
						url : "nickCheck.me",
						type : "get",
						data : {
							checkNick : $nickInput.val()
						},
						success : function(result) {
							console.log("성공");
							if(result == "NNNNN") {
								
								$("#checkResult1").show()
												.css("color", "red")
												.text("이미 사용중인 닉네임입니다.");
								
							} else {
								
								$("#checkResult1").show().css("color", "green").text("멋진 닉네임이에요!");
								
							}
						},
						error : function() {
							console.log("닉네임 중복 체크용 ajax 통신 실패!");
						}
					});
				} else {
					// 입력된 값이 조건에 맞지 않을 때	
					$("#enrollForm button[type=submit]").attr("disabled", true);
					// $("#checkResult").hide(); // 메세지 숨기기
					$("#checkResult1").show()
												.css("color", "red")
												.text("사용 할 수 없는 닉네임입니다");
				}
			});
		});
		
		
		
		
		
		$(function() {
			const $emailInput = $("#enrollForm input[name=email1]");

			$emailInput.keyup(function() {
				
				const regEx = /^[A-Za-z0-9]{4,30}$/
				
				if(regEx.test($emailInput.val())) {
					
					$.ajax({
						url : "emailCheck.me",
						type : "get",
						data : {
							checkEmail : $emailInput.val()
						},
						success : function(result) {
							console.log("성공");
							if(result == "NNNNN") {
								
								$("#checkResult2").show()
												.css("color", "red")
												.text("이미 사용중인 이메일입니다.");
								$('#mail-Check-Btn').prop('disabled', true); // 버튼 비활성화
								
							} else {
								
								$("#checkResult2").show().css("color", "green").text("멋진 이메일이에요!");
								$('#mail-Check-Btn').prop('disabled', false); // 버튼 활성화
								
							}
						},
						error : function() {
							console.log("이메일 중복 체크용 ajax 통신 실패!");
						}
					});
				} else {
					// 입력된 값이 조건에 맞지 않을 때	
					$("#enrollForm button[type=submit]").attr("disabled", true);
					// $("#checkResult").hide(); // 메세지 숨기기
					$("#checkResult2").show()
												.css("color", "red")
												.text("사용 할 수 없는 이메일입니다");
					$('#mail-Check-Btn').prop('disabled', true); // 버튼 비활성화
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
        	
        	
        	
        	
        	
        	
            const checkObj = {
            	    
            	    "memberPw": false,
            	    "memberPwConfirm" : false,
            	    
            	    "phone" : false
            	}

				

            	

				// 비밀번호 / 비밀번호 확인 유효성 검사

				const memberPw = document.getElementById("memberPw");
				const memberPwConfirm = document.getElementById("memberPwConfirm");
				const pwMessage = document.getElementById("pwMessage")



				// 비밀번호 입력시 유효성 검사
				memberPw.addEventListener("input", ()=>{

					if(memberPw.value.trim().length == 0 ){
						memberPw.value="";
					
						pwMessage.innerText="영어,숫자,특수문자(!,@,#,-,_) 6~14글자 사이로 입력해주세요."

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
								$("#pwMessage").css("color", "red");

								pwMessage.innerText="비밀번호가 일치하지 않습니다.";
								pwMessage.classList.remove("confirm");
								pwMessage.classList.add("error");
					
								checkObj.memberPwConfirm = false;
							}
						}
					
					
					}else{
						//유효하지 않은 경우 
						$("#pwMessage").css("color", "red");

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
						
            	        telMessage.innerText = "전화번호를 입력해주세요.(- 제외)"
            	        telMessage.classList.remove("confirm", "error");


            	        checkObj.phone=false;
            	       
            	    }
            	    


            	})

            	// 회원가입 form태그가 제출 되었을 때
            	document.getElementById("enrollForm").addEventListener("submit", (e)=>{

            	    for( let key in checkObj ){

            	        if(!checkObj[key]){

            	            switch(key){
            	                
            	                case "memberPw" : alert("비밀번호가 유효하지 않습니다."); break;
            	                case "memberPwConfirm" : alert("비밀번호가 확인되지 않았습니다"); break;
            	                
            	                case "phone" : alert("전화번호가 유효하지 않습니다.");  break;
            	            }

            	            document.getElementById(key).focus();
            	            e.preventDefault();
            	            return; 

            	        }
            	        
            	    }

            	})
        	
            
            
         
            
            
            
        </script>

    </div>

	

    

    <!-- 푸터바 -->
    <jsp:include page="../common/footer1.jsp" />

</body>
</html>