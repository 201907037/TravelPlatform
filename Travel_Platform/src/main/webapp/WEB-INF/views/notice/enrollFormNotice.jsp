<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@font-face {
	font-family: 'WavvePADO-Regular';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/2404@1.0/WavvePADO-Regular.woff2') format('woff2');
	font-weight: normal;
	font-style: normal;
	
}
	.outer{
		width : 1500px; /* 정민 수정 */
		/* border : 1px dotted lightgray; */
		margin : auto;
		margin-top : 50px;
		padding : 5px;
		font-family: 'WavvePADO-Regular';
	}

	.recipeWrite {
		width: 50%;
	}

	.recipeWrite tr {
		height: 70px;

		
	}

	#recipeName>* {
		float: left;
		margin-right: 20px;
	}

	.recipeWrite textarea {
		margin-bottom: 10px;
		margin-top: 10px;
	}

	@font-face {
		font-family: 'WavvePADO-Regular';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/2404@1.0/WavvePADO-Regular.woff2') format('woff2');
		font-weight: normal;
		font-style: normal;
	}

	.title-name {
		background-color: papayawhip;
		height: 100px;
		border-radius: 60px;
		border : 1px solid #1b1b1b;
	}
	.title-ment{ 
		font-family: "Pacifico", cursive;
		font-weight: 400;
		font-style: normal;
		font-weight: 400;
		font-style: normal;
		font-size: 50px;
		margin-top: 20px;
	}

	.ww{
		margin-left: 40px;
	}

	.oo{
		color: #23443e;
	}

	h2{

		color: #23443e;
	}

	#qq{

		color: white;
		background-color: #23443e;
	}

</style>
</head>
<body>
<body id="bd">
		<jsp:include page="../admin/adminCommon.jsp"></jsp:include>

	<div class="outer">
					<h2 align="center">공지사항 작성</h2>
		<form action="insertNotice.ad" method="post" enctype="multipart/form-data" align="center">
			<table align="center" class="recipeWrite">
			<tr style="border-bottom: 1px solid #23443e;">
					<th class="oo">제목</th>
					<td><input type="text"  name=noticeTitle
						class="form-control" placeholder="제목을 입력해주세요." required></td>
				</tr>

				<tr	style="border-bottom: 1px solid #23443e;">
					<th>이미지</th>
					<td style="text-align: center;">
						<img width='300' height='200'  class='contentImg' style="float: left;">
					</td>
				</tr>
				<tr>

					<th class="oo">내용</th>
					<td><textarea
							name="noticeContent"
							class="form-control" cols="50%" style="resize: none; 		
																	margin-bottom: 10px;
																	margin-top: 10px;
																	height:300px;"
					placeholder="공지사항을 입력해주세요." maxlength="300" required></textarea>
					</td>
				</tr>

			</table>

			<br>
			<input type="submit" class="btn btn-outline-primary ww" value="작성하기">
			<input type="button" class="btn btn-outline-danger ww" onclick="history.back();" value="뒤로가기">
				<input type="file" id="upfile" name="upfile" onchange="loadImg(this);">
		</form>
	</div>
	<script>
		$(function(){
			$("#upfile").hide();
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