<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
    #datatablesSimple>tbody>tr:hover {cursor:pointer;}
   

    /* 수정 및 삭제 버튼 스타일 */
    .updateBtn, .deleteBtn {
        display: block;
        width: 100%;
        border: none;
        padding: 10px 20px;
        font-size: 14px;
        cursor: pointer;
        text-align: center;
        border-radius: 5px;
        transition: background-color 0.3s ease, color 0.3s ease;
    }

    /* 수정 버튼 스타일 - 연한 하늘색 */
    .updateBtn {
        background-color: #87CEEB;
        color: white;
    }

    .updateBtn:hover {
        background-color: #6DAEDB;
        color: white;
    }

    /* 삭제 버튼 스타일 */
    .deleteBtn {
        background-color: #f44336;
        color: white;
    }

    .deleteBtn:hover {
        background-color: #e53935;
        color: white;
    }

    /* 글쓰기 버튼 스타일 */
    .writeBtn {
        float: right;
        background-color: #008CBA;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .writeBtn:hover {
        background-color: #007BB5;
        color: white;
    }
</style>
<script>
    // JSP에서 userNo 값을 가져와서 JavaScript 변수에 저장
    var userNo = "${sessionScope.userNo}";
</script>
</head>
<body>

    <jsp:include page="../admin/adminCommon.jsp"></jsp:include>
    <div style="width: 100%; padding:50px;">
        <div class="card mb-4" style="width: 100%;">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                공지사항 목록
                <button type="button" class="writeBtn" onclick="location.href='enrollFormNotice.ad'">글쓰기</button>
            </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                        <tr>
                            <th>공지사항 번호</th>
                            <th>제목</th>
                            <th>내용</th>
                            <th>작성일</th>
                            <th style="width:30px;">수정</th>
                            <th style="width:30px;">삭제</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="n" items="${requestScope.list}">
                            <tr>
                                <td class="num">${n.noticeNo}</td>
                                <td>${n.noticeTitle}</td>
                                <td>${n.noticeContent}</td>
                                <td>${n.createDate}</td>
                                <td>
                                <input type="hidden" value="${ n.changeName }">
                                <button data-notice-no="${n.noticeNo}" class="updateBtn">수정</button></td>
                                <td><button data-notice-no="${n.noticeNo}" class="deleteBtn">삭제</button></td>
                                
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
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

    <script>
    $(function() {
		
        // tr 요소 클릭 시 상세 페이지로 이동
        $("#datatablesSimple tbody").on("click", "tr", function(e) {
            // 버튼을 클릭한 경우 이벤트 무시
            if ($(e.target).is("button")) {
                return;
            }
            
            let num = $(this).children().eq(0).text();
            location.href = "detailNotice.bo?num="+num;
        });
    	
        
        // 업데이트 버튼 클릭 시
        $(".updateBtn").on("click", function(e) {
            e.stopPropagation(); // 부모 요소로의 이벤트 전파를 중단


         	
            Swal.fire({
                title: '공지사항 수정',
                html: `	<form id="updateForm" action="updateNotice.ad" method="post" enctype="multipart/form-data" align="center">
                    <input type="hidden" id="noticeNo" name="noticeNo">
        			<table align="center" class="recipeWrite">
        			<tr>
        					<th class="oo">제목</th>
        					<td><input type="text" name=noticeTitle
        						class="form-control noticeTitle" placeholder="제목을 입력해주세요." required></td>
        				</tr>

        				<tr>
        					<th style="font-size:15px;" width="50">이미지</th>
        					<td style="text-align: center;">
        					<div>
        						<img width='200' height='200' class='contentImg' style="float: none;">
        						</div>
        						</td>
        				</tr>
        				<tr>

        					<th class="oo">내용</th>
        					<td><textarea
        							name="noticeContent"
        							class="form-control noticeContent" cols="50%" style="resize: none; 		
        																	margin-bottom: 10px;
        																	margin-top: 10px;
        																	height:300px;"
        					placeholder="공지사항을 입력해주세요." maxlength="300" required></textarea>
        					</td>
        				</tr>

        			</table>

        			<br>
        				<input type="file" id="upfile" name="reUpfile" onchange="loadImg(this);">
        		</form>`,
                showCancelButton: true,
                confirmButtonText: '수정',
                cancelButtonText: '취소',
                didOpen: () => {
                // 모달이 열렸을 때 실행됩니다.
                let num = $(this).data("notice-no");
				let changeName = $(this).prev().val();
				let title = $(this).parents().eq(1).children(0).eq(1).text();
				let content = $(this).parents().eq(1).children(0).eq(2).text()
				    document.getElementById("noticeNo").value = num;
				    $("#upfile").hide();
				$(".noticeTitle").val(title);
				$(".noticeContent").val(content);
				$(".contentImg").attr("src", changeName);
                },
                preConfirm: () => {
                    document.getElementById("updateForm").submit();
                }
            });
        });

        // 삭제 버튼 클릭 시
        $(".deleteBtn").on("click", function(e) {
            e.stopPropagation(); // 부모 요소로의 이벤트 전파를 중단
        	let num = $(this).data("notice-no");
            console.log(num);
            Swal.fire({
                title: '공지사항 삭제',
                text: '정말 삭제하시겠습니까?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: '삭제',
                cancelButtonText: '취소'
            }).then((result) => {
                if (result.isConfirmed) {
                    location.href = "deleteNotice.ad?num="+num;
                }
            });
        });
    });
    
    
    
	$(document).on("click", ".contentImg", function(){					
		
		$("#upfile").click();
		
	});
	
	function loadImg(inputFile){
		console.log(inputFile.files.length)
		if(inputFile.files.length == 1) {

			let reader = new FileReader(); // 생성자함수


			reader.readAsDataURL(inputFile.files[0]);

			reader.onload = function(e) {

				$(".contentImg").attr("src", e.target.result);
			};

		} else { 

			$(".contentImg").attr("src", null);
		}
	}
    
    
    </script>
</body>
</html>
