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
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<style>
	.outer {
            /* border: 1px solid black; */
            width: 1100px;
            height: 1000px;
            margin: auto;
            padding: 20px;
            margin-top : 100px;
     }
   	#nickName,#createDate{
   		float : right;
   	}
   	.comment-content{
      	border : 1px solid black;
      	border-radius : 15px;
      	padding : 10px;
      	margin-bottom : 10px;
      }
      .comment-text{
        word-wrap: break-word;
   		overflow-wrap: break-word;
    	white-space: normal;
      	padding : 5px;
      	border : 1px solid black;
      	border-radius : 15px;
      }
</style>
</head>
<body>
<jsp:include page="../common/header1.jsp"/>
<br clear="both">
<div class="outer">
	<div style="width : 80%;height :10%;margin : auto;">
		<h3>${requestScope.p.planName }</h3>
		
		<span id="createDate">${requestScope.p.createDate}</span>
		<span id="nickName" style="margin-right : 10px;">홍길동</span>&nbsp;
	</div>
	<div id="map" style="width:80%;height:50%;margin : auto;"></div>
<div style="width : 80%; height : 30%;margin : auto;">
	<div>
		<select name="dateList">
			<option value="-1">일정 선택</option>
		</select>
	</div>
	<br>
	<span>여행 일정</span><br>
	<div id="tour-route" style="padding : 10px; height : 50%;border : 1px solid lightgray; border-radius : 15px;">
	여행 일정을 선택하면 이곳에 경로가 나타납니다.
	</div>
</div>
<div style="padding : 10px;width : 80%; height : 20%;margin : auto; border : 1px solid lightgray; border-radius : 15px;">
${requestScope.p.planExp }
</div>
<div style="width : 80%;margin : auto;">
<table id="replyArea" class="table" align="center">
                <thead>
                    <tr>
                    	<!-- 댓글 작성은 로그인한 회원만 가능해야함 -->
                    	<c:choose>
                    		<c:when test="${empty sessionScope.loginUser }">
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
            </table>
            <div id="review-body">
            	
            </div>
            <div id="button-box" align="center">
            </div>
</div>
</div>
<script>
	let x = ${requestScope.xx};
	let y = ${requestScope.yy};
	let list = JSON.parse('${requestScope.list}');
	let p = JSON.parse('${requestScope.planner}');
	let linePath = [];
	let dateMarkerList=[];
	let polylineArr = [];
	let rno=1;
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(y,x),
		level: 7
	};
	var map = new kakao.maps.Map(container, options); // 지도 생성
	let tstart = new Date('${requestScope.p.startDate}');
	let tend = new Date('${requestScope.p.endDate}');
	console.log(tstart);
	console.log(tend);
	tDate = Math.ceil(Math.abs((tstart.getTime()-tend.getTime())/(1000 * 60 * 60 * 24)));
	//console.log(tDate);
	function addReply(){
		let rno=1;
		let content = $("#content").val();
		let pno = ${requestScope.p.planNo};
		$.ajax({
			url : "addReply.pl",
			method : "post",
			data : {content : content,pno : pno},
			success : function(e){
				if(e==1){
					getReply();
					alert("댓글 등록 성공");
					$("#content").val("");
				}
			},
			error : function(){
				console.log("실패");
			}
		});
		
	}
	function getReply(){
		$("#review-body").html("");
		$("#button-box").html("");
		let pno = ${requestScope.p.planNo};
		$.ajax({
			url : "getReply.pl",
			method : "get",
			data : {pno : pno,rno : rno},
			success : function(e) {
				console.log(e);
				let list = e.list;
				let pinfo = e.pinfo;
				$.each(list,function(i,v){
					let review = $("<div>").attr("class","comment-content");
					let header = $("<div>").attr("class","comment-header");
					let br = $("<br>").attr("clear","both");
				
					let userName = $("<span>").attr("class","username").html("작성자 : "+v.nickName);
					let time = $("<span>").attr("class","time").css("float","right").html(moment(v.createDate).format("YYYY/MM/DD HH:mm"));
					header.append(userName,time);
					let content = $("<div>").attr("class","comment-text").html(v.prContent);
					review.append(br,header,content);
					$("#review-body").append(review);
				});
				
				if(pinfo.startPage!=1){
                    var btnLeft = $("<button>").attr("type","button").attr("id","btn-left").attr("class","btn-left btn btn-success btn-sm").html("&lt;&lt;");
                    //console.log(btnleft);
                    $("#button-box").append(btnLeft);
                }
                for(let i = pinfo.startPage;i<=pinfo.endPage;i++){
                    if(i==pinfo.currentPage){
                    	var btnNum = $("<button>").attr("type","button").attr("disabled","ture").attr("class","btn_no btn btn-success btn-sm").text(i);
                    }else{
                    	var btnNum = $("<button>").attr("type","button").attr("class","btn-no btn btn-success btn-sm").text(i);
                    }
                    
                    //console.log(btnNum);
                    $("#button-box").append(btnNum);
                }
                if(pinfo.maxPage!=pinfo.endPage){
                    
                    var btnRight = $("<button>").attr("type","button").attr("id","btn-right").attr("class","btn-right btn btn-success btn-sm").html("&gt;&gt;");
                    $("#button-box").append(btnRight);
                }
			},
			error : function() {
				console.log("실패");
			}
		});
	}
	$(function(){
		for(let i =0;i<tDate;i++){
			let option = $("<option>").attr("value",i).html((i+1)+"일차");
			$("select[name=dateList]").append(option);
		}
		getReply();
		
		$("#button-box").on("click","button[class^=btn-no]",function(){
			rno = $(this).html();
			getReply();
		});
		$("#button-box").on("click","button[class^=btn-left]",function(){
			rno--;
			getReply();
		});
		$("#button-box").on("click","button[class^=btn-right]",function(){
			rno++;
			getReply();
		});
		$("select[name=dateList]").change(function(){
			$("#tour-route").html("");
			linePath = [];
			for(let i =0;i<dateMarkerList.length;i++){
				dateMarkerList[i].setMap(null);
			}
			for(let i=0;i<polylineArr.length;i++){
				polylineArr[i].setMap(null);
			}
			
			dateMarkerList=[];
			polylineArr = [];
			//console.log($(this).val());
			let dateCount = $(this).val();
			//console.log(dateCount);
			let mapXX;
			let mapYY;
			let arr=[];
			if(dateCount!=(-1)){
				$.each(list,function(i,v){
					if(v.dayCount==dateCount){
						var position = new kakao.maps.LatLng(v.mapY,v.mapX);
						marker = new kakao.maps.Marker({
							position : position
						});
						dateMarkerList.push(marker);
						marker.setMap(map);
						linePath.push(new kakao.maps.LatLng(v.mapY,v.mapX));
						
						polyline = new kakao.maps.Polyline({
						    path: linePath, // 선을 구성하는 좌표배열 입니다
						    strokeWeight: 5, // 선의 두께 입니다
						    strokeColor: '#000000', // 선의 색깔입니다
						    strokeOpacity: '1', // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
						    strokeStyle: 'solid' // 선의 스타일입니다
						});
						polyline.setMap(map); 
						polylineArr.push(polyline);
						mapXX = v.mapX;
						mapYY = v.mapY;
						arr.push(v.tourName);
					}
				});
				let day = $("<span>").html((Number(dateCount)+1)+" 일차 ");
				let br = $("<br>");
				$("#tour-route").append(day,br);
				for(let i=0;i<arr.length;i++){
					if(i==(arr.length-1)){
						let span = $("<span>").attr("class","tour").html((i+1)+" : "+arr[i]);
						$("#tour-route").append(span);
					}else{
						let span = $("<span>").attr("class","tour").html((i+1)+" : "+arr[i]);
						$("#tour-route").append(span," -> ");
					}
					
				}
				var newloc =new kakao.maps.LatLng(mapYY,mapXX);
				map.setCenter(newloc);
				map.setLevel(9);
			}else{
				var newloc =new kakao.maps.LatLng(y,x);
				map.setCenter(newloc);
				
				$("#tour-route").html("여행 일정을 선택하면 이곳에 경로가 나타납니다.");
			}
		});
	});
	
</script>

</body>
</html>