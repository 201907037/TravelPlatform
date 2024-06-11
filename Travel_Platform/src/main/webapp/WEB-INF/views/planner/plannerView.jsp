<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ef0943861331616097f6a71fe10b40e2"></script> <!-- kakao -->
<!-- jquery -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<!-- 데이트 피커 -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js" defer></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script> -->
<style>
	.outer41{
		box-sizing: border-box;
		width: 99%;
		height: 900px;
	}
	.choose{
		background-color : red;
		font-weight : bolder;
	}
	#city td>div:hover{
		cursor: pointer;
		background-color : gray;
		
	}
</style>
</head>
<body>
<jsp:include page="leftbar.jsp"/>

<div class="outer41">
<div id="header" style="height: 10%;">

</div>
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

<!-- 시작할 때 뜨는 모달창 -->
<div class="modal fade" id="DATEPICK" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">플래너 기본 설정</h1>
        <!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
      </div>
      <div class="modal-body">
        <div>
        	<div style="padding-left : 130px;">
        		<span>여행날짜</span><br>
        	</div>
        	<div align="center">
        		<input type="text" name="daterange" id="daterange" readonly style="width:200px;">
        	</div>
        </div>
        <br>
        <div align="center">
        	여행지역 <select id="areaCode" name="areaCode">
        				<option value="0">선택</option>
						<option value="1">서울특별시</option>
						<option value="2">인천광역시</option>
						<option value="3">대전광역시</option>
						<option value="4">대구광역시</option>
						<option value="5">광주광역시</option>
						<option value="6">부산광역시</option>
						<option value="7">울산광역시</option>
						<option value="8">세종특별시</option>
						<option value="31">경기도</option>
						<option value="32">강원특별자치도</option>
						<option value="33">충청북도</option>
						<option value="34">충청남도</option>
						<option value="35">경상북도</option>
						<option value="36">경상남도</option>
						<option value="37">전북특별자치도</option>
						<option value="38">전라남도</option>
						<option value="39">제주특별자치도</option>
					</select>
        </div>
        <br>
        <div id="city" align="center">
        	<table style="text-align:center;">
        		<tbody>
        		</tbody>
        	</table>
        </div>
      </div>
      <div class="modal-footer">
        <!-- <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button> -->
        <button type="button" class="btn-right btn btn-primary">적용</button>
      </div>
    </div>
  </div>
</div>
<script>
let tstart;
let tend;
let tDate;
let areaCode;
let areaName;
let sigunguCode;
let sigunguCodenNo;
let sigunguName;
$(function() {
	let today = new Date();
	let nextday = new Date(new Date().setDate(today.getDate()+1));
	//console.log(today);	
	//console.log(nextday)
  
  $('#daterange').daterangepicker({
	 	locale: {
	      format: 'YYYY/MM/DD'
	    },
	    opens : 'center',
	    startDate : today,
	    endDate : nextday
  }, function(start, end, label) {
    //console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
   	
    $('#changeDate').on('apply.daterangepicker', function(ev, picker) {
  	  $("#daterange").val(start.format('YYYY/MM/DD')+" - "+end.format('YYYY/MM/DD'));
  	});
    $("#daterange").on('showCalendar.daterangepicker',function(){
    	
    });
  });
	$(".btn-default").html("취소");
	$(".btn-primary").html("적용");
  var drp = $('#daterange').data('daterangepicker');
  tstart = drp.startDate._d;
  tend = drp.endDate._d;
  
  $("select[name=areaCode]").change(function(){
	  //console.log($(this).val());
	  let code = $(this).val();
	  if(Number(code)>30){
		  $("#city tbody").html("");
		  $.ajax({
			  url : "cityList.to",
			  method : "get",
			  async : true,
			  data : {areaCode : code},
			  success : function(e){
				  //console.log(e);
				  for(let i=0;i<e.length;i++){
					  if(i%3==0){
						  let tr = $("<tr>").attr("id","tr"+Math.floor(i/3));
						  $("#city tbody").append(tr);
					  }
				  }
				  $.each(e,function(i,v){
					  //console.log(v.sigunguName);
					  let td = $("<td>").css({"width" : "100px","height" : "40px"});
					  let div = $("<div>").attr("class","cityEl").html(v.sigunguName).css({"border-radius" : "15px","border" : "1px solid skyblue"});
					  let hidden1 = $("<input>").attr({"type":"hidden","name" : "sigunguCodeNo","value" : v.sigunguCodeNo});
					  let hidden2 = $("<input>").attr({"type":"hidden","name" : "sigunguCode", "value" : v.sigunguCode});
					  div.append(hidden1,hidden2);
					  td.append(div);
					  let tra =$("#tr"+Math.floor(i/3)).append(td);  
				  });
			  },
			  error : function(){
					console.log("실패");  
			  }
		  });
	  }
  });
  
  $("#city").on("click","td",function(){
	  //console.log($(this).html());
	  $("#city td>div").attr("class","cityEl");
	  $(this).children().attr("class","choose");
  });
  
  $("button[class^=btn-right]").click(function(){
	  if($("#areaCode").val()!=0){
		  tstart = drp.startDate._d; // 여행시작일
		  tend = drp.endDate._d;	 // 여행종료일
		  tDate = tend.getDate()-tstart.getDate()+1; // 여행일수
		  areaCode = $("#areaCode").val(); // 여행지역코드
		  
		  if(Number(areaCode)>30){
			  sigunguCodeNo = $(".choose").children().eq(0).val();
			  sigunguCode = $(".choose").children().eq(1).val();
			  areaName = $(".choose").text();
		  }else{
			  areaName = $("#areaCode option:checked").text();
		  }
		  
		 
		  /* console.log(tstart.getDate());
		  console.log(tend.getDate());
		  console.log(tDate);
		  console.log(areaCode);
		  console.log(areaName);
		  if(Number(areaCode)>30){
			  console.log(sigunguCodeNo);
			  console.log(sigunguCode);
			  console.log(sigunguName);
		  } */
		  let yn = confirm(moment(tstart).format("YYYY/MM/DD")+"~"+moment(tend).format("YYYY/MM/DD")+" "+areaName+" 맞으면 확인을 누르세요.");
		  if(yn==true){
			  $("#DATEPICK").modal("hide");
		  }
	  }else{
		  alert("여행 지역을 선택하세요.");
	  }
	  
  });
  $("#DATEPICK").modal("show");
});


</script>
</body>
</html>