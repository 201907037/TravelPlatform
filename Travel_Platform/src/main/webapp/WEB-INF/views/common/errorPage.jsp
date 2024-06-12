<!-- 유진 - 에러페이지 제작 (2024.06.12) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <%-- <jsp:include page="header.jsp" /> --%>

    <br>
    <div align="center">
        <img src="https://cdn2.iconfinder.com/data/icons/oops-404-error/64/208_balloon-bubble-chat-conversation-sorry-speech-256.png">
        <br><br>
        <h1 style="font-weight:bold;">
        	${ requestScope.errorMsg }
        	<!-- model 이 requestScope 그 자체이기 때문에 -->
        </h1>
    </div>
    <br>

    <jsp:include page="footer1.jsp" />
    
</body>
</html>