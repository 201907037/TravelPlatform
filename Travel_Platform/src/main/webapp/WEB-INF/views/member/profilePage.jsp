<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<style>

    body{
        background-size: cover;
    }
    

    #wrap{
        margin: auto;
        width: 60%;
        height: 1300px;
        background-color: whitesmoke;
        padding: 24px;
        border-radius: 40px;
        
       
        
    }

    #profile{
        margin-left: 25px;
        
    }

    #first{
        width: 100%;
        height: 400px;
        text-align: center;
    }

    #btn{
        background-color:   whitesmoke;
        border: 1px solid black;
        
        outline: none;
        padding: 12px;
        width: 400px;
        cursor: pointer;
    }
    #btn > a{
        width: 100%;
    }

    #btn:hover{
        color: white;
        background-color: black;
    }

    #btn2{
        background-color:   whitesmoke;
        border: 1px solid black;
        border-radius: 2px;
        outline: none;
        padding: 12px;
        width: 800px;
        cursor: pointer;
    }

    #btn2:hover{
        color: white;
        background-color: black;
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
        .paging-area { margin-top: 10px; }
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
    
    	/* 테이블 스타일 */
	    #tb {
	        width: 80%;
	        margin: 20px auto;
	        border-collapse: collapse;
	        background-color: #fff;
	        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	        border-radius: 10px;
	        overflow: hidden;
	    }
	
	    #tb th, #tb td {
	        padding: 15px;
	        text-align: center;
	        border-bottom: 1px solid #f2f2f2;
	    }
	
	    #tb th {
	        background-color: #007bff;
	        color: #fff;
	        font-weight: bold;
	    }
	
	    #tb tr:nth-child(even) {
	        background-color: #f9f9f9;
	    }
	
	   
</style>
</head>
<body background="resources/image/pado.gif">
    <jsp:include page="../common/header1.jsp" />
    <br><br><br><br><br><br><br>
    <div id="wrap" class="animate__animated animate__fadeInLeft">
        
        <h1 align="center"></h1>
        <br><br>

        <div id="first">
            <div>
                <img id="profile" class="profile" src="${requestScope.m.changeName}" alt="Profile Image" style="width: 300px; height: 300px; border-radius: 50%;">
            </div>
            <br><br>
            <h1>${ requestScope.m.nickName }</h1>
            <br><br>
            

            
        </div>


			<div>
            <table id="tb">
            	<tr>
            		<td>닉네임</td>
            		<td>나이</td>
            		<td>성별</td>
            		<td>가입일</td>
            	</tr>
            	<tr>
            		<td>${ requestScope.m.nickName }</td>
            		<td>${ requestScope.m.age }</td>
            		<td>${ requestScope.m.gender }</td>
            		<td>${ requestScope.m.createDate }</td>
            	</tr>
            	
            </table>
            </div>
			<br><br><br>            
            
            <h1>${ requestScope.m.nickName }님의 플래너</h1>

            <div class="planner-gallery">
            </div>
            <!-- 페이징바 -->
            <div align="center" class="paging-area">
            </div>

        <div>
            
            


        </div>







    </div>

    <script>
    let mno = "${requestScope.m.userNo}";
    //console.log(mno);
    let pno = 1;
    // 김동현 플래너 리스트 호출용  함수
    function getPlanList(){
		$(".paging-area").html("");
		$(".planner-gallery").html("");
		$.ajax({
			url : "getOtherPlanList.pl",
			method : "get",
			data : {pno : pno,mno : mno},
			success : function(e){
				console.log(e);
				let list = e.list;
				let pinfo = e.pinfo;
				if(list.length!=0){
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
	                $("#search-result").css("display","none");
				}else{
					let br = $("<br>");
					let div = $("<div>").css("margin-top","100px").html("작성한 플래너가 없습니다.")
					$(".planner-gallery").append(br,div);
				}
			},
			error : function(){
				console.log("실패");
			}
		});
		
	}
    	$(function(){
    		getPlanList();
    		
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
    		
    		$(".planner-gallery").on("click","div[class=planner-thumbnail]",function(){
    			location.href="detail.pl?pno="+$(this).children().eq(2).val();
    		});
    	});
    
    </script>




</body>
</html>