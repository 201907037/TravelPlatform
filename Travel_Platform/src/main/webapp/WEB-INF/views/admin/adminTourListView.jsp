<!-- 유진 - 관리자 여행지 목록 (2024.06.10) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<style>
	#datatablesSimple>tbody>tr { cursor: pointer; }
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
            <table id="datatablesSimple">
                <thead>
                    <tr>
                        <th>여행지명</th>
                        <th>분류</th>
                        <th>주소</th>
                        <!-- <th>연락처</th>
                        <th>오픈시간</th>
                        <th>휴무일</th> -->
                        <th>최초생성일</th> <!-- 해당 여행지 추가한 날 -->
                        <th>수정 / 삭제</th>
                    </tr>
                </thead>
                <tbody>
	                <c:forEach var="t" items="${requestScope.tList}">
	                    <tr>
	                        <th>${t.tourName}</th>
	                        <th>${t.tourType}</th>
	                        <th>${t.address}</th>

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
							        		모달 내용을 여기에 작성하세요.
							      		</div>
							      		<div class="modal-footer">
							        		<button type="button" class="btn btn-secondary">닫기</button>
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
								
								$(document).ready(function(){
							    	$(".modal-footer>button").click(function(){
							      		$("#myModal").modal("hide");
							    	});
							  	});
							</script>
	                        
	                        <th>${t.addDate}</th>
	                        <c:if test="${t.status eq 'Y'}">
		                        <th>
		                        	<button>수정</button>
		                        	<button>삭제</button>
		                        </th>
	                        </c:if>
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
</body>
</html>