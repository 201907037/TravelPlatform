<!-- 유진 - 관리자 여행지 목록 조회 (2024.06.10) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        </div>
        <div class="card-body">
            <table id="datatablesSimple">
                <thead>
                    <tr>
                        <th>여행지명</th>
                        <th>분류</th>
                        <th>지역</th>
                        <th>주소</th>
                        <th>여행지정보</th>
                        <!-- <th>연락처</th>
                        <th>오픈시간</th>
                        <th>휴무일</th> -->
                        <th>최초생성일</th> <!-- 해당 여행지 추가한 날 -->
                        <th>수정 / 삭제</th>
                    </tr>
                </thead>
                <tbody>
	                <c:forEach var="m" items="${requestScope.mList}">
	                    <tr>
	                        <th>${m.tourName}</th>
	                        <th>${m.tourType}</th>
	                        <%-- <th>${m.}</th> --%>
	                        <th>${m.address}</th>
	                        <th>${m.addDate}</th>
	                        <c:if test="${m.status eq 'Y'}">
		                        <th>
		                        	<select name="memberStatus">
		                            	<option value="Y">수정</option>
		                            	<option value="N">삭제</option>
		                        	</select>
		                        </th>
	                        </c:if>
	                    </tr>
	                </c:forEach>
                </tbody>
            </table>
        </div>
        <div>
        
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