<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<div>
		<form action="updateNotice.ad" method="post" enctype="multipart/form-data">
			<input type="hidden" value="${ requestScope.n.noticeNo }" name="noticeNo">
			<table border="1">
				<tr>
					<th>제목</th>
					<td><input type="text" style="width: 350px" name=noticeTitle
						value="${ requestScope.n.noticeTitle }" required></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea
							style="resize: none; height: 300px; width: 350px"
							name="noticeContent" required>${ requestScope.n.noticeContent }</textarea>
					</td>
				</tr>
				<tr>
					<th><label for="reUpfile">첨부파일</label></th>
					<td>
						<input type="file" id="reUpfile" name="reUpfile">
							<c:if test="${ not empty requestScope.n.changeName }">
								기존 파일 있음
								<input type="hidden" name="changeName"
									value="${ requestScope.n.changeName }">
							</c:if>
					</td>

				</tr>
			</table>
			<input type="submit" value="작성">
			<input type="reset" value="취소">
		</form>
	</div>

</body>
</html>