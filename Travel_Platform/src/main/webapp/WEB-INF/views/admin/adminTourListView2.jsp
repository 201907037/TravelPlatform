<!-- 유진 - 관리자 여행지 목록 (2024.06.10) -->
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
	.tour-table>tbody>tr { cursor: pointer; }
	
	/*
	.tour-table {
		table-layout: fixed;
		width: 100%;
	}
	
	tr > :first-child {
		width: 30%; !important;
	}
	tr > :second-child {
		width: 10%; !important;
	}
	tr > :third-child {
		width: 50%; !important;
	}
	tr > :forth-child {
		width: 10%; !important;
	}
	*/
	
	#tour-thumbImg {
		border: 1px solid black;
		width: 500px;
		height: 350px;
	}
	
	#tour-thumbImg img {
		width: 100%;
		height: 100%;
		object-fit: cover;
		object-position: center;
	}
	
	.tourImg-container {
	    width: 100%;
	    height: 400px; /* 원하는 높이로 조정 */
	    overflow: hidden;
	    position: relative;
	    margin-bottom: 20px; /* 각 이미지 컨테이너 간의 간격 */
	}
	
	.tourImg-container img {
	    width: 100%;
	    height: 100%;
	    object-fit: cover;
	    object-position: center;
	}
</style>
</head>
<body>
	<jsp:include page="adminCommon.jsp"></jsp:include>
	<!-- 패딩 영역 -->
	<div style="width: 100%; padding:50px;">
	<!-- 내부 영역 -->
	<div class="card mb-4" style="width: 100%;">
        <div class="card-header">
            <i class="fas fa-table me-1"></i>
           	여행지 목록
        	<button style="float: right" onclick="tourEnroll();">여행지 추가</button>
        	
        	<script>
        		function tourEnroll() {
        			location.href="adminTourEnroll.ad";
        		}
        	</script>
        </div>
        
        <div class="card-body">
            <table id="datatablesSimple" class="tour-table">
                <thead>
                    <tr>
                        <th>여행지명</th>
                        <th>분류</th>
                        <th>주소</th>
                        <th>최초생성일</th>
                    </tr>
                </thead>
                <tbody>
	                <c:forEach var="t" items="${requestScope.tList}">
	                    <tr>
	                        <th>${t.tourName}</th>
	                        <th>
	                        	<c:choose>
								      <c:when test="${t.tourType.equals('tourSpot')}">
								      		관광지
								      </c:when>
								      <c:when test="${t.tourType.equals('lodging')}">
								      		숙박시설
								      </c:when>
								      <c:when test="${t.tourType.equals('restaurant')}">
								      		식당/카페
								      </c:when>
								      <c:otherwise>
								      		레포츠
								      </c:otherwise>
								</c:choose>
	                        </th>
	                        <th>${t.address}</th>
	                        <th>${t.addDate}</th>
	                    </tr>
	                    
	                    
				    	<!-- 여행지정보 모달창 -->
						<div class="modal fade infoModal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-lg" role="document">
								<div class="modal-content">
						      		<div class="modal-header" id="tour-detail">
						        		<h5 class="modal-title" id="exampleModalLabel">${t.tourName}</h5>
						        		<button type="button" class="close" aria-label="Close">
						          			<span aria-hidden="true">&times;</span>
						        		</button>
						      		</div>
						      		<div class="modal-body">
						        		<div id="tour-thumbImg">
						        			<img src="${t.thumbImg}" alt="Thumbnail">
						        		</div>
						        		
						        		<div id="tourImg">
						        			<!-- 추가이미지들이 있다면 여기에 출력 (여기서 밑의 script 호출) -->
						        		</div>
						        		
						        		<!--
						        		<script>
						        			function() {
						        				var tourNo = ${t.tourNo};
						        		
								        		// AJAX 호출로 서버에서 이미지 데이터를 가져옴
						                        $.ajax({
						                            url : "getTourImages.ad", 
						                            method : "get", 
						                            data : { tourNo : tourNo }, 
						                            success: function(response) {
						                                var $tourImg = $("#tourImg");
						                                $tourImg.empty(); // 기존 이미지 삭제
		
						                                // 서버에서 받은 이미지 데이터로 갤러리를 채움
						                                response.images.forEach(function(image) {
						                                    var $div = $('<div>', { 'class': 'tourImg-container' });
						                                    var $img = $('<img>', { src: image.url, alt: 'Dynamic Image' });
						                                    $div.append($img);
						                                    $tourImg.append($div);
						                                });
		
						                                // 모달 창 열기
						                                $("#myModal").modal("show");
						                            }
						                        });
						        			}
									    </script>
									   	-->
						        		
						        		<br>
						        		<hr>
						        		<br>
						        		
						      		</div>
						      		<div class="modal-footer">
					      				<button type="button" class="btn btn-primary">수정</button>
					      				<button type="button" class="btn btn-danger">삭제</button>
						      		</div>
						    	</div>
						  	</div>
						</div>
						
	                </c:forEach>
                </tbody>
            </table>
        </div>
    	
		<script>
		
		
			// 모달창 열기
			$(document).ready(function() {
		    	$("#datatablesSimple>tbody>tr").click(function(){
		      		$(".infoModal").modal("show");
		    	});
		  	});
			
			// 모달창 닫기
			$(document).ready(function() {
		    	$(".modal-header>button").click(function(){
		      		$(".infoModal").modal("hide");
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