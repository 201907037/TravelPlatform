<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- Add Swiper's CSS -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">

    <!-- Add Swiper's JS -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <!-- Add Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <style>

        .item {
            margin:auto;
        }

        div {
            /*border:1px solid red;
            box-sizing: border-box; */ 
        }

        .swiper-container {
            width: 800px; /* 필요에 따라 조정 */
            height: 700px;
            margin: auto;
            overflow: hidden;
            position: relative; /* 컨테이너에 상대적 위치 설정 */
        }
		
        .swiper-slide img {
        	
          position: absolute;
		  top: 0;
		  left: 0;
		  right: 0;
		  bottom: 0;
		  width: 100%;
		  height: 100%;
          display: block;
        }

        /* 버튼 색상 변경 및 애니메이션 추가 */
        .swiper-button-next,
        .swiper-button-prev {
            color: black; /* 원하는 색상으로 변경 */
            opacity: 0; /* 초기 상태에서 숨김 */
            visibility: hidden; /* 초기 상태에서 숨김 */
            transition: opacity 0.5s ease, visibility 0.5s ease; /* 애니메이션 추가 */
            height: 100px;
        }

        .swiper-container:hover .swiper-button-next,
        .swiper-container:hover .swiper-button-prev,
        .swiper-container:hover .slide-number,
        .swiper-container:hover .swiper-pagination-bullet {
            opacity: 1; /* 버튼 보이기 */
            visibility: visible; /* 버튼 보이기 */
        }

        /* 페이지네이션 색상 변경 */
        .swiper-pagination-bullet {
            background: rgb(207, 207, 207); /* 원하는 색상으로 변경 */
            opacity: 1; /* 점을 완전히 불투명하게 설정 */
            opacity: 0; /* 초기 상태에서 숨김 */
            visibility: hidden; /* 초기 상태에서 숨김 */
            transition: opacity 0.5s ease, visibility 0.5s ease; /* 애니메이션 추가 */
        }

        .swiper-pagination-bullet-active {
            background: black; /* 활성화된 점의 색상 변경 */
        }

        /* 슬라이드 번호 표시 */
        .slide-number {
            position: absolute;
            top: 20px; /* 상단에서의 위치 조정 */
            right: 10px; /* 오른쪽에서의 위치 조정 */
            background: rgba(0, 0, 0, 0.5); /* 배경 색상 및 투명도 조정 */
            color: white;
            padding: 5px 10px;
            border-radius: 10px;
            font-size: 1em;
            z-index: 10; /* 다른 요소 위에 표시되도록 설정 */
            opacity: 0; /* 초기 상태에서 숨김 */
            visibility: hidden; /* 초기 상태에서 숨김 */
            transition: opacity 0.5s ease, visibility 0.5s ease; /* 애니메이션 추가 */
        }

        /* 프로필 헤더영역 */
        .item .header {
            padding: 10px;
            border-bottom: 1px solid #dbdbdb;
            display: flex;
            align-items: center;
            font-size: 20px;
            width: 780px;
        }

        .item .header img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .item .header span {
            font-weight: bold;
        }

        .content {
            width: 800px;
            margin: auto;

        }

        .icons {
            display: flex;
            justify-content: space-between;
            padding: 10px 10px 0 10px;
        }

		/* 좋아요 css 영역 */
        .heart {
			font-family: 'Hahmlet-Regular';
		}
		
        .heart-icon {
        	float : right;
            cursor: pointer;
        }
        .heart-icon .heart {
            color: #c7c6c6;
            transition: color 0.1s;
            font-size: 25px;
        }
        .heart-icon .heart.active {
            color: red;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5),
                        1px 1px 0 #000, 
                        -1px -1px 0 #000, 
                        1px -1px 0 #000, 
                        -1px 1px 0 #000;
        
        }
        /* 좋아요 css 영역 끝 */

        .post-text {
            padding: 0 10px 10px 10px;
            font-size: 25px;
            line-height: 1.1em;
            font-weight: bold ;
        }

        .item .comments {
            padding: 0 10px 10px 10px;
            font-size: 20px;
            line-height: 1.1em;
            border-bottom: 1px solid #dbdbdb;
            font-weight: 500;
        }


        /* 댓글용 css */
        .comment-section {
            width: 800px;
            margin: auto;
            padding: 20px;
        }
        .comment {
            display: flex;
            align-items: flex-start;
            margin-bottom: 15px;
        }
        .comment img.profile {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            margin-right: 10px;
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
        }
        .comment-header span.time {
            color: #b0b0b0;
            font-size: 12px;
        }
        .comment-text {
            margin: 5px 0;
        }
        
        .add-comment {
            display: flex;
            align-items: center;
            margin-top: 20px;
        }
        .add-comment img.profile {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            margin-right: 10px;
        }
        .add-comment textarea {
            flex: 1;
            padding: 10px;
            border-radius: 10px;
            border: none;
            background-color: #3a3a3a;
            color: #fff;
            outline: none;
            resize: none; /* 사용자가 크기를 조정하지 못하게 */
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

    </style>
</head>
<body>

	<jsp:include page="../common/header1.jsp"></jsp:include>
    <br><br><br><br><br><br><br><br><br>
    
    <div class="item">
    	<div align="center">
    	<div class="header">
                <img src="${ requestScope.m.changeName }" alt="Profile Picture">
                <span>${ requestScope.m.nickName }</span>
            </div>
        </div>
        <div class="swiper-container">
            <div class="swiper-wrapper" align="center">
            	<c:forEach var="i" begin="0" end="${ requestScope.biList.size() - 1 }">
                <div class="swiper-slide"><img src="${ requestScope.biList.get(i).changeName }"></div>
                </c:forEach>
                <!-- 필요에 따라 더 많은 슬라이드 추가 -->
            </div>
            <!-- 페이지 번호 표시 영역 -->
            <c:if test="${ requestScope.biList.size() > 1 }">
            <div class="slide-number">1/${ requestScope.biList.size() }</div>
            </c:if>
            <!-- 페이지네이션 추가 -->
            <div class="swiper-pagination"></div>
            <!-- 네비게이션 버튼 추가 -->
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
        </div>
        <div class="content">
            <div class="icons">
                <div class="heart-icon" onclick="toggleLike(this)">
                    <span class="heart">&#10084;</span>
                </div>
            </div>
            <div style="text-align: right;">
            <span>${ requestScope.b.createDate }</span>
            </div>
            
            <div class="post-text">
                ${requestScope.b.boardTitle }
            </div>
            <div class="comments">
                ${requestScope.b.boardContent }
            </div>
        </div>

        <div class="comment-section">
            <div class="comment">
                <img class="profile" src="https://via.placeholder.com/32" alt="Profile Picture">
                <div class="comment-content">
                    <div class="comment-header">
                        <span class="username">lil_storyman</span>
                        <span class="time">1일</span>
                    </div>
                    <div class="comment-text">
                        내일 뉴아 보러가는 지마니🙌
                    </div>
                </div>
            </div>
            <div class="comment">
                <img class="profile" src="https://via.placeholder.com/32" alt="Profile Picture">
                <div class="comment-content">
                    <div class="comment-header">
                        <span class="username">yuuuujjuuuu</span>
                        <span class="time">2일</span>
                    </div>
                    <div class="comment-text">
                        @jjun__0209
                    </div>
                </div>
            </div>
            <div class="comment">
                <img class="profile" src="https://via.placeholder.com/32" alt="Profile Picture">
                <div class="comment-content">
                    <div class="comment-header">
                        <span class="username">p_pilseo</span>
                        <span class="time">3일</span>
                    </div>
                    <div class="comment-text">
                        가여우어어어오옹유유오우우
                    </div>
                </div>
            </div>
            <div class="comment">
                <img class="profile" src="https://via.placeholder.com/32" alt="Profile Picture">
                <div class="comment-content">
                    <div class="comment-header">
                        <span class="username">k_hw_._</span>
                        <span class="time">13시간</span>
                    </div>
                    <div class="comment-text">
                        @mademoi_gella
                    </div>
                </div>
            </div>
            <div class="add-comment">
                <img class="profile" src="https://via.placeholder.com/32" alt="Profile Picture">
                <textarea placeholder="댓글을 작성해주세요..."></textarea>
                <button disabled><i class="fa-solid fa-arrow-right"></i></button>
            </div>
        </div>
        <script>
            document.querySelector('.add-comment textarea').addEventListener('input', function() {
                const button = document.querySelector('.add-comment button');
                if (this.value.trim() !== '') {
                    button.disabled = false;
                } else {
                    button.disabled = true;
                }
            });
        </script>
        </div>
   



    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const slideNumberDisplay = document.querySelector('.slide-number');

            const swiper = new Swiper('.swiper-container', {
                loop: false, // loop를 true로 설정하면 슬라이드가 무한 반복됩니다.
                pagination: {
                    el: '.swiper-pagination',
                    clickable: true,
                },
                navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                },
                on: {
                    slideChange: function () {
                        const activeSlide = swiper.activeIndex + 1; // Swiper의 realIndex는 0부터 시작합니다.
                        const totalSlides = swiper.slides.length - swiper.loopedSlides * 2; // 루프 모드에서 실제 슬라이드 수 계산
                        slideNumberDisplay.textContent = activeSlide+'/'+${requestScope.biList.size()};
                    }
                }
            });

            // 초기 슬라이드 번호 표시 설정
            slideNumberDisplay.textContent = 1+'/'+${requestScope.biList.size()};

        });

        /* 이 및 스크립트에서는 좋아요 기능 넣을 것 로그인 session에 정보 담은 후 구현*/
       // 현재 이 게시글에 로그인한 사용자가 좋아요를 눌렀었나 검사
            /*
			$(function() {
                
				$.ajax({
					url : "likeCheck.bo",
					type : "get",
					data : {bno : ${requestScope.b.boardNo}},
					success : function(result) {
						
						console.log(result);
						
						if(result == 1) { // 좋아요누른상태
							
                            $(".heart").addClass("active");
						
						} else { // 좋아요안누른상태
							
							
							
						}
					},
					error : function() {
						console.log("좋아요 확인용 ajax 통신 실패!");
					}
				});
            })
            
	        function toggleLike(heartIcon) {
                var heart = heartIcon.querySelector(".heart");
	            heart.classList.toggle("active");
	            
	            	// 클레스에 요소가 있는 지없는지 검사
	             if(heart.classList.contains("active")) {
	         	// TB_LIKE 테이블에 좋아요 insert 요청
		            $.ajax({
						url : "linsert.bo",
						type : "get",
						data : {bno : ${requestScope.b.boardNo}},
						success : function() {
							
							// likeCheck();
							// selectLikeCount();
							console.log("성공");
						},
						error : function() {
							console.log("좋아요 ajax 통신 실패!");
						}
					});
	            } else { 
	            	console.log("좋아요 delete 요청");
	            	$.ajax({
						url : "/ldelete.bo",
						type : "get",
						data : {bno : ${requestScope.b.boardNo}},
						success : function(result) { 
							
							// likeCheck();
							//selectLikeCount();
							console.log("성공");
						},
						error : function() {
							console.log("좋아요 ajax 통신 실패!");
						}
					});
	            } 
	        	 
	        }
        */

            
    </script>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <jsp:include page="../common/footer1.jsp"></jsp:include>
    
</body>
</html>
