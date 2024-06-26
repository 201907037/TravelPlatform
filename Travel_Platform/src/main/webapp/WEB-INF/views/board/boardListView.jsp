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
            grid-template-rows: repeat(3, auto); /* 세로로 4줄 */
            gap: 100px; /* 게시글 간의 간격 */
            padding: 20px;
            margin: 50px;
        }
        .item {
            border-radius: 5px;
            overflow: hidden;
            transition: transform 0.3s, box-shadow 0.3s;
            height: 440px;
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

        #pagingArea {
            text-align: center;
            margin: 20px 0;
        }

        .pagination {
            display: inline-block;
            padding: 0;
            margin: 0;
        }

        .pagination li {
            display: inline;
            margin: 0 5px;
        }

        .pagination a {
            color: #555;
            padding: 8px 16px;
            text-decoration: none;
            border: 1px solid #ddd;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
        }

        .pagination a:hover {
            background-color: #ddd;
            color: #333;
        }

        .pagination .active a {
            background-color: #555;
            color: white;
            border: 1px solid #555;
        }

        .pagination .disabled a {
            color: #ddd;
            pointer-events: none;
        }

        /* 검색창 관련 스타일 */
        #search_form {
            width: 400px;
            height: 40px;
            margin: auto;
        }

        #search_form>div {
            height: 100%;
            float: left;
        }

        #search_text {
            width: 90%;
        }

        #search_btn {
            width: 10%;
        }

        #search_form input,
        #search_form button {
            width: 100%;
            height: 100%;
            border: 1px solid #F7F7F7;
            box-sizing: border-box;
            outline: none;
        }

        #search_text>#search {
            border-top-left-radius: 12px;
            border-bottom-left-radius: 12px;
            background-color: #F7F7F7;
            border-left-color: #F7F7F7;
            padding-left: 10px;
        }

        #search_btn>#submit {
            border-top-right-radius: 12px;
            border-bottom-right-radius: 12px;
            background-color: #F7F7F7;
            border-right-color: #F7F7F7;
            font-size: 15px;
            font-weight: bold;
        }

        /* 글작성 버튼 스타일 */
        .writeBtn {
            background-color: #f0f0f0;
            color: black;
            padding: 10px 15px;
            border: 0px solid gray;
            border-radius: 5px;
            cursor: pointer;
            font-size: 15px;
            transition: background-color 0.3s ease, color 0.3s ease;
            font-weight: bold;
        }

        .writeBtn:hover {
            background-color: #87CEEB;
            color: white;
        }
         
    </style>
</head>
<body>
    <jsp:include page="../common/header1.jsp"></jsp:include>

    <br><br><br><br><br><br><br><br><br>
    <div align="center" style="font-size: 30px; font-weight: bold;">여러분의 소중한 후기를 남겨주세요. ꒒ ০ ⌵ ୧♡</div>
    <br><br><br>
    <form id="search_form" action="search.ad" method="get">
        <div id="search_text">
            <input id="search" type="search" name="keyword" placeholder="검색..">
        </div>
        <div id="search_btn">
            <button type="submit" id="submit" class="search-button"><i class="fa-solid fa-magnifying-glass"></i></button>
        </div>
    </form>
    <br>
    <div align="right" style="margin-right: 100px">
        <c:if test="${ not empty sessionScope.loginUser }">
            <button type="button" class="writeBtn" onclick="location.href='enrollForm.bo'">글 쓰기</button>
        </c:if>
    </div>
    <div class="container">
        <!-- 게시글 데이터 추출 -->
        <c:forEach var="i" begin="0" end="${requestScope.bList.size() -1}">
            <div class="item" onclick="location.href='detail.bo?bno=${requestScope.bList.get(i).boardNo}'">
                <div class="header">
                    <img src="${ requestScope.mList.get(i).changeName }" alt="Profile Picture">
                    <span>${ requestScope.mList.get(i).nickName }</span>
                </div>
                <img src="${requestScope.biList.get(i).changeName }">
                <div class="info">
                    <h3>${requestScope.bList.get(i).boardTitle}</h3>
                    <span>좋아요: ${ requestScope.likeCount.get(i) }</span><span>, 조회수: ${requestScope.bList.get(i).count}</span>
                    <div style="display: inline-block; text-align: right; width: 55%;" >
                        <span> ${requestScope.bList.get(i).createDate}</span>
                    </div>
                </div>
            </div>
        </c:forEach>
        <!-- 더 많은 게시글을 여기에 추가할 수 있습니다 -->
    </div>
    <!-- 페이징처리 영역 -->
    <div id="pagingArea">
        <ul class="pagination">
            <c:choose>
                <c:when test="${ requestScope.pi.currentPage eq 1 }">
                    <li class="page-item disabled"><a class="page-link" href="#" style="pointer-events: none;">&lt;</a></li>
                </c:when>
                <c:otherwise>
                    <li class="page-item"><a class="page-link" href="selectList.bo?cpage=${ requestScope.pi.currentPage -1 }">&lt;</a></li>
                </c:otherwise>
            </c:choose>
            <c:forEach var="p" begin="${ requestScope.pi.startPage }" end="${ requestScope.pi.endPage }" step="1">
                <c:choose>
                    <c:when test="${ requestScope.pi.currentPage ne p }">           
                        <li class="page-item">
                            <a class="page-link" href="selectList.bo?cpage=${ p }">
                                ${ p }
                            </a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item active">
                            <!-- active 추가시 현재 내가 보고있는 페이지만 색칠됨 -->
                            <a class="page-link">
                                <!-- 현재 내가 보고 있는 페이지이므로 클릭해도 href 속성이 없기때문에 클릭 막기 -->
                                ${ p }
                            </a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:choose>
                <c:when test="${ requestScope.pi.currentPage eq requestScope.pi.maxPage }">
                    <li class="page-item disabled"><a class="page-link" href="#" style="pointer-events: none;">&gt;</a></li>
                </c:when>
                <c:otherwise>
                    <li class="page-item"><a class="page-link" href="selectList.bo?cpage=${ requestScope.pi.currentPage + 1 }">&gt;</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>

    <br><br><br><br>

    <jsp:include page="../common/footer1.jsp"></jsp:include>
</body>
</html>
