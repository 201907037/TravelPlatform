<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#boardList {
	text-align: center;
}

#boardList>tbody>tr:hover {
	cursor: pointer;
}

#pagingArea {
	width: fit-content;
	margin: auto;
	
}

#searchForm {
	width: 80%;
	margin: auto;
}

#searchForm>* {
	float: left;
	margin: 5px;
}

.select {
	width: 20%;
}

.text {
	width: 53%;
}

.searchBtn {
	width: 20%;
}

.thumbnail {
	height: 150px;
	width: 350px;
}

.list-area {
	border : 1px solid black;
	width: 350px;
	margin: 30px;
	margin-bottom: 10px;
	display: inline-block;
}
#pagingArea>ul{
  display: flex;
  flex-wrap: wrap;
  padding: 0;
  margin: 0;
  list-style: none;
  font-size: 30px;
}
.pagination>li{
  padding: 0;
  margin: 0;
  
}
.outer {
	width: 1200px;
	margin: auto;
	margin-top: 50px;
	font-family: 'WavvePADO-Regular';
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
					<img class="thumbnail" src="${ b.firstimage }"> <br>
					</c:when>
					<c:otherwise>

					<img class="thumbnail" src="resources/image/busan.jpg"> <br>

					</c:otherwise>
					</c:choose>
					<p align="center" style="font-size: 15px">${ b.title }</p>
					<p>이벤트 기간 : ${ b.eventstartdate }~${ b.eventenddate }</p>
					<p style="font-size: 12px;">주소: ${ b.addr1 }</p>

				</div>

			</c:forEach>
		</div>


		<div id="pagingArea">
			<ul class="pagination">

				<c:choose>
					<c:when test="${ requestScope.pi.currentPage eq 1 }">
						<li class="page-item disabled"><a class="page-link" href="#">Previous</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="eventList.bo?cpage=${ requestScope.pi.currentPage - 1 }">
								Previous </a></li>
					</c:otherwise>
				</c:choose>

				<c:forEach var="p" begin="${ requestScope.pi.startPage }"
					end="${ requestScope.pi.endPage }" step="1">

					<c:choose>
						<c:when test="${ requestScope.pi.currentPage ne p }">
							<li class="page-item"><a class="page-link"
								href="eventList.bo?cpage=${ p }"> ${ p } </a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item active"><a class="page-link"> ${ p }
							</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:choose>
					<c:when
						test="${ requestScope.pi.currentPage eq requestScope.pi.maxPage }">
						<li class="page-item disabled"><a class="page-link" href="#">
								Next </a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="eventList.bo?cpage=${ requestScope.pi.currentPage + 1 }">
								Next </a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>

	</div>
</div>
</body>
</html>