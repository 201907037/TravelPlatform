<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
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
                    	  현재 파일 : ${tour.thumbImg.substring(tour.thumbImg.lastIndexOf('_') + 1)}
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
							<c:set var="imgs" value="${ imgList }" />
					
							<c:if test="${ not empty imgs }">
							    <c:forEach var="extraImg" items="${ imgs }" varStatus="loop">
							    	<td>
							    		<div id="originChangeNo${ loop.index + 1 }" class="orginImgs">
											현재 파일 : ${ extraImg.changeNo.substring(extraImg.changeNo.lastIndexOf('_') + 1) }
								        </div>
							    	</td>
							    </c:forEach>
							</c:if>
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
		                        				  s.css("color", "red");
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
				    	<option value="tourSpot" ${ tour.tourType eq 'tourSpot' ? 'selected' : '' }>관광지</option>
					    <option value="lodging" ${ tour.tourType eq 'lodging' ? 'selected' : '' }>숙박시설</option>
					    <option value="restaurant" ${ tour.tourType eq 'restaurant' ? 'selected' : '' }>식당/카페</option>
					    <option value="leports" ${ tour.tourType eq 'leports' ? 'selected' : '' }>레포츠</option>
				  	</select>
				  	
					<br>

					<div id="tourEnrollForm">
						<c:set var="detail" value="${ rtMap.list }" />
	        			<c:choose>
					  		<c:when test="${ tour.tourType eq 'tourSpot' }">
					  			<label>전화번호 :</label>
	    				    	<input type="text" class="form-control" name="tel" value="${ detail.tel }" required> <br>
	                        	<label>이용시간 :</label>
								<input type="text" class="form-control" name="useTime" value="${ detail.useTime }" required> <br>
								<label>운영시기 :</label>
								<input type="text" class="form-control" name="season" value="${ detail.season }" required> <br>
								<label>애견 동반 가능 여부 :</label> <br>
								<c:choose>
									<c:when test="${ detail.pet.trim() eq 'Y' }">
										<input type="radio" id="petY" name="pet" value="Y" style="cursor: pointer;" checked><label for="petY" style="cursor: pointer;">&nbsp;예</label>
										&nbsp;&nbsp;&nbsp;
										<input type="radio" id="petN" name="pet" value="N" style="cursor: pointer;"><label for="petN" style="cursor: pointer;">&nbsp;아니오</label> <br>
									</c:when>
									<c:otherwise>
										<input type="radio" id="petY" name="pet" value="Y" style="cursor: pointer;"><label for="petY" style="cursor: pointer;">&nbsp;예</label>
										&nbsp;&nbsp;&nbsp;
										<input type="radio" id="petN" name="pet" value="N" style="cursor: pointer;" checked><label for="petN" style="cursor: pointer;">&nbsp;아니오</label> <br>
									</c:otherwise>
								</c:choose>
								<div align="center"><button type="submit" class="btn btn-success">수정하기</button>
								&nbsp;&nbsp;&nbsp; 
								<button type="reset" class="btn btn-danger">초기화</button></div>
					  		</c:when>
					  		<c:when test="${ tour.tourType eq 'lodging' }">
					  			<label>전화번호 :</label>
						  	    <input type="text" class="form-control" name="tel" value="${ detail.tel }" required> <br>
	                  			<label>체크인시간 :</label>
							    <input type="text" class="form-control" name="checkIn" value="${ detail.checkIn }" required> <br>
							    <label>체크아웃시간 :</label>
							    <input type="text" class="form-control" name="checkOut" value="${ detail.checkOut }" required> <br>
							    <label>객실타입 :</label> <br>
							    <c:choose>
									<c:when test="${ detail.roomType.trim() eq 'yangok' }">
								        <input type="radio" id="yangok" name="roomType" value="yangok" style="cursor: pointer;" checked><label for="yangok" style="cursor: pointer;">&nbsp;양옥</label>
								        &nbsp;&nbsp;&nbsp;
								        <input type="radio" id="hanok" name="roomType" value="hanok" style="cursor: pointer;"><label for="hanok" style="cursor: pointer;">&nbsp;한옥</label> <br><br>
								    </c:when>
								    <c:otherwise>
								        <input type="radio" id="yangok" name="roomType" value="yangok" style="cursor: pointer;"><label for="yangok" style="cursor: pointer;">&nbsp;양옥</label>
								        &nbsp;&nbsp;&nbsp;
								        <input type="radio" id="hanok" name="roomType" value="hanok" style="cursor: pointer;" checked><label for="hanok" style="cursor: pointer;">&nbsp;한옥</label> <br><br>
								    </c:otherwise>
								</c:choose>
							    <label>취사 가능 여부 :</label> <br>
							    <c:choose>
									<c:when test="${ detail.cook.trim() eq 'Y' }">
										<input type="radio" id="cookY" name="cook" value="Y" style="cursor: pointer;" checked><label for="cookY" style="cursor: pointer;">&nbsp;예</label>
							    		&nbsp;&nbsp;&nbsp;
							    		<input type="radio" id="cookN" name="cook" value="N" style="cursor: pointer;"><label for="cookN" style="cursor: pointer;">&nbsp;아니오</label> <br><br>
									</c:when>
									<c:otherwise>
										<input type="radio" id="cookY" name="cook" value="Y" style="cursor: pointer;"><label for="cookY" style="cursor: pointer;">&nbsp;예</label>
							    		&nbsp;&nbsp;&nbsp;
							    		<input type="radio" id="cookN" name="cook" value="N" style="cursor: pointer;" checked><label for="cookN" style="cursor: pointer;">&nbsp;아니오</label> <br><br>
									</c:otherwise>
								</c:choose>
							    <label>주차 가능 여부 :</label> <br>
							    <c:choose>
									<c:when test="${ detail.parking.trim() eq 'Y' }">
										<input type="radio" id="parkingY" name="parking" value="Y" style="cursor: pointer;" checked><label for="parkingY" style="cursor: pointer;">&nbsp;예</label>
							    		&nbsp;&nbsp;&nbsp;
							    		<input type="radio" id="parkingN" name="parking" value="N" style="cursor: pointer;"><label for="parkingN" style="cursor: pointer;">&nbsp;아니오</label> <br>
									</c:when>
									<c:otherwise>
										<input type="radio" id="parkingY" name="parking" value="Y" style="cursor: pointer;"><label for="parkingY" style="cursor: pointer;">&nbsp;예</label>
							    		&nbsp;&nbsp;&nbsp;
							    		<input type="radio" id="parkingN" name="parking" value="N" style="cursor: pointer;" checked><label for="parkingN" style="cursor: pointer;">&nbsp;아니오</label> <br>
									</c:otherwise>
								</c:choose>
							    <div align="center"><button type="submit" class="btn btn-success">수정하기</button>
							    &nbsp;&nbsp;&nbsp;
							    <button type="reset" class="btn btn-danger">초기화</button></div>
					  		</c:when>
					  		<c:when test="${ tour.tourType eq 'restaurant' }">
					  			<label>전화번호 :</label>
					  			<input type="text" class="form-control" name="tel" value="${ detail.tel }" required> <br>
	                        	<label>오픈시간 :</label>
								<input type="text" class="form-control" name="openTime" value="${ detail.openTime }" required> <br>
								<label>휴무일 :</label>
								<input type="text" class="form-control" name="restDate" value="${ detail.restDate }" required> <br>
								<label>대표메뉴 :</label>
								<input type="text" class="form-control" name="firstMenu" value="${ detail.firstMenu }" required> <br>
								<label>전체메뉴 :</label>
								<input type="text" class="form-control" name="treatMenu" value="${ detail.treatMenu }" required> <br>
								<label>유아놀이방 유무 :</label> <br>
								<c:choose>
									<c:when test="${ detail.kidRoom.trim() eq 'Y' }">
										<input type="radio" id="kidRoomY" name="kidRoom" value="Y" style="cursor: pointer;" checked><label for="kidRoomY" style="cursor: pointer;">&nbsp;예</label>
										&nbsp;&nbsp;&nbsp;
										<input type="radio" id="kidRoomN" name="kidRoom" value="N" style="cursor: pointer;"><label for="kidRoomN" style="cursor: pointer;">&nbsp;아니오</label> <br>
									</c:when>
									<c:otherwise>
										<input type="radio" id="kidRoomY" name="kidRoom" value="Y" style="cursor: pointer;"><label for="kidRoomY" style="cursor: pointer;">&nbsp;예</label>
										&nbsp;&nbsp;&nbsp;
										<input type="radio" id="kidRoomN" name="kidRoom" value="N" style="cursor: pointer;" checked><label for="kidRoomN" style="cursor: pointer;">&nbsp;아니오</label> <br>
									</c:otherwise>
								</c:choose>
								<div align="center"><button type="submit" class="btn btn-success">수정하기</button>
								&nbsp;&nbsp;&nbsp;
								<button type="reset" class="btn btn-danger">초기화</button></div>
					  		</c:when>
					  		<c:otherwise>
					  			<label>전화번호 :</label>
					  			<input type="text" class="form-control" name="tel" value="${ detail.tel }" required> <br>
	                        	<label>이용시간 :</label>
								<input type="text" class="form-control" name="useTime" value="${ detail.useTime }" required> <br>
								<label>애견 동반 가능 여부 :</label> <br>
								<c:choose>
									<c:when test="${ detail.pet.trim() eq 'Y' }">
										<input type="radio" id="petY" name="pet" value="Y" style="cursor: pointer;" checked><label for="petY" style="cursor: pointer;">&nbsp;예</label>
										&nbsp;&nbsp;&nbsp;
										<input type="radio" id="petN" name="pet" value="N" style="cursor: pointer;"><label for="petN" style="cursor: pointer;">&nbsp;아니오</label> <br>
									</c:when>
									<c:otherwise>
										<input type="radio" id="petY" name="pet" value="Y" style="cursor: pointer;"><label for="petY" style="cursor: pointer;">&nbsp;예</label>
										&nbsp;&nbsp;&nbsp;
										<input type="radio" id="petN" name="pet" value="N" style="cursor: pointer;" checked><label for="petN" style="cursor: pointer;">&nbsp;아니오</label> <br><br>
									</c:otherwise>
								</c:choose>
								<label>주차 가능 여부 :</label> <br>
								<c:choose>
									<c:when test="${ detail.parking.trim() eq 'Y' }">
										<input type="radio" id="parkingY" name="parking" value="Y" style="cursor: pointer;" checked><label for="parkingY" style="cursor: pointer;">&nbsp;예</label>
							    		&nbsp;&nbsp;&nbsp;
							    		<input type="radio" id="parkingN" name="parking" value="N" style="cursor: pointer;"><label for="parkingN" style="cursor: pointer;">&nbsp;아니오</label> <br>
									</c:when>
									<c:otherwise>
										<input type="radio" id="parkingY" name="parking" value="Y" style="cursor: pointer;"><label for="parkingY" style="cursor: pointer;">&nbsp;예</label>
							    		&nbsp;&nbsp;&nbsp;
							    		<input type="radio" id="parkingN" name="parking" value="N" style="cursor: pointer;" checked><label for="parkingN" style="cursor: pointer;">&nbsp;아니오</label> <br>
									</c:otherwise>
								</c:choose>
								<div align="center"><button type="submit" class="btn btn-success">수정하기</button>
								&nbsp;&nbsp;&nbsp;
								<button type="reset" class="btn btn-danger">초기화</button></div>
					  		</c:otherwise>
					  	</c:choose>
	        		</div>
	        	</form>
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