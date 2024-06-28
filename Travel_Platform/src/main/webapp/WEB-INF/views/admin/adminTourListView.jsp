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
<!-- Add Swiper's CSS -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">

<!-- Add Swiper's JS -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<!-- Add Font Awesome CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<!-- SweetAlert2 CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.0/dist/sweetalert2.min.css">
<!-- Bootstrap 5 JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.min.js"></script>
<style>
	/* 리뷰용 css */
    .comment-section {
        width: 800px;
        margin: auto;
        padding: 20px;
    }
    .comment {
        display: flex;
        align-items: flex-start;
        margin-bottom: 15px;
        position: relative; /* 리뷰 내의 버튼 위치를 조정하기 위해 추가 */
    }
    
    .comment.active {
        border: 2px solid rgb(102, 102, 102);
        border-radius : 10px;
        padding: 5px;
    }

    .edit-delete-buttons {
        display: none;
        position: absolute;
        right: 10px;
        top: 10px;
    }
       
	/* 리뷰 수정, 삭제버튼용 */
    .edit-button,
	.delete-button {
	    border: 1px solid #ddd;
	    background-color: #f0f0f0;
	    border-radius: 10px;
	    font-size: 16px;
	    font-weight: bold;
	    padding: 8px 14px;
	    color: #333;
	    cursor: pointer;
	    transition: background-color 0.3s, color 0.3s, box-shadow 0.3s;
	    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	}
	
	.edit-button:hover,
	.delete-button:hover {
	    background-color: #007bff;
	    color: #fff;
	    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
	}
	
	.edit-button:active,
	.delete-button:active {
	    background-color: #0056b3;
	    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
	}
	
	.edit-button:focus,
	.delete-button:focus {
	    outline: none;
	    box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.5);
	}
	/* 리뷰 버튼 영역 끝*/
	

    .comment.active .edit-delete-buttons {
        display: inline-block;
    }
    
    
    .comment img.profile {
        width: 32px;
        height: 32px;
        border-radius: 50%;
        margin-right: 10px;
        transition: width 0.3s ease, height 0.3s ease; /* 프로필 사진 크기 전환 효과 추가 */
    }
    .comment.active img.profile {
        width: 40px;
        height: 40px;
    }
    .comment-content {
        flex: 1;
    }
    .comment-header {
        display: flex;
        align-items: center;
    }
    .comment-header span.username {
        font-weight: bold;
        margin-right: 5px;
        transition: font-size 0.3s ease; /* 글씨 크기 전환 효과 추가 */
    }
    .comment-header span.time {
        color: #b0b0b0;
        font-size: 12px;
    }
    .comment-text {
        margin: 5px 0;
    }
    
    .add-comment {
        display: none;
        align-items: center;
        margin-top: 20px;
        
    }
    .add-comment img.profile {
        width: 50px;
        height: 50px;
        border-radius: 50%;
        margin-right: 10px;
    }
    .add-comment textarea {
        flex: 1;
        padding: 10px;
        border-radius: 10px;
        border: none;
        outline: none;
        idth: 300px; /* 고정 가로 크기 */
        min-height: 40px; /* 최소 높이 */
        border: 2px solid #9b9b9b;
        overflow: hidden; /* 스크롤 숨기기 */
        resize: none; /* 크기 조절 비활성화 */
        white-space: pre-wrap; /* 줄 바꿈 유지 */
        word-wrap: break-word; /* 길이가 긴 단어를 줄 바꿈 */
        font-size: 15px;
        font-weight: bold;
    }
       
    .add-comment button {
        padding: 10px 15px;
        border: none;
        border-radius: 20px;
        background-color: #0095f6;
        color: #fff;
        margin-left: 10px;
        cursor: pointer;
        line-height: 10px;
        width: 60px;
        height: 60px;
    }
    .add-comment button:disabled {
        background-color: #818181;
        cursor: not-allowed;
        
    }
       
	.add-comment textarea::placeholder {
		color: lightgray; /* 원하는 색상으로 변경 */
	    opacity: 1; /* 플레이스홀더 투명도 설정 */
	}
	
	
	.reply-icon .reply {
		font-size:33px; 
		display: inline-block; 
		transform: scaleX(0.8); /* 가로 길이 조정 (1.5배 확대) */
		text-shadow: 
               -1px -1px 0 #000,  
                1px -1px 0 #000,
               -1px  1px 0 #000,
                1px  1px 0 #000; /* 테두리 효과를 위한 그림자 */
           color: white;
	}

    .reply-icon:hover {
        font-weight: bolder;
        cursor: pointer;
    }
        
	.tour-table>tbody>tr { cursor: pointer; }
	
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
								      <c:when test="${t.tourType.equals('tourSpot') or t.tourType.equals('관광지')}">
								      		관광지
								      </c:when>
								      <c:when test="${t.tourType.equals('lodging') or t.tourType.equals('숙박')}">
								      		숙박시설
								      </c:when>
								      <c:when test="${t.tourType.equals('restaurant') or t.tourType.equals('음식점')}">
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
						      			<div class="tour-info"></div>
						      			<hr>
							      		<div class="comment-section" style="margin-top : -20px; margin-left : -10px; margin-bottom : -30px">
							        		<div id="rcount" style="font-size:15px; font-weight: bold;"></div>
								        	<br>
								        	<div id="commentReply" style="margin-top : -15px;">
								                <!-- 리뷰이 들어갈 자리 -->
								            </div>
								        </div>
						      		</div>
						      		<div class="modal-footer">
						      			<form id="modifyTourForm" action="adminTourUpdateForm.ad" method="post">
						      				<input type="hidden" class="tourNo" name="tourNo">
						      				<input type="hidden" id="tourType" name="tourType">
						      				<button type="submit" class="btn btn-primary" id="tourModify">수정</button>
						      			</form>
  										<form id="deleteTourForm" action="deleteTour.to" method="post"  onsubmit="return confirm('해당 여행지를 정말 삭제하시겠습니까?');">
  											<input type="hidden" class="tourNo" name="tourNo">
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
		      		
		      		$(".tourNo").val(tourNo);
		      		$("#tourType").val(tourType);
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
		      				
		      				let b = $(".modal-body>.tour-info");
		      				let result = "";
		      				result += "<div id='tour-thumbImg' style='border: 0px;'>"
		      							+ "<img src="+z["list"]["thumbImg"]+" alt='Thumbnail' style='border-radius: 10px;'>"
		      							+ "</div><br>"
		      							+ "<div id='tourImg'>";
		      				
		      				
		      				if(z["img"].length != null && z["img"].length > 0){
		      					
		      					for(let i =0; i < z["img"].length; i++){
		      						result += "<div class='tourImgList'  style='border: 0px;'>"
		      								+ "<img src="+z["img"][i]["changeNo"]+" width='100%' alt='images' style='border-radius: 10px;'>"
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
		      				selectReplyList(tourNo);
	
		      			},
		      			error: function(){
		      				console.log("ajax에러");
		      			}
		      		});
		    	});
		    	
		    	
		    	
		    	$(document).on('click', '.delete-button', function () {

		    	    var replyNo = $(this).data('replyno'); // 수정하려는 리뷰의 replyNo를 가져옵니다.
		    	    let number = $(this).next().val(); // 수정하려는 리뷰 게시물 번호
		    	    let checkDelete = confirm("해당 리뷰를 정말 삭제하시겠습니까?");
		    	    if(checkDelete == true){
	    	            $.ajax({
	    	                url: 'reviewDelete.ad', // API 엔드포인트로 변경
	    	                type: 'POST',
	    	                data: {
	    	                    reviewNo: replyNo, // 수정할 리뷰의 번호
	    	                },
	    	                success: function(response) {
    	                        // 리뷰 목록을 다시 로드
    	                        selectReplyList(number);
	    	                },
	    	                error: function() {
	    	                    
	    	                }
	    	            });
		    	    }
		    	    
		    	});
		    	

		  	});
			
			// 모달창 닫기
			$(document).ready(function() {
		    	$(".modal-header>button").click(function(){
		      		$(".infoModal").modal("hide");
		    	});
		  	});
			
	     	// 해당 게시글에 딸린 리뷰리스트 조회용 function
        	function selectReplyList(tourNo) {
        		
        		$.ajax({
        			url : "reviewList.ad",
        			type : "get",
        			data : {
        				tourNo : tourNo
        			},
        			success : function(Map) {
        				
        				
        				// 회원 정보 가져오고
        				let mList = Map.mList;
        				let rList = Map.rList;
        				
        				let resultStr = "";
        				let reviewCount=0;
        				// 리뷰 목록 조회
        				if(mList != null){
        					reviewCount = rList.length; // 리뷰 개수
        				for (let i = 0; i < rList.length; i++) {
        					
        					 let reply = rList[i];
        			         let member = mList[i];
        					
        			        resultStr += '<div class="comment" id="comment'+i+'">';
       	                    resultStr += '<input type="hidden" class="replyUserNo" value="'+reply.userNo+'">';
       	                    resultStr += '    <img class="profile" src="'+member.changeName+'" alt="Profile Picture">';
       	                    resultStr += '    <div class="comment-content">';
       	                    resultStr += '        <div class="comment-header">';
       	                    resultStr += '            <span class="username">'+member.nickName+'</span>';
       	                    resultStr += '            	<span class="time">'+reply.createDate+'</span>';
       	                    resultStr += '        </div>';
       	                    resultStr += '        <div class="comment-text">';
       	                    resultStr += '           '+ reply.reviewContent +'';
       	                    resultStr += '        </div>';
       	                    resultStr += '        <div class="edit-delete-buttons">';
       	                    resultStr += '            <button class="delete-button btn btn-primary" type="button" id="showModal" data-replyno="'+reply.reviewNo+'">삭제</button>';
       	                    resultStr += '			  <input type="hidden" class="tourNo" value="'+tourNo+'">';
       	                    resultStr += '        </div>';
       	                    resultStr += '    </div>';
       	                    resultStr += '</div>';
                    	};	
        				}else{
        			        resultStr += '<div class="comment">';
       	                    resultStr += '</div>';
        				}
        				
        				$("#commentReply").html(resultStr);			   
        			
        				// 리뷰 갯수 추가
        				$("#rcount").text("리뷰 "+reviewCount +"개");
        				// 자스에서 list 사이즈 확인하는 메소드는 length 임

                        // 리뷰 클릭 이벤트 추가
                        $(".comment").click(function() {
                            const isActive = $(this).hasClass("active");
                            $(".comment").removeClass("active");
                            $(".edit-delete-buttons").hide();
                            if (!isActive) {
                                $(this).addClass("active");
                                	$(this).find(".edit-delete-buttons").show();
                            }
                        });
        				
        			}, 
        			error : function() {
        				
        				console.log("리뷰리스트 조회용 ajax 통신 실패!");
        				
        			}
        			
        		});
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