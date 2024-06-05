<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ef0943861331616097f6a71fe10b40e2"></script>

<style>
	.outer41{
		box-sizing: border-box;
		width: 99%;
		height: 900px;
	}
</style>
</head>
<body>
<jsp:include page="leftbar.jsp"/>

<div class="outer41">
<div id="header" style="height: 10%;"></div>
<div id="map" style="width:100%;height:90%;margin : auto;"></div>
</div>
<script>
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(33.450701, 126.570667),
		level: 10
	};
	var map = new kakao.maps.Map(container, options); // 지도 생성
	map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC); 	//교통량 표시
	map.addOverlayMapTypeId(kakao.maps.MapTypeId.TERRAIN);  //지형 표시
</script>
</body>
</html>