<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dynamic Image Board</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            display: grid;
            grid-template-columns: repeat(4, 1fr); /* 가로로 4줄 */
            grid-template-rows: repeat(4, auto); /* 세로로 4줄 */
            gap: 100px; /* 게시글 간의 간격 */
            padding: 20px;
            margin: 50px;
        }
        .item {
            border-radius: 5px;
            overflow: hidden;
            transition: transform 0.3s, box-shadow 0.3s;
            height: 420px;
        }
        .item img {
            width: 100%;
            height: 70%;
            border: 1px solid #dbdbdb;
            box-sizing: border-box;
        }
        .item:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 16px rgba(0,0,0,0.3);
        }
        .item .info {
            padding: 10px;
        }
        .item .info h3 {
            margin: 0 0 10px;
            font-size: 16px;
        }
        .item .info p {
            margin: 5px 0;
            color: #555;
        }

        .header {
            padding: 10px;
            display: flex;
            align-items: center;
        }

        .header img {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .header span {
            font-weight: bold;
        }

         #pagingArea {width:fit-content; margin:auto;}
    </style>
</head>
<body>
	<jsp:include page="../common/header1.jsp"></jsp:include>
	

    <br><br><br><br><br><br><br><br><br>
    <div align="center" style="font-size: 30px; font-weight: bold;">자유게시판</div>
    <div align="right" style="margin-right: 100px">
        <button type="button" onclick="location.href='enrollForm.bo'">글작성임시버튼</button>
    </div>
    <div class="container">
    	
    	<!-- 게시글 데이터 추출 -->
    	
    	<c:forEach var="i" begin="0" end="${requestScope.bList.size() - 1}">
        <div class="item">
            <div class="header">
                <img src="https://via.placeholder.com/32" alt="Profile Picture">
                <span>faker</span>
            </div>
            <img src="${requestScope.biList.get(i).changeName }">
            <div class="info">
                <h3>${requestScope.bList.get(i).boardTitle}</h3>
                <span>조회수: ${requestScope.bList.get(i).count}</span><span>, 좋아요: 0</span><span>, 작성일: ${requestScope.bList.get(i).createDate}</span>
            </div>
        </div>
        </c:forEach>
    	 
	    
        <!-- 게시글 1 -->
        <div class="item">
            <div class="header">
                <img src="https://via.placeholder.com/32" alt="Profile Picture">
                <span>faker</span>
            </div>
            <img src="https://www.m-i.kr/news/photo/202205/920346_685537_5047.jpg">
            <div class="info">
                <h3>제목</h3>
                <span>조회수,</span><span>좋아요,</span><span>작성일</span>
            </div>
        </div>
        <!-- 게시글 2 -->
        <div class="item">
            <div class="header">
                <img src="https://via.placeholder.com/32" alt="Profile Picture">
                <span>zeus</span>
            </div>
            <img src="https://cdn.ccdn.co.kr/news/photo/202309/934105_433043_4022.jpg">
            <div class="info">
                <h3>제목</h3>
                <span>조회수,</span><span>작성일</span>
            </div>
        </div>
        <!-- 게시글 3 -->
        <div class="item">
            <div class="header">
                <img src="https://via.placeholder.com/32" alt="Profile Picture">
                <span>jQuery</span>
            </div>
            <img src="https://cdn.travie.com/news/photo/first/201605/img_19107_1.jpg" >
            <div class="info">
                <h3>제목</h3>
                <span>조회수,</span><span>작성일</span>
            </div>
        </div>
        <!-- 게시글 4 -->
        <div class="item">
            <div class="header">
                <img src="https://via.placeholder.com/32" alt="Profile Picture">
                <span>oracle</span>
            </div>
            <img src="https://media.triple.guide/triple-cms/c_limit,f_auto,h_1024,w_1024/feb4c9aa-3fe5-4ec7-8c50-4e065d1323d5.jpeg" >
            <div class="info">
                <h3>제목</h3>
                <h3>제목</h3>
                <span>조회수,</span><span>작성일</span>
            </div>
        </div>
        <!-- 게시글 5 -->
        <div class="item">
            <div class="header">
                <img src="https://via.placeholder.com/32" alt="Profile Picture">
                <span>deokhudiary</span>
            </div>
            <img src="https://www.m-i.kr/news/photo/202205/920346_685537_5047.jpg">
            <div class="info">
                <h3>제목</h3>
                <span>조회수,</span><span>작성일</span>
            </div>
        </div>
        <!-- 게시글 6 -->
        <div class="item">
            <div class="header">
                <img src="https://via.placeholder.com/32" alt="Profile Picture">
                <span>basqwe</span>
            </div>
            <img src="https://cdn.ccdn.co.kr/news/photo/202309/934105_433043_4022.jpg">
            <div class="info">
                <h3>제목</h3>
                <span>조회수,</span><span>작성일</span>
            </div>
        </div>
        <!-- 게시글 7 -->
        <div class="item">
            <div class="header">
                <img src="https://via.placeholder.com/32" alt="Profile Picture">
                <span>deddsa</span>
            </div>
            <img src="https://cdn.travie.com/news/photo/first/201605/img_19107_1.jpg" >
            <div class="info">
                <h3>제목</h3>
                <span>조회수,</span><span>작성일</span>
            </div>
        </div>
        <!-- 게시글 8 -->
        <div class="item">
            <div class="header">
                <img src="https://via.placeholder.com/32" alt="Profile Picture">
                <span>hyeono</span>
            </div>
            <img src="https://media.triple.guide/triple-cms/c_limit,f_auto,h_1024,w_1024/feb4c9aa-3fe5-4ec7-8c50-4e065d1323d5.jpeg" >
            <div class="info">
                <h3>제목</h3>
                <span>조회수,</span><span>작성일</span>
            </div>
        </div>
        <!-- 더 많은 게시글을 여기에 추가할 수 있습니다 -->
    </div>
    
    <!-- 이영역에는 페이징처리시 들어갈 버튼나열 부트스트렙 사용할것 -->
    
    
    <jsp:include page="../common/footer1.jsp"></jsp:include>
</body>
</html>
