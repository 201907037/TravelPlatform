<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<jsp:include page="../admin/adminCommon.jsp"></jsp:include>
		<div>
		<form action="insertNotice.ad" method="post" enctype="multipart/form-data">
			<table border="1">
				<tr>
					<th>제목</th>
					<td><input type="text" style="width: 350px" name=noticeTitle
						required></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea
							style="resize: none; height: 300px; width: 350px" name="noticeContent"
							required></textarea>
					</td>
				</tr>
				<tr>
					<th><label for="upfile">첨부파일</label></th>
					<td><input type="file" id="upfile" name="upfile"></td>
				</tr>

			</table>
				<input type="submit" value="작성">
				<input type="reset" value="취소">
		</form>
	</div>
</body>
</html>