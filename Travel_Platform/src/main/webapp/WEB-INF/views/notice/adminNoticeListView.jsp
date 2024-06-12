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
     #datatablesSimple>tbody>tr:hover {cursor:pointer;}
     .updateBtn, .delateBtn{
       display: block;
	  width: 100%;
	  border: none;
	  background-color: #04AA6D;
	  padding: 14px 28px;
	  font-size: 16px;
	  cursor: pointer;
	  text-align: center;
  }
</style>
</head>
<body>


	<jsp:include page="../admin/adminCommon.jsp"></jsp:include>
			<!-- 패딩 영역 -->
	<div style="width: 100%; padding:50px;">
	<!-- 내부 영역 -->
	<div class="card mb-4" style="width: 100%;">
        <div class="card-header">
            <i class="fas fa-table me-1"></i>
            공지사항 목록
            <button type="button" style="float: right;" onclick="location.href='enrollFormNotice.ad'">글쓰기</button>
        </div>
        <div class="card-body">
            <table id="datatablesSimple">
                <thead>
                    <tr>
                        <th>공지사항 번호</th>
                        <th>제목</th>
                        <th>내용</th>
                        <th>작성일</th>
                        <th style="width:30px;">수정</th>
                        <th style="width:30px;">삭제</th>
                    </tr>
                </thead>
                <tbody>
                <!-- 추후에 관리자 계정 제외후 일반 회원만 조회하게끔 구현 예정 -->
                <c:forEach var="n" items="${requestScope.list}">
                    <tr>
                        <th class="num">${n.noticeNo}</th>
                        <th>${n.noticeTitle}</th>
                        <th>${n.noticeContent}</th>
                        <th>${n.createDate}</th>
                        <th onclick="event.stopPropagation();"><button onclick="event.stopPropagation();" class="updateBtn">수정</button></th>
                        <th onclick="event.stopPropagation();"><button onclick="event.stopPropagation();" class="delateBtn">삭제</button></th>
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

	<script>
	$(function(){
		
		// 업데이트 버튼 클릭 시
		$(".updateBtn").on("click", function(e) {
			// console.log(($(this).parents("tr")).children().eq(0).text());
			
			let num = ($(this).parents("tr")).children().eq(0).text();
			console.log(num);
			location.href="updateFormNotice.ad?num="+num;
			
		});
	
		// 삭제 버튼 클릭 시
		$(".delateBtn").on("click", function(e){
			
			let num = ($(this).parents("tr")).children().eq(0).text();
			console.log(num);
			location.href="deleteNotice.ad?num="+num;
			
		});
		
		// 클릭 시 상세보기
		$("#datatablesSimple>tbody>tr").click(function(){
			
			// console.log($(this).children().eq(0).text());
			
			let num = $(this).children().eq(0).text();
			
			location.href="detailNotice.bo?num="+num;
		});
		
		
	})
	


	</script>
</body>
</html>