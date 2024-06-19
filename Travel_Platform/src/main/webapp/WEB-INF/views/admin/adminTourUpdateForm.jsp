<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<style>
	#imgInput-holder td { padding-right: 20px; }
	
	.imgInputCheck {
		font-size : 0.8em;
		display : none;
	}
	
	.orginImgs { font-size : 0.8em; }
</style>
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
           	여행지 수정
        </div>
        
        <!-- 유진 - 관리자 여행지 수정 페이지 초안 완성 (2024.06.18) -->
        <div class="card-body">
        	<div class="form-group">
	        	<form id="tourUpdate" action="adminTourUpdate.ad" method="post" enctype="multipart/form-data">
	        		<input type="hidden" name="tourNo" value="${ tour.tourNo }">
	        		
	        		<label>대표이미지 (필수) :</label>
                    <input type="file" class="form-control" name="reThumbImgFile" id="thumbImgInput" required>
                    <div id="originThumbImg" class="orginImgs">
                    	 원본 파일 : ${tour.thumbImg.substring(tour.thumbImg.lastIndexOf('_') + 1)}
                    	 <input type="hidden" name="originThumbImg" value="${ tour.thumbImg }">
                    </div>
                    <div id="checkResult" class="imgInputCheck">
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
					
					<label>참고이미지들 (최대 4개까지 선택 가능) :</label> <br>
					<table id="imgInput-holder">
						<tr>
							<td>
								<input type="file" class="form-control" name="reChangeNoFiles" id="imgInput">
							</td>
							<td>
								<input type="file" class="form-control" name="reChangeNoFiles" id="imgInput2">
							</td>
							<td>
								<input type="file" class="form-control" name="reChangeNoFiles" id="imgInput3">
							</td>
							<td>
								<input type="file" class="form-control" name="reChangeNoFiles" id="imgInput4">
							</td>
						</tr>
						<tr>
							<td>
								<div id="checkResult2" class="imgInputCheck">
								</div>
							</td>
							<td>
								<div id="checkResult3" class="imgInputCheck">
								</div>
							</td>
							<td>
								<div id="checkResult4" class="imgInputCheck">
								</div>
							</td>
							<td>
								<div id="checkResult5" class="imgInputCheck">
								</div>
							</td>
						</tr>
					</table>
					
					<script>
		        		// 파일 선택 시 이벤트 처리
		                $("#imgInput").change(function() {
		                    const fileName = $(this).val(); // 선택한 파일의 경로를 가져옴
		                    const fileExt = fileName.split('.').pop().toLowerCase(); // 파일의 확장자 추출 및 소문자로 변환
		                    
		                    // 허용된 확장자 목록 설정
		                    const allowedExts = ['jpg', 'jpeg', 'png'];
		                    
		                    // 확장자가 허용된 목록에 포함되는지 확인
		                    if (allowedExts.indexOf(fileExt) === -1) {
		                        // 허용되지 않는 확장자일 경우
		                        $("#checkResult2").show()
		                        				 .text("허용되지 않는 파일 형식입니다.")
		                        				 .css("color", "red");
		                        // 파일 선택 초기화
		                        $(this).val("");
		                    } else {
		                        // 허용된 확장자일 경우
		                        $("#checkResult2").show().text("올바른 파일 형식입니다.").css("color", "green");
		                    }
		                });
		        		
		        		
		             	// 파일 선택 시 이벤트 처리
		                $("#imgInput2").change(function() {
		                    const fileName = $(this).val(); // 선택한 파일의 경로를 가져옴
		                    const fileExt = fileName.split('.').pop().toLowerCase(); // 파일의 확장자 추출 및 소문자로 변환
		                    
		                    // 허용된 확장자 목록 설정
		                    const allowedExts = ['jpg', 'jpeg', 'png'];
		                    
		                    // 확장자가 허용된 목록에 포함되는지 확인
		                    if (allowedExts.indexOf(fileExt) === -1) {
		                        // 허용되지 않는 확장자일 경우
		                        $("#checkResult3").show()
		                        				 .text("허용되지 않는 파일 형식입니다.")
		                        				 .css("color", "red");
		                        // 파일 선택 초기화
		                        $(this).val("");
		                    } else {
		                        // 허용된 확장자일 경우
		                        $("#checkResult3").show().text("올바른 파일 형식입니다.").css("color", "green");
		                    }
		                });
		             
		             
		             	// 파일 선택 시 이벤트 처리
		                $("#imgInput3").change(function() {
		                    const fileName = $(this).val(); // 선택한 파일의 경로를 가져옴
		                    const fileExt = fileName.split('.').pop().toLowerCase(); // 파일의 확장자 추출 및 소문자로 변환
		                    
		                    // 허용된 확장자 목록 설정
		                    const allowedExts = ['jpg', 'jpeg', 'png'];
		                    
		                    // 확장자가 허용된 목록에 포함되는지 확인
		                    if (allowedExts.indexOf(fileExt) === -1) {
		                        // 허용되지 않는 확장자일 경우
		                        $("#checkResult4").show()
		                        				 .text("허용되지 않는 파일 형식입니다.")
		                        				 .css("color", "red");
		                        // 파일 선택 초기화
		                        $(this).val("");
		                    } else {
		                        // 허용된 확장자일 경우
		                        $("#checkResult4").show().text("올바른 파일 형식입니다.").css("color", "green");
		                    }
		                });
		             	
		             	
		             	// 파일 선택 시 이벤트 처리
		                $("#imgInput4").change(function() {
		                    const fileName = $(this).val(); // 선택한 파일의 경로를 가져옴
		                    const fileExt = fileName.split('.').pop().toLowerCase(); // 파일의 확장자 추출 및 소문자로 변환
		                    
		                    // 허용된 확장자 목록 설정
		                    const allowedExts = ['jpg', 'jpeg', 'png'];
		                    
		                    // 확장자가 허용된 목록에 포함되는지 확인
		                    if (allowedExts.indexOf(fileExt) === -1) {
		                        // 허용되지 않는 확장자일 경우
		                        $("#checkResult5").show()
		                        				 .text("허용되지 않는 파일 형식입니다.")
		                        				 .css("color", "red");
		                        // 파일 선택 초기화
		                        $(this).val("");
		                    } else {
		                        // 허용된 확장자일 경우
		                        $("#checkResult5").show().text("올바른 파일 형식입니다.").css("color", "green");
		                    }
		                });
					</script>

                    <br>
                    
                    <label>여행지명 :</label>
				    <input type="text" class="form-control" name="tourName" value="${ tour.tourName }" required> <br>
				    <label>주소 :</label>
				    <input type="text" class="form-control" name="address" value="${ tour.address }" required> <br>
	   				
					<label for="tourType">여행지 분류 :</label>
				  	<select class="form-control" id="tourType" name="tourType" data-tour-type="${ tour.tourType }">
				  		<option>-- 선택 --</option>
				    	<option value="tourSpot">관광지</option>
				    	<option value="lodging">숙박시설</option>
				    	<option value="restaurant">식당/카페</option>
				    	<option value="leports">레포츠</option>
				  	</select>

					<br>

					<div id="tourEnrollForm">
	        			<c:choose>
					  		<c:when test="${ tour.tourType eq 'tourSpot' }">
					  			<label>전화번호 :</label>
	    				    	<input type="text" class="form-control" name="tel" value="" required> <br> 
	                        	<label>이용시간 :</label>
								<input type="text" class="form-control" name="useTime" required> <br> 
								<label>운영시기 :</label>
								<input type="text" class="form-control" name="season" required> <br> 
								<label>애견 동반 가능 여부 :</label> <br> 
								<input type="radio" id="petY" name="pet" value="Y" style="cursor: pointer;" checked><label for="petY" style="cursor: pointer;">&nbsp;예</label> 
								&nbsp;&nbsp;&nbsp;
								<input type="radio" id="petN" name="pet" value="N" style="cursor: pointer;"><label for="petN" style="cursor: pointer;">&nbsp;아니오</label> <br> 
								<div align="center"><button type="submit" class="btn btn-success">수정하기</button>
								&nbsp;&nbsp;&nbsp; 
								<button type="reset" class="btn btn-danger">초기화</button></div>
					  		</c:when>
					  		<c:when test="${ tour.tourType eq 'lodging' }">
					  			<label>전화번호 :</label>
						  	    <input type="text" class="form-control" name="tel" required> <br> 
	                  			<label>체크인시간 :</label>
							    <input type="text" class="form-control" name="checkIn" required> <br> 
							    <label>체크아웃시간 :</label>
							    <input type="text" class="form-control" name="checkOut" required> <br> 
							    <label>객실타입 :</label> <br> 
							    <input type="radio" id="yangok" name="roomType" value="yangok" style="cursor: pointer;" checked><label for="yangok" style="cursor: pointer;">&nbsp;양옥</label>
							    &nbsp;&nbsp;&nbsp;
							    <input type="radio" id="hanok" name="roomType" value="hanok" style="cursor: pointer;"><label for="hanok" style="cursor: pointer;">&nbsp;한옥</label> <br><br> 
							    <label>취사 가능 여부 :</label> <br> 
							    <input type="radio" id="cookY" name="cook" value="Y" style="cursor: pointer;" checked><label for="cookY" style="cursor: pointer;">&nbsp;예</label>
							    &nbsp;&nbsp;&nbsp;
							    <input type="radio" id="cookN" name="cook" value="N" style="cursor: pointer;"><label for="cookN" style="cursor: pointer;">&nbsp;아니오</label> <br><br> 
							    <label>주차 가능 여부 :</label> <br> 
							    <input type="radio" id="parkingY" name="parking" value="Y" style="cursor: pointer;" checked><label for="parkingY" style="cursor: pointer;">&nbsp;예</label>
							    &nbsp;&nbsp;&nbsp;
							    <input type="radio" id="parkingN" name="parking" value="N" style="cursor: pointer;"><label for="parkingN" style="cursor: pointer;">&nbsp;아니오</label> <br> 
							    <div align="center"><button type="submit" class="btn btn-success">수정하기</button>
							    &nbsp;&nbsp;&nbsp;
							    <button type="reset" class="btn btn-danger">초기화</button></div>
					  		</c:when>
					  		<c:when test="${ tour.tourType eq 'restaurant' }">
					  			<label>전화번호 :</label>
					  			<input type="text" class="form-control" name="tel" required> <br> 
	                        	<label>오픈시간 :</label>
								<input type="text" class="form-control" name="openTime" required> <br> 
								<label>휴무일 :</label>
								<input type="text" class="form-control" name="restDate" required> <br> 
								<label>대표메뉴 :</label>
								<input type="text" class="form-control" name="firstMenu" required> <br> 
								<label>전체메뉴 :</label>
								<input type="text" class="form-control" name="treatMenu" required> <br> 
								<label>유아놀이방 유무 :</label> <br> 
								<input type="radio" id="kidRoomY" name="kidRoom" value="Y" style="cursor: pointer;" checked><label for="kidRoomY" style="cursor: pointer;">&nbsp;예</label>
								&nbsp;&nbsp;&nbsp;
								<input type="radio" id="kidRoomN" name="kidRoom" value="N" style="cursor: pointer;"><label for="kidRoomN" style="cursor: pointer;">&nbsp;아니오</label> <br> 
								<div align="center"><button type="submit" class="btn btn-success">수정하기</button>
								&nbsp;&nbsp;&nbsp;
								<button type="reset" class="btn btn-danger">초기화</button></div>
					  		</c:when>
					  		<c:otherwise>
					  			<label>전화번호 :</label>
					  			<input type="text" class="form-control" name="tel" required> <br> 
	                        	<label>이용시간 :</label>
								<input type="text" class="form-control" name="useTime" required> <br> 
								<label>애견 동반 가능 여부 :</label> <br> 
								<input type="radio" id="petY" name="pet" value="Y" style="cursor: pointer;" checked><label for="petY" style="cursor: pointer;">&nbsp;예</label>
								&nbsp;&nbsp;&nbsp;
								<input type="radio" id="petN" name="pet" value="N" style="cursor: pointer;"><label for="petN" style="cursor: pointer;">&nbsp;아니오</label> <br><br> 
								<label>주차 가능 여부 :</label> <br> 
								<input type="radio" id="parkingY" name="parking" value="Y" style="cursor: pointer;" checked><label for="parkingY" style="cursor: pointer;">&nbsp;예</label>
								&nbsp;&nbsp;&nbsp;
								<input type="radio" id="parkingN" name="parking" value="N" style="cursor: pointer;"><label for="parkingN" style="cursor: pointer;">&nbsp;아니오</label> <br> 
								<div align="center"><button type="submit" class="btn btn-success">수정하기</button>
								&nbsp;&nbsp;&nbsp;
								<button type="reset" class="btn btn-danger">초기화</button></div>
					  		</c:otherwise>
					  	</c:choose>
	        		</div>
	        	</form>
	        	
	        	<script>
					$(function () {
				        var tourType = $("#tourType").data("tour-type");
				        console.log("지금 선택한 tour 의 tourType : " + tourType);
				        if (tourType) {
				            $("#tourType").val(tourType);
				        }
				    });
				</script>
			</div>
        </div>
        
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