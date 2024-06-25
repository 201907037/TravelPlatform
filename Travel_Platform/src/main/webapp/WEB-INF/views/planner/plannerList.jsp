<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <style>
        /* 전체 div */
        #outer {
            /* border: 1px solid black; */
            width: 1100px;
            height: 830px;
            margin: auto;
            padding: 20px;
            margin-top : 60px;
        }

        /* 게시글 정렬 버튼, 지역 검색창, 검색버튼 그룹 */
        .select {
            font-size: 1em;
            padding: 0.5em 1em;
            border: 2px solid #87CEEB;
            border-radius: 5px;
            box-sizing: border-box;
            transition: border-color 0.3s ease, box-shadow 0.3s ease; /* 트랜지션 효과 추가 */
        }
        /* select 그룹 - 포커스 시(마우스로 클릭 시 변화) */
        .select:focus {
            border-color: #00BFFF;
            box-shadow: 0 0 5px rgba(0, 191, 255, 0.5);
            outline: none;
        }

        /* 지역 검색창 길이 늘임 */
        #region-select { width: 300px; }
        /* 검색 버튼 */
        #region-select-button {
            background-color: skyblue;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s ease; /* 배경색 변화에 트랜지션 추가 */
            border: none;
        }
        #region-select-button:hover {
            background-color: #00BFFF;
        }

        /* 플래너 작성 버튼 */
        #planner-writer {
            font-size: 15px;
            padding: 0.5em 1em;
            width: 150px;
            height: 40px;
            background-color: skyblue;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease; /* 배경색 변화에 트랜지션 추가 */
            float: right;
        }
        #planner-writer:hover {
            background-color: #00BFFF;
        }

        /* 플래너 목록 전체 div */
        .planner-gallery {
            display: flex;
            flex-wrap: wrap;
            justify-content: center; /* 아이템들을 가운데 정렬 */
            gap: 10px; /* 아이템 간격 */
            width: 100%;
        }

        /* 플래너 게시글 하나하나 */
        .planner-thumbnail {
            border: 1px solid lightgray;
            border-radius: 5px;
            width: 220px;
            height: 205px;
            margin: 5px;
            cursor: pointer;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .planner-thumbnail:hover { transform: translateY(-5px); }

        /* 플래너 썸네일 이미지 */
        .planner-thumbnail-image { padding: 10px; }

        /* 플래너 제목, 여행 지역 및 조회수 */
        .planner-ex { padding: 0px 10px; }
        .title {
            width: 200px;
            display: inline-block; /* span 태그를 인라인 블록 요소로 변환 */
            white-space: nowrap; /* 줄바꿈 없이 한 줄 유지 */
            overflow: hidden; /* 넘치는 텍스트 숨김 처리 */
            text-overflow: ellipsis; /* 넘치는 텍스트를 생략 기호(...)로 표시 */
        }
        .region {
            float: left;
            font-size: 12px;
        }
        .count {
            float: right;
            margin-right: 2px;
            font-size: 12px;
        }

        /* 페이징 버튼 */
        .paging-area { margin-top: 30px; }
        .paging-area button {
            color: skyblue;
            background-color: white;
            border: 2px solid skyblue;
            padding: 10px 15px;
            margin: 0px 2px; 
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        button[class^=btn_no]:hover,
        button[class^=left]:hover,
        button[class^=right]:hover {
            background-color: #00BFFF;
            cursor: pointer;
            color: white;
        }
        button[class^=btn-dis]{
        	background-color : blue;
        }
    </style>
</head>
<body>
<jsp:include page="../common/header1.jsp"/>
    <br clear="both">
    <div id="outer">
        <!-- 목록 상단 -->
        <input type="button" id="planner-writer" value="플래너 작성하기">
        
        <select class="select">
            <option>최신순</option>
            <option>조회순</option>
        </select>

        <input type="text" id="region-select" class="select" placeholder="조회하고 싶은 지역을 검색하세요">
        <input type="button" id="region-select-button" class="select" value="검색">

        <br><br>

        <!-- 플래너(게시글) 목록 -->
        <div class="planner-gallery">
        
        </div>

        <!-- 페이징바 -->
		<div align="center" class="paging-area">
            
		</div>
    </div>
<script>
let pno = 1;
	$(function(){
		let msg = '${sessionScope.msg}';
		console.log(msg);
		if(msg!=""){
			alert(msg);
			<c:remove var="msg" scope="session"/>
		}
		getPlanList();
		$("#region-select-button").click(function(){
			let keyword = $("#region-select").val();
			pno=1;
			getPlanSearchList(keyword);
		});
		
		$("#planner-writer").click(function(){
			location.href="goPlanner.pl";
		});
		$(".planner-gallery").on("click","div[class=planner-thumbnail]",function(){
			location.href="detail.pl?pno="+$("input[name=plan_no]").val();
		});
		$(".paging-area").on("click","button[class^=left]",function(){
			pno--;
			getPlanList();
		});
		$(".paging-area").on("click","button[class^=btn_no]",function(){
			pno = $(this).html();
			getPlanList();
		});
		$(".paging-area").on("click","button[class^=right]",function(){
			pno++;
			getPlanList();
		});
	});
		function getPlanSearchList(keyword){
			$(".paging-area").html("");
			$(".planner-gallery").html("");
			$.ajax({
				url : "getPlanSearchList.pl",
				method : "get",
				data : {pno : pno,keyword : keyword},
				success : function(e){
					//console.log(e);
					let list = e.list;
					let pinfo = e.pinfo;
					$.each(list,function(i,v){
						let div = $("<div>").attr("class","planner-thumbnail");
						let planImg = $("<div>").attr("class","planner-thumbnail-imgae").attr("align","center");
						let img = $("<img>").css({width : "200px",height:"130px"}).attr("src",v.changeName);
						planImg.append(img);
						let planexp = $("<div>").attr("class","planner-ex");
						let title = $("<span>").attr("class","title").html(v.planName);
						let br = $("<br>");
						let region;
						if(v.sigunguName==null){
							region = $("<span>").attr("class","region").html(v.areaName);
						}else{
							region = $("<span>").attr("class","region").html(v.sigunguName);
						}
						let count = $("<span>").attr("class","count").html("조회수 : "+v.count);
						planexp.append(title,br,region,count);
						let tno = $("<input>").attr({type : "hidden","name":"plan_no","value":v.planNo});
						
						div.append(planImg,planexp,tno);
						$(".planner-gallery").append(div);
					});
					
					if(pinfo.startPage!=1){
	                    var btnLeft = $("<button>").attr("type","button").attr("id","btn-left").attr("class","left btn btn-success btn-sm").html("&lt;&lt;");
	                    //console.log(btnleft);
	                    $(".paging-area").append(btnLeft);
	                }
	                for(let i = pinfo.startPage;i<=pinfo.endPage;i++){
	                    if(i==pinfo.currentPage){
	                    	var btnNum = $("<button>").attr("type","button").attr("disabled","ture").attr("class","btn-dis btn btn-success btn-sm").text(i);
	                    }else{
	                    	var btnNum = $("<button>").attr("type","button").attr("class","btn_no btn btn-success btn-sm").text(i);
	                    }
	                    
	                    //console.log(btnNum);
	                    $(".paging-area").append(btnNum);
	                }
	                if(pinfo.maxPage!=pinfo.endPage){
	                    
	                    var btnRight = $("<button>").attr("type","button").attr("id","btn-right").attr("class","right btn btn-success btn-sm").html("&gt;&gt;");
	                    $(".paging-area").append(btnRight);
	                }
				},
				error : function(){
					console.log("실패");
				}
			});
	function getPlanList(){
		$(".paging-area").html("");
		$(".planner-gallery").html("");
		$.ajax({
			url : "getPlanList.pl",
			method : "get",
			data : {pno : pno},
			success : function(e){
				console.log(e);
				let list = e.list;
				let pinfo = e.pinfo;
				$.each(list,function(i,v){
					let div = $("<div>").attr("class","planner-thumbnail");
					let planImg = $("<div>").attr("class","planner-thumbnail-imgae").attr("align","center");
					let img = $("<img>").css({width : "200px",height:"130px"}).attr("src",v.changeName);
					planImg.append(img);
					let planexp = $("<div>").attr("class","planner-ex");
					let title = $("<span>").attr("class","title").html(v.planName);
					let br = $("<br>");
					let region;
					if(v.sigunguName==null){
						region = $("<span>").attr("class","region").html(v.areaName);
					}else{
						region = $("<span>").attr("class","region").html(v.sigunguName);
					}
					let count = $("<span>").attr("class","count").html("조회수 : "+v.count);
					planexp.append(title,br,region,count);
					let tno = $("<input>").attr({type : "hidden","name":"plan_no","value":v.planNo});
					
					div.append(planImg,planexp,tno);
					$(".planner-gallery").append(div);
				});
				
				if(pinfo.startPage!=1){
                    var btnLeft = $("<button>").attr("type","button").attr("id","btn-left").attr("class","left btn btn-success btn-sm").html("&lt;&lt;");
                    //console.log(btnleft);
                    $(".paging-area").append(btnLeft);
                }
                for(let i = pinfo.startPage;i<=pinfo.endPage;i++){
                    if(i==pinfo.currentPage){
                    	var btnNum = $("<button>").attr("type","button").attr("disabled","ture").attr("class","btn-dis btn btn-success btn-sm").text(i);
                    }else{
                    	var btnNum = $("<button>").attr("type","button").attr("class","btn_no btn btn-success btn-sm").text(i);
                    }
                    
                    //console.log(btnNum);
                    $(".paging-area").append(btnNum);
                }
                if(pinfo.maxPage!=pinfo.endPage){
                    
                    var btnRight = $("<button>").attr("type","button").attr("id","btn-right").attr("class","right btn btn-success btn-sm").html("&gt;&gt;");
                    $(".paging-area").append(btnRight);
                }
			},
			error : function(){
				console.log("실패");
			}
		});
		
	}
</script>
</body>
</html>