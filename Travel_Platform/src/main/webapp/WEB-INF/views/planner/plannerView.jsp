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
		background-color : lightgray;
		font-weight : bolder;
		transition: .5s;
	}
	#city td>div:hover{
		cursor: pointer;
		
		
	}

	#all{
		width: 600px;
		height: 900px;
		background-color: whitesmoke;
	}

	#areaCode{
		background-color: whitesmoke;
		border : none;
		border-bottom: 1px solid grey;
	}

	#daterange{
		background-color: whitesmoke;
		border: none;
		cursor: pointer;
		border-bottom: 1px solid grey;
		
	}

	#dchanger{
		background-color: inherit;
		border : none;
		border-bottom: 1px solid grey;
	}

	



</style>
</head>
<body>
<jsp:include page="leftbar.jsp"/>

<div class="outer41">
<!-- <div id="header" style="height: 10%;">

</div> -->
<div id="map" style="width:100%;height:95vh;margin : auto;"></div>
</div>
<script>
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(36.9881805555555,127.928144444444),
		level: 12
	};
	var map = new kakao.maps.Map(container, options); // 지도 생성
	

</script>

<!-- 시작할 때 뜨는 모달창 -->
<div class="modal fade" id="DATEPICK" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div id="all" class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">플래너 기본 설정</h1>
        <!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
      </div>
      <div class="modal-body">
        <div>
        	<div style="padding-left : 255px;">
        		여행날짜
        	</div>
			<br>
        	<div align="center">
        		<input type="text" name="daterange" id="daterange" readonly style="width:200px;">
        	</div>
        	<br>
        	<div class="dateSetter" align="center">
        		<table>
        		</table>
        	</div>
        </div>
        <br>
        <div id="ch" align="center">
        	여행지역  <br><br><select id="areaCode" name="areaCode">
        				<option value="0">선택</option>
						<option value="1">서울특별시</option>
						<option value="2">인천광역시</option>
						<option value="3">대전광역시</option>
						<option value="4">대구광역시</option>
						<option value="5">광주광역시</option>
						<option value="6">부산광역시</option>
						<option value="7">울산광역시</option>
						<option value="8">세종특별자치시</option>
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
        <button type="button" class="btn-right btn btn-outline-success">적용</button>
      </div>
    </div>
  </div>
</div>
<!-- 날짜변경모달 -->
<div class="modal fade" id="dateChanger" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">날짜 변경</h1>
        <!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
      </div>
      <div class="modal-body">
        <div>
        	<div style="padding-left : 130px;">
        		<span>여행날짜</span><br>
        	</div>
        	<div id="kk" align="center">
        		<input type="text" name="daterange" id="dchanger" readonly style="width:200px;">
        	</div>
        	<br>
        </div>
      </div>
      <div class="modal-footer">
        <!-- <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button> -->
        <button type="button" class="btn-changer btn btn-outline-success" id="btn-changer">적용</button>
      </div>
    </div>
  </div>
</div>
<script>
let tstart;
let tend;
let tDate;
let dayCount;
let areaCode;
let areaName;
let sigunguCode;
let sigunguCodeNo;
let sigunguName;
let locationXX;
let locationYY;
let planNo = '${requestScope.p.planNo}';
let plan = {};
let planner = [];
let list;
let pObj;

if(planNo!=''){
	pObj = JSON.parse('${requestScope.planner}');
	list = JSON.parse('${requestScope.list}');
	pObj.startDate = pObj.startDate+" 00:00:00";
	pObj.endDate = pObj.endDate+" 23:59:59";
	let startD=new Date(pObj.startDate);
	let endD=new Date(pObj.endDate);
	areaName = '${requestScope.areaName}';
	//console.log(list);
	$("#planner-add-modal input[id=title]").val(pObj.planName);
	$("#message-text").val(pObj.planExp);
	$("#insert-img-box>img").attr("src",pObj.changeName);
	
	if(pObj.sigunguCodeNo==0){
		areaCode = pObj.areaCode;
	}else{
		areaCode = pObj.sigunguCodeNo;
	}
	 
	dayCount = Math.ceil(Math.abs((startD.getTime()-endD.getTime())/(1000 * 60 * 60 * 24)));
	let planList=[];
	for(let i=0;i<dayCount;i++){
		
		let tourList = [];
		let startArr;
		let endArr;
		let planDate;
		$.each(list,function(j,v){
			if(v.dayCount==i){
				//console.log(v);
				startArr = v.startTime.split(":");
				endArr = v.endTime.split(":");
				planDate = v.planDate;
				let tour = {
					address : v.address,
					contentId : v.contentId,
					img : v.timg,
					name : v.tourName,
					time : v.time,
					XX : v.mapX,
					YY : v.mapY,
					tno : v.refTno,
					detailNo : v.detailNo
				};
				tourList.push(tour);
			}
		});
		
		let obj = {
			date : new Date(planDate),
			dayCount : i,
			startTimeH : startArr[0],
			startTimeM : startArr[1],
			endTimeH : endArr[0],
			endTimeM : endArr[1],
			tourList : tourList
		};
		planList.push(obj);
	}
	plan = {areaCode : pObj.areaCode
		   ,sigunguCodeNo:pObj.sigunguCodeNo
		   ,startDate : startD
		   ,endDate : endD
		   ,planList : planList,
			planNo : pObj.planNo};	

for(let i=0;i<dayCount;i++){
	let day = plan.planList[i].date;
	
	let div =  $("<div>").attr("class","date").html((i+1)+"일차 : "+moment(day).format("YYYY/MM/DD"));
	 let hidden = $("<input>").attr({type:"hidden",name:"plannerIndex",value:(i)});
	 //console.log(i);
	 div.append(hidden);
	 $(".d_box").append(div);
}

$.ajax({
	  url : "getLocation.to",
	  method : "GET",
	  async : false,
	  data : {areaCode : areaCode,
		  	  sigunguCodeNo : sigunguCodeNo},
	  success : function(e){
		  //console.log(e);
		  locationXX = e.locationXX;
		  locationYY = e.locationYY;
	  },
	  error : function(){
		  console.log("실패");
	  }
  });

 var newloc =new kakao.maps.LatLng(locationYY,locationXX);
  map.setCenter(newloc);
  if(Number(areaCode)==39){
	  map.setLevel(9);
  }else{
	  map.setLevel(7); 
  }
  id="reForm"
  $("#reForm").attr("action","updatePlan.pl")
}
let today = new Date(new Date().setHours(0));
today.setMinutes(0);
today.setSeconds(0);
let nextday = new Date(today.getFullYear(),today.getMonth(),today.getDate()+1);
nextday.setHours(23);
nextday.setMinutes(59);
nextday.setSeconds(59);
		$(function() {
		  
		  $('#daterange').daterangepicker({
			 	locale: {
			      format: 'YYYY/MM/DD'
			    },
			    opens : 'center',
			    startDate : today,
			    endDate : nextday,
			    minDate : today
		  }, function(start, end, label) {
		    //console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
		   	
		    $('#daterange').on('apply.daterangepicker', function(ev, picker) {
		  	  $("#daterange").val(start.format('YYYY/MM/DD')+" - "+end.format('YYYY/MM/DD'));
		  	  tstart = drp.startDate._d;
			  tend = drp.endDate._d;
			  tDate = Math.ceil(Math.abs((tstart.getTime()-tend.getTime())/(1000 * 60 * 60 * 24)));
			 // console.log(start);
			  //console.log(end);
		  	});
		    $("#daterange").on('showCalendar.daterangepicker',function(){
		    	
		    });
		  });
			$(".btn-default").html("취소");
			$(".btn-primary").html("적용");
		  var drp = $('#daterange').data('daterangepicker');
		  $(".dateSetter").on("change","input[class=dateSelect]",function(){
			  //console.log($(this).val());
			  
		  });
		  
		  $("select[name=areaCode]").change(function(){
			  //console.log($(this).val());
			  let code = $(this).val();
			  $("#city tbody").html("");
			  if(Number(code)>30&&Number(code)<39){
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
							  let div = $("<div>").attr("class","cityEl").html(v.sigunguName).css({"border-radius" : "15px","border" : "1px solid grey"});
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
			  //console.log(tstart==null);
			  //console.log(tend==null);
			  
			  if($("#areaCode").val()!=0){
				  //tstart = drp.startDate._d; // 여행시작일
				  //tend = drp.endDate._d;	 // 여행종료일
				  //tDate = tend.getDate()-tstart.getDate()+1; // 여행일수
				  //tDate = Math.ceil(Math.abs((tstart.getTime()-tend.getTime())/(1000 * 60 * 60 * 24)));
				  areaCode = $("#areaCode").val(); // 여행지역코드
				  sigunguCodeNo=0;
				  if(Number(areaCode)>30&&Number(areaCode)<39){
					  sigunguCodeNo = $(".choose").children().eq(0).val();
					  sigunguCode = $(".choose").children().eq(1).val();
					  areaName = $(".choose").text();
					 
				  }else{
					  areaName = $("#areaCode option:checked").text();
				  }
				  //console.log(sigunguCodeNo);
				  $.ajax({
					  url : "getLocation.to",
					  method : "GET",
					  async : false,
					  data : {areaCode : areaCode,
						  	  sigunguCodeNo : sigunguCodeNo},
					  success : function(e){
						  //console.log(e);
						  locationXX = e.locationXX;
						  locationYY = e.locationYY;
					  },
					  error : function(){
						  console.log("실패");
					  }
				  });
				 
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
				  if(tstart==null){
					  tstart = today;
					  tend = nextday;
					  tDate = Math.ceil(Math.abs((tstart.getTime()-tend.getTime())/(1000 * 60 * 60 * 24)));
				  }
				  
				  if(areaName!=""){
					  let yn = confirm(moment(tstart).format("YYYY/MM/DD")+"~"+moment(tend).format("YYYY/MM/DD")+" "+areaName+" 맞으면 확인을 누르세요.");
					  if(yn==true){
						  $(".date").remove();
						  /* console.log(locationXX);
						  console.log(locationYY);
						  console.log(tstart);
						  console.log(tend);
						  console.log(tDate); */
						  if(plan!=null){
							  plan = {};
						  }
						  var newloc =new kakao.maps.LatLng(locationYY,locationXX);
						  $("#DATEPICK").modal("hide");
						  map.setCenter(newloc);
						  if(Number(areaCode)==39){
							  map.setLevel(9);
						  }else{
							  map.setLevel(7); 
						  }
						  
						  for(let i=0;i<tDate;i++){
							  let day;
							 
							  if(i==0){ 
								  day = tstart;
							  }else{
								  day = new Date(tstart.getFullYear(),tstart.getMonth(),tstart.getDate()+i);
							  }
							  planner[i] = {date : day,dayCount:i,startTimeH : 10,startTimeM : "00",endTimeH: 20,endTimeM:"00"};
							 let div =  $("<div>").attr("class","date").html((i+1)+"일차 : "+moment(day).format("YYYY/MM/DD"));
							 let hidden = $("<input>").attr({type:"hidden",name:"plannerIndex",value:(i)});
							 //console.log(i);
							 div.append(hidden);
							 $(".d_box").append(div);
							 let obj = planner[i];
							 let tourList = [];
							 /* let startTime = new Date(new Date().setHours(obj.startTimeH));
							 let endTime = new Date(new Date().setHours(obj.endTimeH));
							 endTime.setMinutes(obj.endTimeM);
							 startTime.setMinutes(obj.startTimeM);
							 let maxTime = (endTime-startTime)/(1000 * 60 * 60); */
							 for(let i=0;i<=5;i++){
								/*
								obj['p'+i] = {};
								obj['p'+i]["time"] = 2;
								if(i==1||i==4){
									obj['p'+i]["time"] = 1;
								}
								*/
								let p = {};
								p.time = 2;
								if(i==1||i==4){
									p.time = 1;
								}
								tourList.push(p);
							 }
							 obj.tourList = tourList;
						  }
						 plan.startDate = tstart;
						 plan.endDate = tend;
						 plan.planList = planner;
						 plan.areaCode = areaCode;
						 plan.sigunguCodeNo = sigunguCodeNo;
						 //console.log(plan);
						 //console.log(plan);
						 
					  }
				  }else{
					  alert("여행지를 선택하세요.");
				  }
			  }else{
				  alert("여행 지역을 선택하세요.");
			  }
			  
		  });
		  if(planNo==""){
	  			$("#DATEPICK").modal("show");
	  		}
		  $("#changeDate").click(function(){
		  		 if(dateUseIdx!=null){
		  			$(".btn-cl").click(); 
		  		 }
		  		
		  		 if(planNo==''){
		  			 $("#DATEPICK").modal("show");
		  		 }else{
		  			 $("#dateChanger").modal("show");
		  		 }
		  		 	
		  		  
		  	  });
		  $("#btn-changer").click(function(){
		  		 //console.log(tstart);
		  		// console.log(tend);
		  		 //console.log(tDate);
			  if(tstart==null){
				  tstart=plan.startDate;
				  tend = plan.endDate;
				  tDate = Math.ceil(Math.abs((tstart.getTime()-tend.getTime())/(1000 * 60 * 60 * 24)));
			  }
		  		 $(".date").remove();
		  		 plan.startDate=tstart;
		  		 plan.endDate = tend;
		  		 //console.log(dayCount);
		  		 //console.log(plan.startDate);
				// console.log(plan.endDate);
				//console.log(tstart);
				//console.log(tend);
		  		for(let i=0;i<tDate;i++){
		  			let day;
		  			 if(i==0){ 
						  day = tstart;
					  }else{
						  day = new Date(tstart.getFullYear(),tstart.getMonth(),tstart.getDate()+i);
					  }
		  			 //console.log(day);
		  			let div =  $("<div>").attr("class","date").html((i+1)+"일차 : "+moment(day).format("YYYY/MM/DD"));
		  			 let hidden = $("<input>").attr({type:"hidden",name:"plannerIndex",value:(i)});
		  			 //console.log(i);
		  			 div.append(hidden);
		  			 $(".d_box").append(div);
		  			 if(i<dayCount){
		  				 plan.planList[i].date = day;
			  			 plan.planList[i].dayCount = i;
		  			 }else{
		  				 let list = [];
		  				for(let j=0;j<=5;j++){
							let p = {};
							p.time = 2;
							p.detailNo = 0;
							if(j==1||j==4){
								p.time = 1;
							}
							list.push(p);
						 }
		  				 let obj = {
		  						 date : day,
		  						dayCount:i,
		  						startTimeH : 10,
		  						startTimeM : "00",
		  						endTimeH: 20,
		  						endTimeM:"00",
		  						tourList : list
		  				 };
		  				 
		  				plan.planList.push(obj);
		  			 }
		  			
		  		}
		  		dayCount=tDate;
		  		$("#dateChanger").modal("hide");
		  		//console.log(plan);
		  	 });
		  	 
		  	 $("#dchanger").daterangepicker({
				 	locale: {
					      format: 'YYYY/MM/DD'
					    },
					    opens : 'center',
					    startDate : plan.startDate,
					    endDate : plan.endDate,
					    minDate : today
				  }, function(start, end, label) {
				    //console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
				   	
				    $('#dchanger').on('apply.daterangepicker', function(ev, picker) {
				  	  $("#dchanger").val(start.format('YYYY/MM/DD')+" - "+end.format('YYYY/MM/DD'));
				  	  //console.log(drp);
				  	  tstart = dlp.startDate._d;
					  tend = dlp.endDate._d;
					  if(tstart==null){
						  tstart=plan.startDate;
						  tend = plan.endDate;
					  }
					  //console.log(tstart);
					  //console.log(tend);
					  tDate = Math.ceil(Math.abs((tstart.getTime()-tend.getTime())/(1000 * 60 * 60 * 24)));
					 //console.log("시작 시 : "+tstart);
				  		// console.log("끝"+tend);
				  		 
				  		// console.log(tDate);
				  	});
				});
		  	 var dlp = $("#dchanger").data('daterangepicker');
	  	 
});


</script>
</body>
</html>