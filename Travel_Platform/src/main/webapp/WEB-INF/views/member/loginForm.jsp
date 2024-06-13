<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
	*{
    padding: 0;
    margin: 0;
    border: none;
}
body{
    font-size: 14px;
    font-family: 'Roboto', sans-serif;
}

.login-wrapper{
    width: 400px;
    height: 350px;
    padding: 40px;
    box-sizing: border-box;
}

.login-wrapper > h2{
    font-size: 24px;
    color: #6A24FE;
    margin-bottom: 20px;
}
#login-form > input{
    width: 100%;
    height: 48px;
    padding: 0 10px;
    box-sizing: border-box;
    margin-bottom: 16px;
    border-radius: 6px;
    background-color: #F8F8F8;
}
#login-form > input::placeholder{
    color: #D2D2D2;
}
#login-form > input[type="submit"]{
    color: #fff;
    font-size: 16px;
    background-color: #6A24FE;
    margin-top: 20px;
}


#login-form > label{
    color: #999999;
}
#login-form input[type="checkbox"] + label{
    cursor: pointer;
    padding-left: 26px;
    background-image: url("checkbox.png");
    background-repeat: no-repeat;
    background-size: contain;
}
#login-form input[type="checkbox"]:checked + label{
    background-image: url("checkbox-active.png");
    background-repeat: no-repeat;
    background-size: contain;
}

#saveId{
	width : 10px;
}
	</style>
</head>
<body>

<div class="login-wrapper">
        <h2>Login</h2>
        <form method="post" action="login.me" id="login-form">
            <input type="text" class="form-control mb-2 mr-sm-2" 
                        		placeholder="Enter ID" id="userId" name="userId" 
                        		value="${ cookie.saveId.value }" required>
            <input type="password" class="form-control mb-2 mr-sm-2" placeholder="Enter Password" id="userPwd" name="userPwd" required>
            <c:choose>
                    	<c:when test="${ not empty cookie.saveId }">
                    		<!-- 만약 saveId 라는 쿠키가 있다면 : 체크박스가 체크되게끔 -->
	                    	<input type="checkbox" id="saveId" 
	                    			name="saveId" value="y" checked>
	                    	<label for="saveId">아이디 저장</label>
                    	</c:when>
                    	<c:otherwise>
	                    	<input type="checkbox" id="saveId" 
	                    			name="saveId" value="y">
	                    	<label for="saveId">아이디 저장</label>
                    	</c:otherwise>
                    	</c:choose>
            <input type="submit" value="Login">
        </form>
    </div>

</body>
</html>