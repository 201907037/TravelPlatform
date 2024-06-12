<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- bootStrap4 -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

	<style>
	        #pagingArea {width:fit-content; margin:auto;}
            #noticeList>tbody>tr:hover {cursor:pointer;}
            #noticeList {text-align:center;}
	</style>

</head>
<body>
	<div>
	
		<jsp:include page="../common/header1.jsp" />
		<br><br><br>
		<div class="container" align="center">
			<h2>공지사항 게시판</h2>
			<table id="noticeList" class="table table-hover">
			<thead>
				<tr>
					<th>공지사항 번호</th>
					<th>제목</th>
					<th>내용</th>
					<th>작성일</th>
				</tr>
			</thead>
			<br><br>
			<tbody>
				<c:forEach var="n" items="${ requestScope.nList }">
				<tr>
					<th>${ n.noticeNo }</th>
					<th>${ n.noticeTitle }</th>
					<th>${ n.noticeContent }</th>
					<th>${ n.createDate }</th>
					<input type="hidden" value="${ requestScope.nList }">
				</tr>
				</c:forEach>
			</tbody>
			
			
			</table>
			 <div id="pagingArea">
                <ul class="pagination">
                
                	<c:choose>
                	<c:when test="${ requestScope.pi.currentPage eq 1 }">	
                    	<li class="page-item disabled">
                    		<a class="page-link" href="#">Previous</a>
                    	</li>
                    </c:when>
                    <c:otherwise>
                    	<li class="page-item">
                    		<a class="page-link" 
                    		   href="noticeList.bo?cpage=${ requestScope.pi.currentPage - 1 }">
                    			Previous
                    		</a>
                    	</li>
                    </c:otherwise>
                    </c:choose>
                    
                    <c:forEach var="p" begin="${ requestScope.pi.startPage }"
                    		   end="${ requestScope.pi.endPage }"
                    		   step="1">
                    	
                    	<c:choose>	   
                    	<c:when test="${ requestScope.pi.currentPage ne p }">
                    		<li class="page-item">
		                    	<a class="page-link" href="noticeList.bo?cpage=${ p }">
									${ p }
								</a>
		                    </li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item active">
		                    	<a class="page-link">
									${ p }
								</a>
		                    </li>
                    	</c:otherwise>
	                    </c:choose>
                    </c:forEach>
                    
                    <c:choose>
                    <c:when test="${ requestScope.pi.currentPage eq requestScope.pi.maxPage }">
	                    <li class="page-item disabled">
	                    	<a class="page-link" href="#">
	                    		Next
	                    	</a>
	                    </li>
                    </c:when>
                    <c:otherwise>
	                    <li class="page-item">
	                    	<a class="page-link" 
	                    	   href="noticeList.bo?cpage=${ requestScope.pi.currentPage + 1 }">
	                    		Next
	                    	</a>
	                    </li>
	                </c:otherwise>
                    </c:choose>
                </ul>
            </div>
		</div>
		
		<script>

			$("#noticeList>tbody>tr").on("click", function(){
				
				//console.log($(this).children().eq(0).text());
				let num = $(this).children().eq(0).text();
				location.href="detailNotice.bo?num="+num;
				
			});
			
		</script>
	</div>
</body>
</html>