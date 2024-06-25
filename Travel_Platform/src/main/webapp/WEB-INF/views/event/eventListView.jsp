<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
}

#boardList {
	text-align: center;
}

#boardList > tbody > tr:hover {
	cursor: pointer;
}

#pagingArea {
	width: fit-content;
	margin: auto;
}

#searchForm {
	width: 80%;
	margin: auto;
	display: flex;
	justify-content: center;
}

#searchForm > * {
	margin: 5px;
}

.select, .text, .searchBtn {
	padding: 8px;
	border-radius: 5px;
	border: 1px solid #ddd;
}

.select {
	width: 20%;
}

.text {
	width: 50%;
}

.searchBtn {
	width: 20%;
	background-color: #007bff;
	color: white;
	border: none;
	cursor: pointer;
}

.searchBtn:hover {
	background-color: #0056b3;
}

.thumbnail {
	height: 200px;
	width: 100%;
	object-fit: cover;
	border-bottom: 1px solid #ddd;
}

.list-area {
	border: 1px solid #ddd;
	border-radius: 10px;
	background-color: white;
	width: 350px;
	margin: 20px;
	padding: 15px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	display: inline-block;
	vertical-align: top;
	transition: box-shadow 0.3s ease;
}

.list-area:hover {
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
}

.list-area p {
	margin: 10px 0;
}

#pagingArea ul {
	display: flex;
	justify-content: center;
	padding: 0;
	list-style: none;
	margin: 20px 0;
	font-size: 16px;
}

#pagingArea ul>li {
	margin: 0 5px;
}

#pagingArea ul>li>a {
	display: block;
	padding: 10px 15px;
	text-decoration: none;
	color: black;
	border: 1px solid #ddd;
	border-radius: 5px;
	transition: background-color 0.3s, color 0.3s;
}

#pagingArea ul>li>a:hover {
	background-color: #007bff;
	color: #fff;
}

#pagingArea ul>li.page-item.active>a,
#pagingArea ul>li.page-item.active>a:hover {
	background-color: #007bff;
	color: #fff;
	cursor: default;
}

#pagingArea ul>li.page-item.disabled>a {
	color: #ddd;
	background-color: #f4f4f4;
	cursor: default;
}

.outer {
	width: 80%;
	margin: 50px auto;
}

.container h2 {
	margin-bottom: 30px;
	font-size: 2em;
	color: #333;
}
</style>
</head>
<body>

	<div>
		<jsp:include page="../common/header1.jsp"/>
		<br><br><br>
		<div class="container" align="center">
			<!-- container 영역 -->
			<h2>이벤트 게시판</h2>
			<div id="boardList">
				<c:forEach var="b" items="${ requestScope.list }">
					<div class="list-area" align="center">
						<c:choose>
							<c:when test="${ b.firstimage ne '' }">
								<img class="thumbnail" src="${ b.firstimage }">
							</c:when>
							<c:otherwise>
								<img class="thumbnail" src="resources/image/busan.jpg">
							</c:otherwise>
						</c:choose>
						<p style="font-size: 1.2em; font-weight: bold;">${ b.title }</p>
						<p>이벤트 기간: ${ b.eventstartdate } ~ ${ b.eventenddate }</p>
						<p style="font-size: 0.9em; color: #555;">주소: ${ b.addr1 }</p>
					</div>
				</c:forEach>
			</div>
			<br><br><br><br>
			<div id="pagingArea">
				<ul class="pagination">
					<c:choose>
						<c:when test="${ requestScope.pi.currentPage eq 1 }">
							<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="eventList.bo?cpage=${ requestScope.pi.currentPage - 1 }">Previous</a></li>
						</c:otherwise>
					</c:choose>
					<c:forEach var="p" begin="${ requestScope.pi.startPage }" end="${ requestScope.pi.endPage }" step="1">
						<c:choose>
							<c:when test="${ requestScope.pi.currentPage ne p }">
								<li class="page-item"><a class="page-link" href="eventList.bo?cpage=${ p }">${ p }</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item active"><a class="page-link">${ p }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${ requestScope.pi.currentPage eq requestScope.pi.maxPage }">
							<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="eventList.bo?cpage=${ requestScope.pi.currentPage + 1 }">Next</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</div>

<br><br><br><br>

    <jsp:include page="../common/footer1.jsp"></jsp:include>

</body>
</html>
