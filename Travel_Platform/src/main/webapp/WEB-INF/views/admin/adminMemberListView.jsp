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
	
	<jsp:include page="adminCommon.jsp"></jsp:include>
	<!-- 패딩 영역 -->
	<div style="width: 100%; padding:50px;">
	<!-- 내부 영역 -->
	<div class="card mb-4" style="width: 100%;">
        <div class="card-header">
            <i class="fas fa-table me-1"></i>
            회원 목록
        </div>
        <div class="card-body">
            <table id="datatablesSimple">
                <thead>
                    <tr>
                        <th>아이디</th>
                        <th>비밀번호</th>
                        <th>닉네임</th>
                        <th>이름</th>
                        <th>이메일</th>
                        <th>전화번호</th>
                        <th>주소</th>
                        <th>성별</th>
                        <th>회원가입일</th>
                        <th>가입여부</th>
                    </tr>
                </thead>
                <tbody>
                <!-- 추후에 관리자 계정 제외후 일반 회원만 조회하게끔 구현 예정 -->
                <c:forEach var="m" items="${requestScope.mList}">
                    <tr>
                        <th>${m.userId}</th>
                        <th>${m.userPwd}</th>
                        <th>${m.nickName}</th>
                        <th>${m.name}</th>
                        <th>${m.email}</th>
                        <th>${m.phone}</th>
                        <th>${m.address}</th>
                        <th>${m.gender}</th>
                        <th>${m.createDate}</th>
                        <c:choose>
                        <c:when test="${m.status eq 'Y'}">
                        <th><select name="memberStatus">
                            <option value="Y">가입</option>
                            <option value="N">탈퇴</option>
                        </select></th>
                        </c:when>
                        <c:otherwise>
                        <th><select name="memberStatus">
                            <option value="N">탈퇴</option>
                            <option value="Y">가입</option>
                        </select></th>
                        </c:otherwise>
                        </c:choose>
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