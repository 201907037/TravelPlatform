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
    
    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.0/dist/sweetalert2.min.css">
    <!-- Bootstrap 5 JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.min.js"></script>
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
            height: 650px;
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
          
          border-radius: 15px;
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

    

		/* 좋아요 css 영역 */
        .heart {
			font-family: 'Hahmlet-Regular';
		}
		
        .heart-icon {
            cursor: pointer;
        }
        .heart-icon .heart {
            color: white;
            text-shadow: 
                -1px -1px 0 #000,  
                 1px -1px 0 #000,
                -1px  1px 0 #000,
                 1px  1px 0 #000; /* 테두리 효과를 위한 그림자 */
            transition: color 0.1s;
            font-size: 25px;
        }

        .heart-icon:hover {
            font-weight: bolder;
        }

        .heart-icon .heart.active {
            color: rgb(248, 82, 82);
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
            position: relative; /* 댓글 내의 버튼 위치를 조정하기 위해 추가 */
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
        
        /* 댓글 수정, 삭제버튼용 */
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
		/* 댓글 버튼 영역 끝*/
		

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
        
        /* 수정하기 및 삭제하기 버튼 스타일 */
		#update-btn,
		#delete-btn {
		    background-color: #f0f0f0;
		    color: #000;
		    padding: 8px 15px;
		    border: 2px solid gray;
		    border-radius: 5px;
		    cursor: pointer;
		    font-size: 15px;
		    transition: background-color 0.3s ease, color 0.3s ease;
		    font-weight: bold;
		}
		
		#update-btn:hover,
		#delete-btn:hover {
		    background-color: #ccc;
		    color: #fff;
		}
    </style>
</head>
<body>

	<jsp:include page="../common/header1.jsp"></jsp:include>
    <br><br><br><br><br><br><br><br><br>
    
    <div align="center">
        <!-- 수정하기, 삭제하기 버튼은 이 글이 본인이 작성한 글일 경우에만 보여져야 함 -->
        <!-- 
        	* 기존의 수정하기, 삭제하기 요청을 GET 방식으로 보냈었음!!
        	> 쿼리스트링을 조작하여 내가 쓴 게시글이 아니더라도 수정, 삭제하기가 가능해짐
        	> 수정하기, 삭제하기 요청을POST 방식으로 보내면 해결 가능함
         -->
        <c:if test="${ not empty sessionScope.loginUser && sessionScope.loginUser.userNo eq requestScope.b.userNo }">
         <button type="button" id="update-btn" onclick="postFormSubmit(1);">수정하기</button>
         <button type="button" id="delete-btn" class="deleteBoard-button" data-boardbno="${ requestScope.b.boardNo }" onclick="postFormSubmit(2);">삭제하기</button>
        </c:if>
    </div>
    <br><br>
            
    <form id="postForm" action="" method="post">
          	<!-- 수정하기, 삭제하기에 글번호 넘겨주기 -->
          	<input type="hidden" name="bno" value="${ requestScope.b.boardNo }" >
    </form>

	<script>
		function postFormSubmit(i) {
			
			// console.log("호출됨" , i);
			if(i == 1) { // 수정하기
				
				// attr 속성 이용해서 action 속성에 조건에 맞게 요청 보내기 
				$("#postForm").attr("action", "updateForm.bo").submit();
															// submit(); : submit 버튼을 누른 효과를 줄 수 있다.
			} else { // 삭제하기
			
				$(document).on('click', '.deleteBoard-button', function () {
		            var bno = $(this).data('boardbno'); // 게시물 번호
		            Swal.fire({
		                title: '게시물 삭제',
		                text: '삭제 후 더 이상 복구되지 않습니다. 정말 삭제하시겠습니까?',
		                showCancelButton: true,
		                confirmButtonText: '확인',
		                cancelButtonText: '취소'
		            }).then((result) => {
		                if (result.isConfirmed) {
		                    $.ajax({
		                        url: 'delete.bo', // API 엔드포인트로 변경
		                        type: 'POST',
		                        data: {
		                            bno: bno, // 삭제할 게시물 번호
		                        },
		                        success: function(response) {
		                            Swal.fire({
		                                title: '게시글 삭제 완료!',
		                                icon: 'success',
		                                confirmButtonText: 'OK'
		                            }).then(() => {
		                                
		                                    location.href = "selectList.bo";
		                            });
		                        },
		                        error: function(xhr, status, error) {
		                            Swal.fire({
		                                title: 'Error!',
		                                text: 'There was an error deleting the post.',
		                                icon: 'error',
		                                confirmButtonText: 'OK'
		                            });
		                        }
		                    });
		                }
		            });
		        });
			}
			
		}
		
	</script>
    
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
            
            <div class="heart-icon" onclick="toggleLike(this)" style="display: inline;">
                <span class="heart">&#10084;</span>
            </div>
            &nbsp;
            <div class="reply-icon" style="display: inline;">
                	<span class="reply">&#128488;</span>
            </div>
            <div style="text-align: right;">
            <span>작성일: ${ requestScope.b.createDate }</span>
            </div>
            
            <div class="post-text">
                ${requestScope.b.boardTitle }
            </div>
            <div class="comments">
                ${requestScope.b.boardContent }
            </div>
        </div>

        <div class="comment-section">
        	<div id="rcount" style="padding-left: 10px; font-size:15px; font-weight: bold;"></div>
        	<br>
        	<div id="commentReply">
            	
                <!-- 댓글이 들어갈 자리 -->
             
         
            </div>
            <div class="add-comment">
                <img class="profile" src="${sessionScope.loginUser.changeName }" alt="Profile Picture">
                <textarea placeholder="댓글을 작성해주세요..." id="content"></textarea>
                <button disabled onclick="addReply();"><i class="fa-solid fa-arrow-right"></i></button>
            </div>
        </div>
        
        </div>
        <script>
        
       		const userNo = "${sessionScope.loginUser.userNo}";
       		
            document.querySelector('.add-comment textarea').addEventListener('input', function() {
                const button = document.querySelector('.add-comment button');
                if (this.value.trim() !== '') {
                    button.disabled = false;
                } else {
                    button.disabled = true;
                }
            });
            
			$(function() {
        		
        		selectReplyList();
        		
        		// 댓글 목록 실시간 불러오기 효과
        		setInterval(selectReplyList, 60000);
        		//		 	함수명			 ms단위
        	});
            
			// 댓글 작성용 function
        	function addReply() {
        		
        		// 댓글 작성 시 댓글의 내용은 필수 입력사항임 (NOT NULL)
        		// > 공백제거 후 길이가 0이 아닌 경우에만 ajax 요청 보내기 
        		if($("#content").val().trim().length != 0) {
	        		// 댓글 작성이 가능한 경우
        			
        			$.ajax({
	        			url : "rinsert.bo",
	        			type : "post",
	        			data : {
	        				boardNo : ${ requestScope.b.boardNo },
	        				replyContent : $("#content").val().replace(/\n/g, "<br>")
        				},
        				success : function(result) {
        					
        					
        					console.log(result)
        					
        					if(result == "success") {
        						// 댓글 목록 다시 불러오기
        						// 댓글 목록 조회기능 구현시 주석해제
        						selectReplyList();
        						
        						// 댓글 작성란에 초기화 해주는 효과
        						$("#content").val("");
        						
        					} 
        					
        				}, 
        				error : function() {
        					console.log("댓글 작성용 ajax 통신실패!");
        				}
	        		});
	        		
        		 }
        		
        	}
         	
         	
         
        	// 해당 게시글에 딸린 댓글리스트 조회용 function
        	function selectReplyList() {
        		
        		$.ajax({
        			url : "rlist.bo",
        			type : "get",
        			data : {
        				bno : ${ requestScope.b.boardNo }
        			},
        			success : function(Map) {
        				
        				console.log(Map);
        				
        				let mList = Map.mList;
        				let rList = Map.rList;
        				
        				
        				let resultStr = "";
        				
        				// console.log(result);
        				// 댓글 목록 조회
        				
        				for (let i = 0; i < rList.length; i++) {
        					
        					 let reply = rList[i];
        			         let member = mList[i];
        					
        			        resultStr += '<div class="comment" id="comment'+i+'">';
       	                    resultStr += '<input type="hidden" class="replyUserNo" value="'+reply.userNo+'">';
       	                    resultStr += '    <img class="profile" src="'+member.changeName+'" alt="Profile Picture">';
       	                    resultStr += '    <div class="comment-content">';
       	                    resultStr += '        <div class="comment-header">';
       	                    resultStr += '            <span class="username">'+member.nickName+'</span>';
       	                    						  if(reply.modifyDate == null) {
       	                    resultStr += '            	<span class="time">'+reply.createDate+'</span>';
       	                    						  } else {
       	                    resultStr += '			  	<span class="time">'+reply.modifyDate+'</span>';
       	                    						  }
       	                    resultStr += '        </div>';
       	                    resultStr += '        <div class="comment-text">';
       	                    resultStr += '           '+ reply.replyContent +'';
       	                    resultStr += '        </div>';
       	                    resultStr += '        <div class="edit-delete-buttons">';
       	                    resultStr += '            <button class="edit-button btn btn-primary" type="button" id="showModal" data-replyno="'+reply.replyNo+'">수정</button>';
       	                    resultStr += '            <button class="delete-button btn btn-primary" type="button" id="showModal" data-replyno="'+reply.replyNo+'">삭제</button>';
       	                    resultStr += '        </div>';
       	                    resultStr += '    </div>';
       	                    resultStr += '</div>';
                    	};	
        				
        				$("#commentReply").html(resultStr);			   
        			
        				// 댓글 갯수 추가
        				$("#rcount").text("댓글 "+rList.length +"개");
        				// 자스에서 list 사이즈 확인하는 메소드는 length 임

                        // 댓글 클릭 이벤트 추가
                        $(".comment").click(function() {
                            const isActive = $(this).hasClass("active");
                            $(".comment").removeClass("active");
                            $(".edit-delete-buttons").hide();
                            if (!isActive) {
                                $(this).addClass("active");
                                if(userNo != "" && userNo == $(this).children(":first-child").val()) {
                                	$(this).find(".edit-delete-buttons").show();
                                }
                            }
                        });

                        // 문서 내 다른 부분 클릭 시 이벤트 추가
                        $(document).click(function(event) {
                            if (!$(event.target).closest(".comment").length) {
                                $(".comment").removeClass("active");
                                $(".edit-delete-buttons").hide();
                            }
                        });
        				
        			}, 
        			error : function() {
        				
        				console.log("댓글리스트 조회용 ajax 통신 실패!");
        				
        			}
        			
        		});
        	}
        	
        	
            
        </script>
        
        <c:choose>
        <c:when test="${sessionScope.loginUser ne null}">
        <script>
        $(function() {
        	$(".reply").click(function() {
        		 $(".add-comment").css("display") === "none" ? $(".add-comment").css("display", "flex") : $(".add-comment").css("display", "none");
        		 var $reply = $(".reply");
                 if ($reply.css("color") === "rgb(255, 255, 255)") {
                     $reply.css({
                         "color": "rgb(0, 149, 246)",
                         "text-shadow": "2px 2px 4px rgba(0, 0, 0, 0.5), 1px 1px 0 #000, -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000"
                     });
                 } else {
                     $reply.css({
                         "color": "white",
                         "text-shadow": "text-shadow:-1px -1px 0 #000, 1px -1px 0 #000, -1px  1px 0 #000, 1px  1px 0 #000;" // 기존 text-shadow를 제거하려면 "none"을 사용합니다.
                     });
                 }
        	});
        }); 
        </script>
        </c:when>
        <c:otherwise>
        	<script>
        		$(function() {
        			$(".reply").click(function() {
        				alert("로그인후 이용가능합니다.")
        			});
        		});
        	</script>
        </c:otherwise>
        </c:choose>
   


	<!-- 슬라이드 전용 스크립트 -->
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
        
        </script>
        
		<c:choose>
        <c:when test="${sessionScope.loginUser ne null}">
        <script>
        /* 이 및 스크립트에서는 좋아요 기능 넣을 것 로그인 session에 정보 담은 후 구현*/
       // 현재 이 게시글에 로그인한 사용자가 좋아요를 눌렀었나 검사
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
	         	// BOARD_LIKE 테이블에 좋아요 insert 요청
		            $.ajax({
						url : "linsert.bo",
						type : "get",
						data : {bno : ${requestScope.b.boardNo}},
						success : function() {
							
							
							console.log("성공");
						},
						error : function() {
							console.log("좋아요 ajax 통신 실패!");
						}
					});
	            } else { 
	            	console.log("좋아요 delete 요청");
	            	$.ajax({
						url : "ldelete.bo",
						type : "get",
						data : {bno : ${requestScope.b.boardNo}},
						success : function(result) { 
							
							
							console.log("성공");
						},
						error : function() {
							console.log("좋아요 ajax 통신 실패!");
						}
					});
	            } 
	        	 
	        }
			</script>
	        </c:when>
	        <c:otherwise>
	        	<script>
	        		$(function() {
	        			$(".heart-icon").click(function() {
	        				alert("로그인후 이용가능합니다.")
	        			});
	        		});
	        	</script>
	        </c:otherwise>
	        </c:choose>
    
   
   
     <!-- SweetAlert2 모달 JS, 스크립트 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.0/dist/sweetalert2.min.js"></script>
    <script>
	$(document).on('click', '.edit-button', function () {
	    var replyNo = $(this).data('replyno'); // 수정하려는 댓글의 replyNo를 가져옵니다.
	    Swal.fire({
	        title: '댓글 수정',
	        html: '<textarea id="editReply" class="swal2-input" style="overflow: hidden;resize: none;white-space: pre-wrap; word-wrap: break-word;" placeholder="댓글을 입력하세요"></textarea>',
	        showCancelButton: true,
	        confirmButtonText: '확인',
	        cancelButtonText: '취소'
	    }).then((result) => {
	        if (result.isConfirmed) {
	        	const replyContent = $('#editReply').val().replace(/\n/g, "<br>");
	
	            $.ajax({
	                url: 'rUpdate.bo', // API 엔드포인트로 변경
	                type: 'POST',
	                data: {
	                    replyNo: replyNo, // 수정할 댓글의 번호
	                    replyContent: replyContent // 수정할 댓글 내용
	                },
	                success: function(response) {
	                    Swal.fire({
	                        title: '댓글 수정 성공!',
	                        icon: 'success',
	                        confirmButtonText: 'OK'
	                    }).then(() => {
	                        // 댓글 목록을 다시 로드
	                        selectReplyList();
	                    });
	                    
	                },
	                error: function(xhr, status, error) {
	                    Swal.fire({
	                        title: 'Error!',
	                        text: 'There was an error saving your changes.',
	                        icon: 'error',
	                        confirmButtonText: 'OK'
	                    });
	                }
	            });
	        }
	    });
	});
	
	
	$(document).on('click', '.delete-button', function () {
	    var replyNo = $(this).data('replyno'); // 수정하려는 댓글의 replyNo를 가져옵니다.
	    Swal.fire({
	        title: '댓글 삭제',
	       	text: '정말 삭제하시겠습니까 ?',
	        showCancelButton: true,
	        confirmButtonText: '확인',
	        cancelButtonText: '취소'
	    }).then((result) => {
	        if (result.isConfirmed) {
	            $.ajax({
	                url: 'rDelete.bo', // API 엔드포인트로 변경
	                type: 'POST',
	                data: {
	                    replyNo: replyNo, // 수정할 댓글의 번호
	                },
	                success: function(response) {
	                    Swal.fire({
	                        title: '댓글 삭제 완료!',
	                        icon: 'success',
	                        confirmButtonText: 'OK'
	                    }).then(() => {
	                        // 댓글 목록을 다시 로드
	                        selectReplyList();
	                    });
	                },
	                error: function(xhr, status, error) {
	                    Swal.fire({
	                        title: 'Error!',
	                        text: 'There was an error saving your changes.',
	                        icon: 'error',
	                        confirmButtonText: 'OK'
	                    });
	                }
	            });
	        }
	    });
	});
	</script>
    
    
    
    <br><br><br><br><br><br><br><br><br><br>
    <jsp:include page="../common/footer1.jsp"></jsp:include>
    
</body>
</html>
