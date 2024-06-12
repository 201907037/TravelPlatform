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
   
   
   </style>
</head>
<body>
    
    <!-- 메뉴바 -->
    <jsp:include page="../common/header1.jsp" />
    
	<div class="content">
        <br><br>
        <div class="innerOuter">
            
            <br>

            <form action="insert.me" method="post" id="enrollForm">
                <div class="form-group">
                    <label for="userId">ID : </label>
                    <input type="text" class="form-control" id="userId" placeholder="Please Enter ID" name="userId" required> <br>
					<div id="checkResult" 
						 style="font-size : 0.8em; display : none;">
					</div>
					<br>

                    <label for="userPwd">Password : </label>
                    <input type="password" class="form-control" id="memberPw" placeholder="Please Enter Password" name="userPwd" required> <br>

                    <label for="checkPwd">Password Check : </label>
                    <input type="password" class="form-control" id="memberPwConfirm" placeholder="Please Enter Password" required> <br>
                    
                    <span class="signUp-message" id="pwMessage">영어,숫자,특수문자(!,@,#,-,_) 6~20글자 사이로 입력해주세요.</span> <br><br> 

                    <label for="userName">Name : </label>
                    <input type="text" class="form-control" id="name" placeholder="Please Enter Name" name="name" required> <br>
                    
                    <label for="userName"> &nbsp; 닉네임 :  </label>
                    <input type="text" class="form-control" id="nickName" placeholder="Please Enter Name" name="nickName" required> <br>

                    <label for="email"> &nbsp; Email : </label>
                    <input type="text" class="form-control" id="email" placeholder="Please Enter Email" name="email"> <br>

                    <label for="age"> &nbsp; Age : </label>
                    <input type="number" class="form-control" id="age" placeholder="Please Enter Age" name="age"> <br>

                    <label for="phone"> &nbsp; Phone : </label>
                    <input type="tel" class="form-control" id="phone" placeholder="Please Enter Phone (-없이)" name="phone"> <br>
                    
                    
                    
                    <input type="text" id="sample4_postcode" name="address" placeholder="우편번호">
					<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample4_roadAddress" name="address" placeholder="도로명주소" size="60" ><br>
					<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소"  size="60">
					<span id="guide" style="color:#999;display:none"></span>
					<input type="text" id="sample4_detailAddress" name="address" placeholder="상세주소"  size="60"><br>
					<input type="hidden" id="sample4_extraAddress" placeholder="참고항목"  size="60">
					<input type="hidden" id="sample4_engAddress" placeholder="영문주소"  size="60" ><br>
					
                    
                    <label for=""> &nbsp; Gender : </label> &nbsp;&nbsp;
                    <input type="radio" id="Male" value="남" name="gender" checked>
                    <label for="Male">남자</label> &nbsp;&nbsp;
                    <input type="radio" id="Female" value="여" name="gender">
                    <label for="Female">여자</label> &nbsp;&nbsp;
                </div> 
                <br>
                <div class="btns" align="center">
                    <button type="submit" class="btn btn-primary">회원가입</button>
                    <button type="reset" class="btn btn-danger">초기화</button>
                </div>
            </form>
        </div>
        <br><br>
        
        <script>
        
        	$(function() {
        		
        		// 아이디를 입력하는 input 요소 객체를 변수에 담아두기
        		const $idInput = $("#enrollForm input[name=userId]");
        		
        		// 아이디를 입력할때마다 실시간으로 아이디 중복 체크
        		// > "keyup" 이벤트 활용
        		$idInput.keyup(function() {
        			
        			// console.log($idInput.val());
        			// > 사용자가 실시간으로 입력한 아이디값을 중복체크 시 요청값으로 넘기기
        			
        			// 우선, 아이디값이 최소 5글자 이상으로 입력되어 있을 때에만
        			// ajax 를 요청해서 중복체크 하기!!
        			// (유료 DB 제품은 실행하는 쿼리문의 갯수가 몇개냐에 따라 요금제가 지정됨)
        			
        			if($idInput.val().length >= 5) {
        				// 5글자 이상일 때
        				// > ajax 로 아이디 중복확인 요청 보내기
        				
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
        							
        							// 빨간색 메세지로 출력
        							$("#checkResult").show()
        											 .css("color", "red")
        											 .text("이미 사용중이거나 탈퇴한 회원의 아이디입니다. 다시 입력해주세요.");
        							
        							// 회원가입버튼 비활성화
        							$("#enrollForm button[type=submit]").attr("disabled", true);
        							
        							
        							
        						} else {
        							// 사용 가능한 아이디일 경우
        							
        							// 초록색 메세지로 출력
        							$("#checkResult").show();
        							$("#checkResult").css("color", "green");
        							$("#checkResult").text("멋진 아이디네요!");
        							
        							// 회원가입버튼 활성화
        							$("#enrollForm button[type=submit]").attr("disabled", false);
        							
        						}
        						
        					},
        					error : function() {
        						console.log("아이디 중복 체크용 ajax 통신 실패!");
        					}
        				});
        				
        			} else {
        				// 5글자 미만일 때	
        				
        				// 회원가입버튼 비활성화
        				$("#enrollForm button[type=submit]").attr("disabled", true);
        				
        				// 메세지 숨기기
        				$("#checkResult").hide();
        				
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
        	
            
            
         // 비밀번호 / 비밀번호 확인 유효성 검사

            const memberPw = document.getElementById("memberPw");
            const memberPwConfirm = document.getElementById("memberPwConfirm");
            const pwMessage = document.getElementById("pwMessage")



            // 비밀번호 입력시 유효성 검사
            memberPw.addEventListener("input", ()=>{

                if(memberPw.value.trim().length == 0 ){
                    memberPw.value="";
                 
                    pwMessage.innerText="영어,숫자,특수문자(!,@,#,-,_) 6~20글자 사이로 입력해주세요."
                    pwMessage.classList.remove("confirm","error"); //검정글씨
                    
                    checkObj.memberPw = false
                    return;
                }
                
                // 정규표현식을 이용한 비밀번호 유효성 검사
                
                const regEx = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;

               
                // 입력한 비밀번호가 유효한 경우 
                if(regEx.test(memberPw.value) ){
                    checkObj.memberPw = true;
                    
                    // 비밀번호가 유효하게 작성된 상태에서 
                    // 비밀번호 확인이 입력되지 않았을 때 
                    if(memberPwConfirm.value.trim().length ==0){
                        pwMessage.innerText="유효한 비밀번호 형식입니다";
                        pwMessage.classList.add("confirm");
                         pwMessage.classList.remove("error");
                    }else{
                        // 비밀번호가 유효하게 작성된 상태에서 
                        // 비밀번호 확인이 입력되어 있을 때 

                        // 비밀번호 == 비밀번호 확인 (같은경우)
                        if(memberPwConfirm.value == memberPw.value){

                            pwMessage.innerText="비밀번호가 일치 합니다.";
                            pwMessage.classList.add("confirm");
                            pwMessage.classList.remove("error");
                
                            checkObj.memberPwConfirm = true;
                        }else{ //다른 경우 
                            pwMessage.innerText="비밀번호가 일치하지 않습니다.";
                            pwMessage.classList.remove("confirm");
                            pwMessage.classList.add("error");
                
                            checkObj.memberPwConfirm = false;
                        }
                    }
                   
                   
                }else{
                    //유효하지 않은 경우 
                    pwMessage.innerText="비밀번호 형식이 유효 하지 않습니다.";
                    pwMessage.classList.add("error");
                    pwMessage.classList.remove("confirm");
                    checkObj.memberPw = false;

                }
            })

            //비밀번호 확인 유효성 검사
            memberPwConfirm.addEventListener("input", ()=>{

                if(checkObj.memberPw){ //비밀번호가 유효하게 작성된 경우에

                    //비밀번호 == 비밀번호 확인(같을 경우)
                    if(memberPwConfirm.value == memberPw.value){

                        pwMessage.innerText="비밀번호가 일치 합니다.";
                        pwMessage.classList.add("confirm");
                        pwMessage.classList.remove("error");

                        checkObj.memberPwConfirm = true;
                    }else{ //다른 경우 
                        pwMessage.innerText="비밀번호가 일치하지 않습니다.";
                        pwMessage.classList.remove("confirm");
                        pwMessage.classList.add("error");

                        checkObj.memberPwConfirm = false;

                    }

                }else{ //비밀번호가 유효하지 않은 경우
                   
                    checkObj.memberPwConfirm = false;

                }
            })
            
            
            
        </script>

    </div>

	

    

    <!-- 푸터바 -->
    <jsp:include page="../common/footer1.jsp" />

</body>
</html>