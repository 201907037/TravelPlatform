<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ef0943861331616097f6a71fe10b40e2"></script> <!-- kakao -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<!-- 부트스트랩  -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<style>
	.outer {
            /* border: 1px solid black; */
            width: 1100px;
            height: 830px;
            margin: auto;
            padding: 20px;
     }
</style>
</head>
<body>
<div style="width : 100%; height : 15%;">
header?
</div>
<div class="outer">
	<div style="width : 80%;height :5%;margin : auto;">제목</div>
	<div id="map" style="width:80%;height:50%;margin : auto;"></div>
<div style="width : 80%; height : 10%;margin : auto;">
	여행지 설명
</div>
<div style="width : 80%; height : 20%;margin : auto;">
content 영역
</div>
<div style="width : 80%;margin : auto;">
<table id="replyArea" class="table" align="center">
                <thead>
                    <tr>
                    	<!-- 댓글 작성은 로그인한 회원만 가능해야함 -->
                    	<c:choose>
                    		<c:when test="${ empty sessionScope.loginUser }">
                    			<!-- 로그인 전 -->
                    			<th colspan="2">
		                            <textarea class="form-control" name="" id="content" cols="55" rows="2" style="resize:none; width:100%;" readonly>로그인한 사용자만 이용 가능한 서비스입니다. 로그인 후 이용해주세요.</textarea>
		                        </th>
		                        <th style="vertical-align:middle"><button class="btn btn-secondary" disabled>등록하기</button></th>
                    		</c:when>
                    		<c:otherwise>
                    			<!-- 로그인 후 -->
		                        <th colspan="2">
		                            <textarea class="form-control" name="" id="content" cols="55" rows="2" style="resize:none; width:100%;"></textarea>
		                        </th>
		                        <th style="vertical-align:middle"><button class="btn btn-secondary" onclick="addReply();">등록하기</button></th>
                    		</c:otherwise>
                    	</c:choose>
                    </tr>
                    <tr>
                        <td colspan="3">댓글(<span id="rcount">0</span>)</td>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
</div>
</div>
<script>
	let x = ${requestScope.xx};
	let y = ${requestScope.yy};
	console.log(x);
	console.log(y);
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(y,x),
		level: 7
	};
	var map = new kakao.maps.Map(container, options); // 지도 생성
	

</script>

</body>
</html>