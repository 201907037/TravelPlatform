<!-- 유진 - 관리자 여행지 추가 페이지 (2024.06.10) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="adminCommon.jsp"></jsp:include>
	<!-- 패딩 영역 -->
	<div style="width: 100%; padding:50px;">
	<!-- 내부 영역 -->
	<div class="card mb-4" style="width: 100%;">
        <div class="card-header">
            <!-- <i class="fas fa-pen"></i> -->
            <i class="fas fa-edit"></i>
           	여행지 추가
        </div>
        
        <!-- 유진 - 관리자 여행지 추가 페이지 초안 완성 (2024.06.11) -->
        <div class="card-body">
        	<div class="form-group">
	        	<form id="tourEnroll" action="adminTourInsert.ad" method="post"  enctype="multipart/form-data">
	        		<label>대표이미지 설정(필수) :</label>
                    <input type="file" class="form-control" name="thumbImg" id="thumbImgInput" required>
                    <div id="checkResult" 
						 style="font-size : 0.8em; display : none;">
					</div>
					
					<script>
		        		// 파일 선택 시 이벤트 처리
		                $("#thumbImgInput").change(function() {
		                    const fileName = $(this).val(); // 선택한 파일의 경로를 가져옴
		                    const fileExt = fileName.split('.').pop().toLowerCase(); // 파일의 확장자 추출 및 소문자로 변환
		                    
		                    // 허용된 확장자 목록 설정
		                    const allowedExts = ['jpg', 'jpeg', 'png'];
		                    
		                    // 확장자가 허용된 목록에 포함되는지 확인
		                    if (allowedExts.indexOf(fileExt) === -1) {
		                        // 허용되지 않는 확장자일 경우
		                        $("#checkResult").show()
		                        				 .text("허용되지 않는 파일 형식입니다. (허용되는 파일 형식 : JPG, JPEG, PNG)")
		                        				 .css("color", "red");
		                        // 파일 선택 초기화
		                        $(this).val("");
		                    } else {
		                        // 허용된 확장자일 경우
		                        $("#checkResult").show().text("올바른 파일 형식입니다.").css("color", "green");
		                    }
		                });
					</script>
					
					<br>
					
					<label>참고이미지들(선택) :</label>
					<input type="file" class="form-control" name="changeNo" id="imgInput" multiple required>
					<div id="checkResult2" 
						 style="font-size : 0.8em; display : none;">
					</div>
					
					
					<script>
						/*
						let resultText = "추가된 파일들 : ";
						let count = 0;
						
						$(function() {
								// 파일 선택 시 이벤트 처리
						     $("#imgInput").change(function() {
						         const files = $(this)[0].files; // 선택한 모든 파일들 가져오기
						         
						         // 허용된 확장자 : .jpg, .jpeg, .png
						         const allowedExts = ['jpg', 'jpeg', 'png'];
						         let validFileNames = []; // 허용된 파일들의 이름을 저장할 배열
						         
						      	// 기존에 선택된 파일들의 이름 배열에 추가
						         $("#checkResult2").text().split(', ').forEach(function(fileName) {
						             validFileNames.push(fileName);
						         });
						         
						         let lastFileName = "";
						         
						         // 새로 선택된 파일들의 확장자 검사 후 허용된 확장자만 validFileNames 배열에 추가
						         for(let i = 0; i < files.length; i++) {
						             const fileExt = files[i].name.split('.').pop().toLowerCase(); // 파일의 확장자 추출 및 소문자로 변환
						             if(allowedExts.indexOf(fileExt) !== -1) {
						                 validFileNames.push(files[i].name);
						                 // console.log(files[i].name);
						                 lastFileName = files[i].name;
						             }
						         }
						         
						         // console.log(files);
						         resultText = joinString(resultText, lastFileName, count);
						      	
						         // console.log(resultText);
						      	// console.log(lastFileName);
						      	
						      	// 허용된 파일들 출력
						         if (validFileNames.length > 0) {
						         	$("#checkResult2").show().text(resultText).css("color", "green");	
						         } else {
						             $("#checkResult2").show().html("허용되지 않는 파일 형식입니다.").css("color", "red");
						         }
						         
						         count += 1;
						     });
						 
						 	function joinString(resultText, lastFileName, count){
						 		if(count == 0){
						 			resultText += lastFileName;
						 		}else{
						 			resultText = resultText + ", " + lastFileName;
						 		}
						 		
						 		return resultText;
						 	}
						 });
						*/
					</script>
					
                    
                    <br> 
	   				
					<label for="tourType">여행지 분류 :</label>
				  	<select class="form-control" id="tourType">
				  		<option>-- 선택 --</option>
				    	<option value="tourSpot">관광지</option>
				    	<option value="lodging">숙박시설</option>
				    	<option value="restaurant">식당/카페</option>
				    	<option value="leports">레포츠</option>
				  	</select>
			  	
					<br>

					<div id="tourEnrollForm">
	        		</div>
	        	</form>
			</div>
        </div>
        
        <script>
	        $(function () {
	            $("#tourType").change(function () {
	            	
	            	// 선택한 옵션 태그의 value 값 가져오기
	                let selectedOption = $(this).val();
	                
	                // 기존에 있던 폼 비우기
	                $("#tourEnrollForm").empty();
	                
	                // 선택된 옵션에 따라 다른 폼이 뜸
	                switch(selectedOption) {
                    case "tourSpot":
                        $("#tourEnrollForm").html("<label>여행지명 :</label>" + 
												  "<input type='text' class='form-control' name='tourName' required>" + "<br>" + 
												  "<label>주소 :</label>" + 
												  "<input type='text' class='form-control' name='address' required>" + "<br>" + 
												  "<label>이용시간 :</label>" + 
												  "<input type='text' class='form-control' name='useTime' required>" + "<br>" + 
												  "<label>전화번호 :</label>" + 
												  "<input type='text' class='form-control' name='tel' required>" + "<br>" + 
												  "<label>운영시기 :</label>" + 
												  "<input type='text' class='form-control' name='season' required>" + "<br>" + 
												  "<label>애견 동반 가능 여부 :</label>" + "<br>" + 
												  "<input type='radio' id='petY' name='pet' value='petY' style='cursor: pointer;' checked><label for='petY' style='cursor: pointer;'>&nbsp;예</label>" + 
												  "&nbsp;&nbsp;&nbsp;" + 
												  "<input type='radio' id='petN' name='pet' value='petN' style='cursor: pointer;'><label for='petN' style='cursor: pointer;'>&nbsp;아니오</label>" + "<br>" + 
												  "<div align='center'><button type='submit' class='btn btn-success'>등록하기</button>" + 
												  "&nbsp;&nbsp;&nbsp;" + 
												  "<button type='reset' class='btn btn-danger'>초기화</button></div>");
                        break;
                    case "lodging":
                        $("#tourEnrollForm").html("<label>여행지명 :</label>" + 
												  "<input type='text' class='form-control' name='tourName' required>" + "<br>" + 
												  "<label>주소 :</label>" + 
												  "<input type='text' class='form-control' name='address' required>" + "<br>" + 
												  "<label>전화번호 :</label>" + 
												  "<input type='text' class='form-control' name='tel' required>" + "<br>" + 
												  "<label>체크인시간 :</label>" + 
												  "<input type='text' class='form-control' name='checkIn' required>" + "<br>" + 
												  "<label>체크아웃시간 :</label>" + 
												  "<input type='text' class='form-control' name='checkOut' required>" + "<br>" + 
												  "<label>객실타입 :</label>" + "<br>" + 
												  "<input type='radio' id='yangok' name='roomType' value='yangok' style='cursor: pointer;' checked><label for='yangok' style='cursor: pointer;'>&nbsp;양옥</label>" + 
												  "&nbsp;&nbsp;&nbsp;" + 
												  "<input type='radio' id='hanok' name='roomType' value='hanok' style='cursor: pointer;'><label for='hanok' style='cursor: pointer;'>&nbsp;한옥</label>" + "<br><br>" + 
												  "<label>취사 가능 여부 :</label>" + "<br>" + 
												  "<input type='radio' id='cookY' name='cook' value='cookY' style='cursor: pointer;' checked><label for='cookY' style='cursor: pointer;'>&nbsp;예</label>" + 
												  "&nbsp;&nbsp;&nbsp;" + 
												  "<input type='radio' id='cookN' name='cook' value='cookN' style='cursor: pointer;'><label for='cookN' style='cursor: pointer;'>&nbsp;아니오</label>" + "<br><br>" + 
												  "<label>주차 가능 여부 :</label>" + "<br>" + 
												  "<input type='radio' id='parkingY' name='parking' value='parkingY' style='cursor: pointer;' checked><label for='parkingY' style='cursor: pointer;'>&nbsp;예</label>" + 
												  "&nbsp;&nbsp;&nbsp;" + 
												  "<input type='radio' id='parkingN' name='parking' value='parkingN' style='cursor: pointer;'><label for='parkingN' style='cursor: pointer;'>&nbsp;아니오</label>" + "<br>" + 
												  "<div align='center'><button type='submit' class='btn btn-success'>등록하기</button>" + 
												  "&nbsp;&nbsp;&nbsp;" + 
												  "<button type='reset' class='btn btn-danger'>초기화</button></div>");
                        break;
                    case "restaurant":
                        $("#tourEnrollForm").html("<label>여행지명 :</label>" + 
												  "<input type='text' class='form-control' name='tourName' required>" + "<br>" + 
												  "<label>주소 :</label>" + 
												  "<input type='text' class='form-control' name='address' required>" + "<br>" + 
												  "<label>전화번호 :</label>" + 
												  "<input type='text' class='form-control' name='tel' required>" + "<br>" + 
												  "<label>오픈시간 :</label>" + 
												  "<input type='text' class='form-control' name='openTime' required>" + "<br>" + 
												  "<label>휴무일 :</label>" + 
												  "<input type='text' class='form-control' name='restDate' required>" + "<br>" + 
												  "<label>대표메뉴 :</label>" + 
												  "<input type='text' class='form-control' name='firstMenu' required>" + "<br>" + 
												  "<label>전체메뉴 :</label>" + 
												  "<input type='text' class='form-control' name='treatMenu' required>" + "<br>" + 
												  "<label>유아놀이방 유무 :</label>" + "<br>" + 
												  "<input type='radio' id='kidRoomY' name='kidRoom' value='kidRoomY' style='cursor: pointer;' checked><label for='kidRoomY' style='cursor: pointer;'>&nbsp;예</label>" + 
												  "&nbsp;&nbsp;&nbsp;" + 
												  "<input type='radio' id='kidRoomN' name='kidRoom' value='kidRoomN' style='cursor: pointer;'><label for='kidRoomN' style='cursor: pointer;'>&nbsp;아니오</label>" + "<br>" + 
												  "<div align='center'><button type='submit' class='btn btn-success'>등록하기</button>" + 
												  "&nbsp;&nbsp;&nbsp;" + 
												  "<button type='reset' class='btn btn-danger'>초기화</button></div>");
                        break;
                    case "leports":
                        $("#tourEnrollForm").html("<label>여행지명 :</label>" + 
												  "<input type='text' class='form-control' name='tourName' required>" + "<br>" + 
												  "<label>주소 :</label>" + 
												  "<input type='text' class='form-control' name='address' required>" + "<br>" + 
												  "<label>이용시간 :</label>" + 
												  "<input type='text' class='form-control' name='useTime' required>" + "<br>" + 
												  "<label>전화번호 :</label>" + 
												  "<input type='text' class='form-control' name='tel' required>" + "<br>" + 
												  "<label>애견 동반 가능 여부 :</label>" + "<br>" + 
												  "<input type='radio' id='petY' name='pet' value='petY' style='cursor: pointer;' checked><label for='petY' style='cursor: pointer;'>&nbsp;예</label>" + 
												  "&nbsp;&nbsp;&nbsp;" + 
												  "<input type='radio' id='petN' name='pet' value='petN' style='cursor: pointer;'><label for='petN' style='cursor: pointer;'>&nbsp;아니오</label>" + "<br><br>" + 
												  "<label>주차 가능 여부 :</label>" + "<br>" + 
												  "<input type='radio' id='parkingY' name='parking' value='parkingY' style='cursor: pointer;' checked><label for='parkingY' style='cursor: pointer;'>&nbsp;예</label>" + 
												  "&nbsp;&nbsp;&nbsp;" + 
												  "<input type='radio' id='parkingN' name='parking' value='parkingN' style='cursor: pointer;'><label for='parkingN' style='cursor: pointer;'>&nbsp;아니오</label>" + "<br>" + 
												  "<div align='center'><button type='submit' class='btn btn-success'>등록하기</button>" + 
												  "&nbsp;&nbsp;&nbsp;" + 
												  "<button type='reset' class='btn btn-danger'>초기화</button></div>");
                        break;
                    default:
                        break;
	                }
	            });
        	});
        </script>
        
        <footer class="py-4 bg-light mt-auto">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">Copyright &copy; Your Website 2023</div>
                </div>
            </div>
        </footer>
        </div>
    </div>
</body>
</html>