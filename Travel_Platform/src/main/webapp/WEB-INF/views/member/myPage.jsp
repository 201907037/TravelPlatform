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
					
					<input type="button" id="mail-Check-Btn" class="btn btn-outline-secondary" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br><br><br>
					
					<input type="text" class="form-control" id="sample4_roadAddress" name="roadAddress" placeholder="도로명주소"  size="60" disabled><br><br>
					<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소" name="jibunAddress"  size="60">
					<span id="guide" style="color:#0f0f0f;display:none"></span> <br><br>
					<input type="text" class="form-control" id="sample4_detailAddress" name="detailAddress" value="${ sessionScope.loginUser.address }"  size="60" required><br>
					<input type="hidden" id="sample4_extraAddress" placeholder="참고항목"  size="60">
					<input type="hidden" id="sample4_engAddress" placeholder="영문주소"  size="60" ><br>
					
                    
                   
                 
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
        $('#name, #nickName, #phone, #sample4_detailAddress').on('input', enableSubmitButton);

        // 우편번호 찾기 기능
        function sample4_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("sample4_extraAddress").value = extraAddr;
                    
                    } else {
                        document.getElementById("sample4_extraAddress").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample4_postcode').value = data.zonecode;
                    document.getElementById("sample4_roadAddress").value = addr;
                    document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                    
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("sample4_detailAddress").focus();
                    enableSubmitButton();
                }
            }).open();
        }

        </script>
</body>
</html>
