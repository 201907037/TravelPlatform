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
		width: 400px;
		height: 250px;
	}
	
	#tour-thumbImg img, .tourImgList img {
		width: 100%;
		height: 100%;
		object-fit: cover;
		object-position: center;
	}
	
	.tourImgList {
		float: left;
		border: 1px solid black;
		width: 160px;
		height: 100px;
		margin-right: 20px;
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
							
	                        <th>
	                		    <input type="hidden" name="tourNo" value="${ t.tourNo }">
		                    	<input type="hidden" name="tourType" value="${ t.tourType }">
		                    	<input type="hidden" name="thumbImg" value="${ t.thumbImg }">
		                    	<input type="hidden" name="tourName" value="${ t.tourName }">
		                    	<input type="hidden" name="address" value="${ t.address }">
		                    	<input type="hidden" name="contentId" value="${ t.contentId }">
	                        	${t.tourName}
	                        </th>
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
	                    
	                    

						
	                </c:forEach>
                </tbody>
            </table>
        </div>
        
      				    		<!-- 여행지정보 모달창 -->
						<div class="modal fade infoModal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-lg" role="document">
								<div class="modal-content">
						      		<div class="modal-header" id="tour-detail">
						        		<h5 class="modal-title" id="exampleModalLabel"></h5>
						        		<button type="button" class="close" aria-label="Close">
						          			<span aria-hidden="true">&times;</span>
						        		</button>
						      		</div>
						      		<div class="modal-body">
						      		</div>
						      		<div class="modal-footer">
					      				<button type="button" class="btn btn-primary" id="tourModify">수정</button>
  										<form id="deleteTourForm" action="deleteTour.to" method="post">
  											<input type="hidden" id="tourNo" name="tourNo">
  											<input type="hidden" id="thumbImg" name="thumbImg">
					      					<button type="submit" class="btn btn-danger" id="tourDelete">삭제</button>
					      				</form>
						      		</div>
						    	</div>
						  	</div>
						</div>
    	
		<script>
			// 모달창 열기
			$(document).ready(function() {
		    	$("#datatablesSimple>tbody>tr").click(function(e){
		      		$(".infoModal").modal("show");
		      		
		      		// console.log($(this).children().eq(0).children().eq(0).val());
		      		// console.log($(this).children().eq(0).children().eq(1).val());
		      		
		      		let tourNo = $(this).children().eq(0).children().eq(0).val();
		      		let tourType = $(this).children().eq(0).children().eq(1).val();
		      		let thumbImg = $(this).children().eq(0).children().eq(2).val();
		      		let tourName = $(this).children().eq(0).children().eq(3).val();
		      		let address = $(this).children().eq(0).children().eq(4).val();
		      		let contentId = $(this).children().eq(0).children().eq(5).val();
		      		// console.log(tourNo);
		      		// console.log(tourType);
		      		// console.log(thumbImg);
		      		
		      		$("#tourNo").val(tourNo);
		      		$("#thumbImg").val(thumbImg);
	
		      		$.ajax({
		      			url : "tourDetailView.to",
		      			type: "get",
		      			data : {
		      				tourNo : tourNo,
		      				tourName : tourName,
		      				address : address,
		      				contentId : contentId,
		      				thumbImg : thumbImg,
		      				tourType : tourType 
		      			},
		      			success : function(z){
		      				console.log("ajax성공");
		      				console.log(z);
		      				// console.log(z["list"]["thumbImg"]);
		      				
		      				let b = $(".modal-body");
		      				let result = "";
		      				result += "<div id='tour-thumbImg'>"
		      							+ "<img src="+z["list"]["thumbImg"]+" alt='Thumbnail'>"
		      							+ "</div><br>"
		      							+ "<div id='tourImg'>";
		      				
		      				// console.log(z["img"].length);
		      				// console.log(z["img"][0]["changeNo"]);
		      				
		      				
		      				
		      				if(z["img"].length != null && z["img"].length > 0){
		      					
		      					for(let i =0; i < z["img"].length; i++){
		      						result += "<div class='tourImgList'>"
		      								+ "<img src="+z["img"][i]["changeNo"]+" alt='images'>"
		      								+ "</div>"
		      					}
		      					
		      				}
		      				result += "<br clear='both'></div><hr>"
		      						+ "장소 : "+z["list"]["address"]+"<br>"
		      						+"연락처 : "+ z["list"]["tel"]+"<br>";
		      				
		      				
		      				switch(z["list"]["tourtype"]){
		      				case "tourSpot":
		      					result += "이용시간 : "+ z["list"]["useTime"] +"<br>"
			        				+ "운영시기 : "+ z["list"]["season"] +"<br>"
			        				+ "애견 동반 : "+ z["list"]["pet"] +"<br>";
		      					break;
		      				case "restaurant":
		      					result += "운영시간 : "+ z["list"]["openTime"] +"<br>"
		        				+ "휴무일 : "+ z["list"]["restDate"] +"<br>"
		        				+ "대표메뉴 : "+ z["list"]["firstMenu"] +"<br>"
		        				+ "전체메뉴 : "+ z["list"]["treatMenu"] +"<br>"
		        				+ "아이들 놀이방 : "+ z["list"]["kidRoom"] +"<br>";
		      					break;
		      				case "lodging":
		      					result += "객실타입 : "+ z["list"]["roomType"] +"<br>"
		        				+ "체크인 : "+ z["list"]["checkIn"] +"<br>"
		        				+ "체크아웃 : "+ z["list"]["checkOut"] +"<br>"
		        				+ "취사 : "+ z["list"]["cook"] +"<br>"
		        				+ "주차 : "+ z["list"]["parking"] +"<br>";
		      					break;
		      				case "leports":
		      					result += "운영시간  : "+ z["list"]["useTime"] +"<br>"
		        				+ "애견 동반 : "+ z["list"]["pet"] +"<br>"
		        				+ "주차 : "+ z["list"]["parking"] +"<br>";
		      					break;
		      				}
		      				
							$("#exampleModalLabel").text(z["list"]["tourName"]);
		      				b.html(result);
	
		      			},
		      			error: function(){
		      				console.log("ajax에러");
		      			}
		      		});
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