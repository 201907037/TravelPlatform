<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/x-icon" href="<%= request.getContextPath()%>/favicon.ico">
	<meta charset="UTF-8">
	<title>Man In Black</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- 온라인 방식 -->
	<style>
		.wrap {
			width: 1000px;
			margin: auto;
			margin-top: 50px;
		}


		#enroll-form input,
		#enroll-form textarea {
			width: 100%;
			box-sizing: border-box;
		}

		

		

	</style>
</head>
<body>
	<div class="wrap">
				<br>
				<h2 align="center">게시글 작성</h2>
				<br>

				
				<form id="enroll-form" action="insert.bo" method="post"
					enctype="multipart/form-data">

					<!-- 작성자의 회원번호 로그인기능 추가시 하드코딩 수정 -->
					<input type="hidden" name="userNo" value="1">
					
						<table align="center">

							<tr>
								<th width="120">제목</th>
								<td colspan="3">
									<input type="text" name="boardTitle" style="min-height: 30px; max-height: 50px;" required>
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td colspan="3">
									<textarea name="boardContent" rows="5" style="resize: none; min-height: 200px; max-height: 300px;" required></textarea>
								</td>
							</tr>
							<tr>
								<th>썸네일 이미지</th>
								<td colspan="3" align="center">
									<!-- 이미지를 업로드 (미리보기 기능) -->
									<img id="titleImg" src="" width="250" height="250">
								</td>

							</tr>
							<tr>
								<th rowspan="2">상세 이미지</th>
								<td>
									<!-- 이미지를 업로드 (미리보기 기능) -->
									<img id="contentImg1" src="" width="250" height="250">
								</td>
								<td>
									<!-- 이미지를 업로드 (미리보기 기능) -->
									<img id="contentImg2" src="" width="250" height="250">
								</td>
								<td>
									<!-- 이미지를 업로드 (미리보기 기능) -->
									<img id="contentImg3" src="" width="250" height="250">
								</td>

							</tr>
							<tr>
								<td>
									<!-- 이미지를 업로드 (미리보기 기능) -->
									<img id="contentImg4" src="" width="250" height="250">
								</td>
								<td>
									<!-- 이미지를 업로드 (미리보기 기능) -->
									<img id="contentImg5" src="" width="250" height="250">
								</td>
								<td>
									<!-- 이미지를 업로드 (미리보기 기능) -->
									<img id="contentImg6" src="" width="250" height="250">
								</td>

							</tr>


						</table>
						
						<br><br>

						<div id="file-area">
							<!-- 대표이미지 : 섬네일은 필수 입력사항 -->
							<input type="file" id="file1" name="upfiles" required onchange="loadImg(this, 1);">
							<input type="file" id="file2" name="upfiles" onchange="loadImg(this, 2);">
							<input type="file" id="file3" name="upfiles" onchange="loadImg(this, 3);">
							<input type="file" id="file4" name="upfiles" onchange="loadImg(this, 4);">
							<input type="file" id="file5" name="upfiles" onchange="loadImg(this, 5);">
							<input type="file" id="file6" name="upfiles" onchange="loadImg(this, 6);">
							<input type="file" id="file7" name="upfiles" onchange="loadImg(this, 7);">
						</div>

						<script>

							$(function () {
								/* display : none 이랑 비슷함 */
								$("#file-area").hide();

								$("#titleImg").click(function () {
									$("#file1").click();
								});

								$("#contentImg1").click(function () {
									$("#file2").click();
								});

								$("#contentImg2").click(function () {
									$("#file3").click();
								});

								$("#contentImg3").click(function () {
									$("#file4").click();
								});
								$("#contentImg4").click(function () {
									$("#file2").click();
								});

								$("#contentImg5").click(function () {
									$("#file3").click();
								});

								$("#contentImg6").click(function () {
									$("#file4").click();
								});

							});




							function loadImg(inputFile, num) {

								// inputFile: 현재 change 이벤트를 당한
								//  		  input type="file" 요소 객체 (타겟)
								// num : 몇번째 input type="file" 요소 객체인지
								// 		 구분용 num 값

								// console.log(inputFile.files);
								// > input type="file" 요소 객체는
								// 내부적으로 files 라는 속성을 갖고 있음!
								// 해당 input type="file" 요소로 입력받은
								// 파일들의 정보들을 "배열" 형식으로 담고 있음

								// console.log(inputFile.files.length);
								// > 배열명.length 는 배열의 크기
								// 파일 선택시 1, 파일 선택 취소시 0이 나옴
								// (즉, 선택된 파일의 갯수)
								// > 파일의 존재 유무를 가려낼 수 있따.

								if (inputFile.files.length == 1) {
									// 선택된 파일이 있는 경우

									// 선택된 파일을 읽어들여서 그 영역에 맞는 곳에 미리보기
									// 파일을 읽어들일 자바스크립트 객체 생성 FileReader 객체
									let reader = new FileReader(); // 생성자 함수

									// FileReader 객체에서 제공하는
									// 파일을 읽어들이는 메소드 속성 호출

									// > 어느 파일을 읽어들일지 매개변수로 제시
									//   inputFile.files[0]
									reader.readAsDataURL(inputFile.files[0]);
									// > 해당 파일을 읽어들이는 순간
									//   해당 그 파일만의 고유한 url 주소 같은게
									//   만들어져서 부여됨
									// > 각 자리에 맞는 img 태그의 src 속성을
									//   해당 url 주소값으로 넣어주면 미리보기됨

									// 파일 읽기가 완료되었을 때 실행할 함수를 정의
									// (즉, url 주소가 부여되었을 때)
									reader.onload = function (e) {
										// e.target == reader == this

										// e 의 target.result 에
										// 각 파일의 url 주소가 담겨있음
										// 각 영역에 맞춰서 이미지 미리보기
										// attr : src 속성추가
										switch (num) {
											case 1:
												$("#titleImg").attr("src", e.target.result);
												break;
											case 2:
												$("#contentImg1").attr("src", e.target.result);
												break;
											case 3:
												$("#contentImg2").attr("src", e.target.result);
												break;
											case 4:
												$("#contentImg3").attr("src", e.target.result);
												break;
											case 5:
												$("#contentImg4").attr("src", e.target.result);
												break;
											case 6:
												$("#contentImg5").attr("src", e.target.result);
												break;
											case 7:
												$("#contentImg6").attr("src", e.target.result);
												break;

										}

									};

								} else {
									// 선택된 파일이 없는 경우

									// 미리보기 사라지게 하기 
									switch (num) {
										case 1:
											$("#titleImg").attr("src", null);
											break;
										case 2:
											$("#contentImg1").attr("src", null);
											break;
										case 3:
											$("#contentImg2").attr("src", null);
											break;
										case 4:
											$("#contentImg3").attr("src", null);
											break;
										case 5:
											$("#contentImg4").attr("src", null);
											break;
										case 6:
											$("#contentImg5").attr("src", null);
											break;
										case 7:
											$("#contentImg6").attr("src", null);
											break;

									}

								}
							}
						</script>

						<br><br>

						<div align="center">
							<button type="submit" class="btn btn-secondary btn-sm">등록하기</button>
						</div>
				</form>

				
	</div>
</body>
</html>