<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 게시판</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f8f8;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: 50px auto;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .title {
            color: #333;
            margin-bottom: 20px;
            font-size: 24px;
        }

        .notice-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .notice-table th, .notice-table td {
            padding: 12px;
            text-align: left;
        }

        .notice-table th {
            background-color: #f1f1f1;
            border-bottom: 2px solid #ddd;
        }

        .notice-table tr {
            border-bottom: 1px solid #eee;
        }

        .notice-table tr:hover {
            background-color: #f9f9f9;
            cursor: pointer;
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
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
    <div>
        <jsp:include page="../common/header1.jsp" />
        <br><br><br><br>
        <div class="container">
        	<div align=center>
            <h2 class="title">공지사항 목록</h2>
            </div>
            <br>
            <table id="noticeList" class="notice-table">
                <thead>
                    <tr>
                        <th>공지사항 번호</th>
                        <th>제목</th>
                        <th>내용</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="n" items="${ requestScope.nList }">
                    <tr>
                        <td>${ n.noticeNo }</td>
                        <td>${ n.noticeTitle }</td>
                        <td>${ n.noticeContent }</td>
                        <td>${ n.createDate }</td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div id="pagingArea">
                <ul class="pagination">
                    <c:choose>
                    <c:when test="${ requestScope.pi.currentPage eq 1 }">    
                        <li class="page-item disabled">
                            <a class="page-link" href="#">&lt;</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item">
                            <a class="page-link" 
                               href="noticeList.bo?cpage=${ requestScope.pi.currentPage - 1 }">
                                &lt;
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
                                &gt;
                            </a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item">
                            <a class="page-link" 
                               href="noticeList.bo?cpage=${ requestScope.pi.currentPage + 1 }">
                                &gt;
                            </a>
                        </li>
                    </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
        
        <script>
            $(document).ready(function() {
                $("#noticeList>tbody>tr").on("click", function() {
                    let num = $(this).children().eq(0).text();
                    location.href="detailNotice.bo?num=" + num;
                });
            });
        </script>
    </div>
    
	<br><br><br><br>

    <jsp:include page="../common/footer1.jsp"></jsp:include>
</body>
</html>
