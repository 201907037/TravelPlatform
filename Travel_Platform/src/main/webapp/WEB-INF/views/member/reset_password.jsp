<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Password Reset</title>
</head>
<body>
    <h2>비밀번호 재설정</h2>
    <form action="resetPassword.me" method="post">
        <label for="email">이메일:</label>
        <input type="email" id="email" name="email" required>
        <br>
        <button type="submit">이메일 전송</button>
    </form>
    
    <%-- 결과 메시지 출력 --%>
    <c:if test="${not empty message}">
        <p>${message}</p>
    </c:if>
</body>
</html>