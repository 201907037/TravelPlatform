<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세 조회</title>
<style>
html, body {
    margin: 0;
    padding: 0;
    font-family: 'Arial', sans-serif;
    background-color: #f4f7f6;
}

.container {
    width: 80%;
    margin: 50px auto;
    padding: 20px;
    background-color: white;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.title {
    font-size: 32px;
    font-weight: bold;
    color: #333;
    text-align: center;
    margin-bottom: 20px;
    padding-bottom: 10px;
    border-bottom: 2px solid #eaeaea;
}

.info {
    display: flex;
    justify-content: space-between;
    margin-bottom: 20px;
    padding: 10px 0;
    border-bottom: 1px solid #eaeaea;
    color: #666;
}

.info div {
    flex: 1;
    text-align: center;
}

.info div:first-child {
    text-align: left;
}

.info div:last-child {
    text-align: right;
}

.content {
    font-size: 18px;
    color: #333;
    line-height: 1.6;
    margin-bottom: 20px;
}

.content img {
    max-width: 100%;
    height: auto;
    display: block;
    margin: 20px auto;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.button-container {
    text-align: center;
}

.button-container a {
    display: inline-block;
    padding: 10px 20px;
    background-color: #5cb85c;
    color: white;
    border-radius: 5px;
    text-decoration: none;
    font-size: 16px;
    transition: background-color 0.3s;
}

.button-container a:hover {
    background-color: #4cae4c;
}
</style>
</head>
<body>

    <jsp:include page="../common/header1.jsp" />
    <br><br><br><br><br>
    <div class="container">
        <div class="title">${requestScope.n.noticeTitle}</div>
        <div class="info">
            <div>작성자: 관리자</div>
            <div>작성일: ${ requestScope.n.createDate }</div>
        </div>
        <br><br>
        <div class="content" align="center">
            <c:if test="${not empty requestScope.n.changeName}">
            	<div style="width: 1000px;"> 
                	<img src="${requestScope.n.changeName}" alt="공지사항 이미지" style="width: 100%; height: 100%" >
                </div>
            </c:if>
            <br><br>
            <h3>${requestScope.n.noticeContent}</h3>
        </div>
        <br><br>
        <div class="button-container">
            <a href="javascript:history.back()">뒤로가기</a>
        </div>
    </div>

    <jsp:include page="../common/footer1.jsp" />

</body>
</html>
