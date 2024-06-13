<!-- 유진 - 관리자 여행지 목록 (2024.06.10) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<style>
	.tour-table>tbody>tr { cursor: pointer; }
	
	/*
	.tour-table {
		table-layout: fixed;
		width: 100%;
	}
	
	tr > :first-child {
		width: 30%; !important;
	}
	tr > :second-child {
		width: 10%; !important;
	}
	tr > :third-child {
		width: 50%; !important;
	}
	tr > :forth-child {
		width: 10%; !important;
	}
	*/
</style>
</head>
<body>
	<jsp:include page="adminCommon.jsp"></jsp:include>
	<!-- 패딩 영역 -->
	<div style="width: 100%; padding:50px;">
	<!-- 내부 영역 -->
	<div class="card mb-4" style="width: 100%;">
        <div class="card-header">
            <i class="fas fa-table me-1"></i>
           	여행지 목록
        	<button style="float: right" onclick="tourEnroll();">여행지 추가</button>
        	
        	<script>
        		function tourEnroll() {
        			location.href="adminTourEnroll.ad";
        		}
        	</script>
        </div>
        
        <div class="card-body">
            <table id="datatablesSimple" class="tour-table">
                <thead>
                    <tr>
                        <th>여행지명</th>
                        <th>분류</th>
                        <th>주소</th>
                        <th>최초생성일</th>
                    </tr>
                </thead>
                <tbody>
	                <c:forEach var="t" items="${requestScope.tList}">
	                    <tr>
	                        <th>${t.tourName}</th>
	                        <th>
	                        	<c:choose>
								      <c:when test="${t.tourType.equals('tourSpot')}">
								      		관광지
								      </c:when>
								      <c:when test="${t.tourType.equals('lodging')}">
								      		숙박시설
								      </c:when>
								      <c:when test="${t.tourType.equals('restaurant')}">
								      		식당/카페
								      </c:when>
								      <c:otherwise>
								      		레포츠
								      </c:otherwise>
								</c:choose>
	                        </th>
	                        <th>${t.address}</th>
	                        <th>${t.addDate}</th>
	                    </tr>
	                </c:forEach>
                </tbody>
            </table>
        </div>
        	                        <!-- 여행지정보 모달창 -->
	                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-lg" role="document">
									<div class="modal-content">
							      		<div class="modal-header">
							        		<h5 class="modal-title" id="exampleModalLabel">${t.tourName}</h5>
							        		<button type="button" class="close" aria-label="Close">
							          			<span aria-hidden="true">&times;</span>
							        		</button>
							      		</div>
							      		<div class="modal-body">
							        		<div>
							        			<img src="${requestScope.t.thumbImg}">
							        		</div>
							      		</div>
							      		<div class="modal-footer">
						      				<button type="button" class="btn btn-primary">수정</button>
						      				<button type="button" class="btn btn-danger">삭제</button>
							      		</div>
							    	</div>
							  	</div>
							</div>
			<script>
				$(document).ready(function(){
			    	$("#datatablesSimple>tbody>tr").click(function(){
			      		$("#myModal").modal("show");
			    	});
			  	});
				
				$(document).ready(function(){
			    	$(".modal-header>button").click(function(){
			      		$("#myModal").modal("hide");
			    	});
			  	});
			</script>
        <footer class="py-4 bg-light mt-auto">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">Copyright &copy; Your Website 2023</div>
                </div>
            </div>
        </footer>
        </div>
    </div>
</body>
</html>