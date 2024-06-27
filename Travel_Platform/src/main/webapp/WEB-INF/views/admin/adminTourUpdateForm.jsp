<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ef0943861331616097f6a71fe10b40e2&libraries=services"></script>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<style>
	#imgInput-holder td { padding-right: 20px; }
	
	.imgInputCheck {
		font-size : 0.8em;
		display : none;
	}
	
	.orginImgs, .changeNotion { font-size : 0.8em; }
	
	.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
	.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
	.map_wrap {position:relative;width:600px;height:350px;}
	#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
	.bg_white {background:#fff;}
	#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
	#menu_wrap .option{text-align: center;}
	#menu_wrap .option p {margin:10px 0;}  
	#menu_wrap .option button {margin-left:5px;}
	#placesList li {list-style: none;}
	#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
	#placesList .item span {display: block;margin-top:4px;}
	#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	#placesList .item .info{padding:10px 0 10px 55px;}
	#placesList .info .gray {color:#8a8a8a;}
	#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
	#placesList .info .tel {color:#009900;}
	#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
	#placesList .item .marker_1 {background-position: 0 -10px;}
	#placesList .item .marker_2 {background-position: 0 -56px;}
	#placesList .item .marker_3 {background-position: 0 -102px}
	#placesList .item .marker_4 {background-position: 0 -148px;}
	#placesList .item .marker_5 {background-position: 0 -194px;}
	#placesList .item .marker_6 {background-position: 0 -240px;}
	#placesList .item .marker_7 {background-position: 0 -286px;}
	#placesList .item .marker_8 {background-position: 0 -332px;}
	#placesList .item .marker_9 {background-position: 0 -378px;}
	#placesList .item .marker_10 {background-position: 0 -423px;}
	#placesList .item .marker_11 {background-position: 0 -470px;}
	#placesList .item .marker_12 {background-position: 0 -516px;}
	#placesList .item .marker_13 {background-position: 0 -562px;}
	#placesList .item .marker_14 {background-position: 0 -608px;}
	#placesList .item .marker_15 {background-position: 0 -654px;}
	#pagination {margin:10px auto;text-align: center;}
	#pagination a {display:inline-block;margin-right:10px;}
	#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>
</head>
<body>
	<jsp:include page="adminCommon.jsp"></jsp:include>
	<!-- 패딩 영역 -->
	<div style="width: 100%; padding:50px;">
	<!-- 내부 영역 -->
	<div class="card mb-4" style="width: 100%;">
        <div class="card-header">
            <i class="fas fa-edit"></i>
           	여행지 수정
        </div>
        
        <!-- 유진 - 관리자 여행지 수정 페이지 초안 완성 (2024.06.18) -->
        <div class="card-body">
        	<div class="form-group">
	        	<form id="tourUpdate" action="adminTourUpdate.ad" method="post" enctype="multipart/form-data">
	        		<input type="hidden" name="tourNo" value="${ tour.tourNo }">
	        		
	        		<label>대표이미지 (필수) : <span class="changeNotion">현재 유지하고 싶은 파일이어도 다시 선택해주세요</span></label>
                    <input type="file" class="form-control" name="reThumbImg" id="thumbImgInput" required>
                    <div id="originThumbImg" class="orginImgs">
                    	  현재 파일 : ${tour.thumbImg.substring(tour.thumbImg.lastIndexOf('_') + 1)}
                    	 <input type="hidden" name="ThumbImg" value="${ tour.thumbImg }">
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

					<label>참고이미지들 (최대 4개까지 선택 가능) : <span class="changeNotion">현재 유지하고 싶은 파일도 다시 선택해주세요</span></label> <br>
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
											<input type="hidden" name="changeNoFiles" value="${ extraImg.changeNo }">
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
				    <table>
						<tr>
							<div class="map_wrap">
							    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
							
							    <div id="menu_wrap" class="bg_white">
							        <div class="option">
							            <div>
							                                키워드 : <input type="text" id="keyword" size="15">
							                <button type="button" onclick="searchPlaces();">검색</button>
							            </div>
							        </div>
							        <hr>
							        <ul id="placesList"></ul>
							        <div id="pagination"></div>
							    </div>
							</div>
							<br>
				    	</tr>
				    	<tr>
				    		<td style="width : 1150px; padding-right: 20px;">
				    			<label>주소 :</label>
				    			<input type="text" class="form-control" id="address" name="address" value="${ tour.address }" 
				    				   placeholder="주소 정보는 지번 주소로 입력됩니다." required>
				    		</td>
				    		<td style="padding-right: 20px;">
				    			<label>x좌표 :</label>
				    			<input type="number" class="form-control" id="mapX" name="mapX" step="0.000001" value="${ tour.mapX }" required>
				    		</td>
				    		<td>
				    			<label>y좌표 :</label>
				    			<input type="number" class="form-control" id="mapY" name="mapY" step="0.000001" value="${ tour.mapY }" required>
				    		</td>
				    	</tr>
				    </table>
				    
				    <br>
	   				
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
        
        <script>
			// 마커를 담을 배열입니다
			var markers = [];
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };
			
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);
			
			// 장소 검색 객체를 생성합니다
			var ps = new kakao.maps.services.Places();
			
			// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({zIndex: 1});
			
			// 키워드로 장소를 검색합니다
			searchPlaces();
			
			// 키워드 검색을 요청하는 함수입니다
			function searchPlaces() {
			
			    let keyword = document.getElementById('keyword').value;
			
			    /* if (!keyword.replace(/^\s+|\s+$/g, '')) {
			        alert('키워드를 입력해주세요!');
			        return false;
			    } */
			
			    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			    ps.keywordSearch(keyword, placesSearchCB);
			}
			
			// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
			function placesSearchCB(data, status, pagination) {
			    if (status === kakao.maps.services.Status.OK) {
			
			        // 정상적으로 검색이 완료됐으면
			        // 검색 목록과 마커를 표출합니다
			        displayPlaces(data);
			
			        // 페이지 번호를 표출합니다
			        displayPagination(pagination);
			
			    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
			
			        alert('검색 결과가 존재하지 않습니다.');
			        return;
			
			    } else if (status === kakao.maps.services.Status.ERROR) {
			
			        alert('검색 결과 중 오류가 발생했습니다.');
			        return;
			
			    }
			}
			
			// 검색 결과 목록과 마커를 표출하는 함수입니다
			function displayPlaces(places) {
			
			    var listEl = document.getElementById('placesList'),
			        menuEl = document.getElementById('menu_wrap'),
			        fragment = document.createDocumentFragment(),
			        bounds = new kakao.maps.LatLngBounds(),
			        listStr = '';
			
			    // 검색 결과 목록에 추가된 항목들을 제거합니다
			    removeAllChildNods(listEl);
			
			    // 지도에 표시되고 있는 마커를 제거합니다
			    removeMarker();
			
			    for (var i = 0; i < places.length; i++) {
			
			        // 마커를 생성하고 지도에 표시합니다
			        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
			            marker = addMarker(placePosition, i),
			            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
			
			        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			        // LatLngBounds 객체에 좌표를 추가합니다
			        bounds.extend(placePosition);
			
			        // 마커와 검색결과 항목에 mouseover 했을때
			        // 해당 장소에 인포윈도우에 장소명을 표시합니다
			        // mouseout 했을 때는 인포윈도우를 닫습니다
			        (function (marker, title, place) {
			            kakao.maps.event.addListener(marker, 'mouseover', function () {
			                displayInfowindow(marker, title);
			            });
			
			            kakao.maps.event.addListener(marker, 'mouseout', function () {
			                infowindow.close();
			            });
			
			            itemEl.onmouseover = function () {
			                displayInfowindow(marker, title);
			            };
			
			            itemEl.onmouseout = function () {
			                infowindow.close();
			            };
			
			            // 검색 결과 항목을 클릭했을 때 input 태그에 값을 설정하는 이벤트 핸들러 추가
			            itemEl.onclick = function () {
			                document.getElementById('address').value = place.address_name;
			                document.getElementById('mapX').value = parseFloat(place.x).toFixed(6);
			                document.getElementById('mapY').value = parseFloat(place.y).toFixed(6);
			            };
			        })(marker, places[i].place_name, places[i]);
			
			        fragment.appendChild(itemEl);
			    }
			
			    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
			    listEl.appendChild(fragment);
			    menuEl.scrollTop = 0;
			
			    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			    map.setBounds(bounds);
			}
			
			// 검색결과 항목을 Element로 반환하는 함수입니다
			function getListItem(index, places) {
			
			    var el = document.createElement('li'),
			        itemStr = '<span class="markerbg marker_' + (index + 1) + '"></span>' +
			            '<div class="info">' +
			            '   <h5>' + places.place_name + '</h5>';
			
			    if (places.road_address_name) {
			        itemStr += '    <span>' + places.road_address_name + '</span>' +
			            '   <span class="jibun gray">' + places.address_name + '</span>';
			    } else {
			        itemStr += '    <span>' + places.address_name + '</span>';
			    }
			
			    itemStr += '  <span class="tel">' + places.phone + '</span>' +
			        '</div>';
			
			    el.innerHTML = itemStr;
			    el.className = 'item';
			
			    return el;
			}
			
			// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
			function addMarker(position, idx, title) {
			    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
			        imgOptions = {
			            spriteSize: new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
			            spriteOrigin: new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
			            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
			        },
			        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
			        marker = new kakao.maps.Marker({
			            position: position, // 마커의 위치
			            image: markerImage
			        });
			
			    marker.setMap(map); // 지도 위에 마커를 표출합니다
			    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
			
			    return marker;
			}
			
			// 지도 위에 표시되고 있는 마커를 모두 제거합니다
			function removeMarker() {
			    for (var i = 0; i < markers.length; i++) {
			        markers[i].setMap(null);
			    }
			    markers = [];
			}
			
			// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
			function displayPagination(pagination) {
			    var paginationEl = document.getElementById('pagination'),
			        fragment = document.createDocumentFragment(),
			        i;
			
			    // 기존에 추가된 페이지번호를 삭제합니다
			    while (paginationEl.hasChildNodes()) {
			        paginationEl.removeChild(paginationEl.lastChild);
			    }
			
			    for (i = 1; i <= pagination.last; i++) {
			        var el = document.createElement('a');
			        el.href = "#";
			        el.innerHTML = i;
			
			        if (i === pagination.current) {
			            el.className = 'on';
			        } else {
			            el.onclick = (function (i) {
			                return function () {
			                    pagination.gotoPage(i);
			                }
			            })(i);
			        }
			
			        fragment.appendChild(el);
			    }
			    paginationEl.appendChild(fragment);
			}
			
			// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
			// 인포윈도우에 장소명을 표시합니다
			function displayInfowindow(marker, title) {
			    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
			
			    infowindow.setContent(content);
			    infowindow.open(map, marker);
			}
			
			// 검색결과 목록의 자식 Element를 제거하는 함수입니다
			function removeAllChildNods(el) {
			    while (el.hasChildNodes()) {
			        el.removeChild(el.lastChild);
			    }
			}
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