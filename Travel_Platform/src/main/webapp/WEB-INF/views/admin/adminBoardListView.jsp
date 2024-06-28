<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 테이블 템플릿 사용시 넣어줘야함 -->
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
</head>
<body>

	<jsp:include page="adminCommon.jsp"></jsp:include>
	<!-- 패딩 영역 -->
	<div style="width: 100%; padding:50px; height: 1000px;">
	<!-- 내부 영역 -->
	<div class="card mb-4" style="width: 100%;">
        <div class="card-header">
            <i class="fas fa-table me-1"></i>
            게시글 목록
        </div>
        <div class="card-body">
            <table id="datatablesSimple">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>내용</th>
                        <th>작성자</th>
                        <th>조회수</th>
                        <th>작성일</th>
                        <th>상태값</th>
                    </tr>
                </thead>
                <tbody>
                <!-- 추후에 관리자 계정 제외후 일반 회원만 조회하게끔 구현 예정 -->
                <c:forEach var="b" items="${requestScope.bList}">
                    <tr>
                        <th>${b.boardNo}</th>
                        <th>${b.boardTitle}</th>
                        <th>${b.boardContent}</th>
                        <th>${b.userNo}</th>
                        <th>${b.count}</th>
                        <th>${b.createDate}</th>
                        <th>
                        <select class="selectBoxYn" name="boardStatus"
                        	onchange="test1(this)">
                        <c:choose>
                        <c:when test="${b.status eq 'Y'}">
                            <option value="Y">Y</option>
                            <option value="N">N</option>
                        </c:when>
                        <c:otherwise>
                          	<option value="N">N</option>
                            <option value="Y">Y</option>
                        </c:otherwise>
                        </c:choose>
                        </select>
                        </th>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            
            <script>
            
            	$(".selectBoxYn").on("change", function(){
            		console.log("aaaaaaaaa");
            	});
            	
            	function test1(e){
            		
            		
            		let boardNo = ($(e).parent()).parent().children().eq(0).text();
					let statusResult = $(e).val();
					
					
					$.ajax({
						url:"adminBoardStatus.ad",
						type: "get",
						data:{
							boardNo : boardNo,
							statusResult : statusResult
						},
						success : function(e){
							alert(e+"성공!");
						},
						error : function(){
							console.log("실패");
						}
					});

            	}

            </script>
            
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