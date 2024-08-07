<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

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
        border: 0px solid black;
        outline: none;
        padding: 12px;
        width: 400px;
        cursor: pointer;
        transition: background-color 0.3s ease, color 0.3s ease;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* 그림자 효과 추가 */
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
        border: 0px solid black;
        border-radius: 10px;
        outline: none;
        padding: 12px;
        width: 800px;
        cursor: pointer;
        transition: background-color 0.3s ease, color 0.3s ease;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* 그림자 효과 추가 */
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

        a{
            color: black;
            text-decoration: none;
        }

        a:hover{
            color: black;
            text-decoration: none;
        }
    
</style>
</head>
<body background="resources/image/pado.gif">
    <jsp:include page="../common/header1.jsp" />
    <br><br><br><br><br><br><br>
    <div id="wrap" class="animate__animated animate__fadeInLeft">
        
        <h1 align="center">MyPage</h1>
        <br><br>

        <div id="first">
            <div>
                <img id="profile" class="profile" src="${sessionScope.loginUser.changeName}" alt="Profile Image" style="width: 300px; height: 300px; border-radius: 50%;">
            </div>
            <br><br>
            <h2>${ sessionScope.loginUser.nickName }</h2>
            <br><br>
            
            
        </div>
        
        	<div>
            <table id="tb">
            	<tr>
            		<td>닉네임</td>
            		<td>나이</td>
            		<td>전화번호</td>
            		<td>이메일</td>
            		<td>성별</td>
            		<td>가입일</td>
            	</tr>
            	<tr>
            		<td>${ sessionScope.loginUser.nickName }</td>
            		<td>${ sessionScope.loginUser.age }</td>
            		<td>${ sessionScope.loginUser.phone }</td>
            		<td>${ sessionScope.loginUser.email }</td>
            		<td>${ sessionScope.loginUser.gender }</td>
            		<td>${ sessionScope.loginUser.createDate }</td>
            	</tr>
            	
            </table>
            </div>
			<br><br><br>    
        
        	<div align="center">
	        	<button id="btn" onclick="location.href='myPage.me'">
	                프로필 편집
	            </button>
	
	            <button id="btn" onclick="location.href='updatePassword.me'">
	                비밀번호 변경
	            </button>
	            <br><br>
	
	           
			</div>
			<br><br>
			
            <h1>내 플래너</h1>

            <div class="planner-gallery">
            </div>
            <!-- 페이징바 -->
            <div align="center" class="paging-area">
            </div>

        <div>
            
            


        </div>







    </div>
<!-- 수정 삭제 모달 -->
<div class="modal fade" id="controll-planner" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">플래너 관리</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" align="center">
         원하는 작업을 선택하세요.
      </div>
      <div class="modal-footer">
        
        <button type="button" class="btn btn-success" id="see">보기</button>
        <button type="button" class="btn btn-primary" id="alert">수정</button>
        <button type="button" class="btn btn-secondary" id="delete">삭제</button>
      </div>
    </div>
  </div>
</div>
    <script>
    let pno = 1;
    let planNo;
    // 김동현 플래너 리스트 호출용  함수
    function getPlanList(){
		$(".paging-area").html("");
		$(".planner-gallery").html("");
		$.ajax({
			url : "getMyPlanList.pl",
			method : "get",
			data : {pno : pno},
			success : function(e){
				console.log(e);
				let list = e.list;
				let pinfo = e.pinfo;
				console.log(list.length);
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
					let btn = $("<button>").attr({type : "button",id:"btn2"}).html("플래너 작성하러가기");
					$(".planner-gallery").append(btn);
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
    			//location.href="changePlan.pl?pno="+$(this).children().eq(2).val();
    			planNo = $(this).children().eq(2).val();
    			$("#controll-planner").modal("show");
    		});
    		$("#alert").click(function(){
    			location.href="changePlan.pl?pno="+planNo;
    		});
    		$("#see").click(function(){
    			location.href="detail.pl?pno="+planNo;
    		});
    		$(".planner-gallery").on("click","button[id=btn2]",function(){
    			location.href="goPlanner.pl";
    		});
    		
    		$("#delete").click(function(){
    			pno = 1;
    			$.ajax({
    				url : "delete.pl",
    				method : "get",
    				data : {planNo : planNo},
    				success : function(e){
    					//console.log(e);
    					if(e.rs>0){
    						getPlanList();
    						alert("삭제 완료");
    						$("#controll-planner").modal("hide");
    					}
    				},
    				error : function(){
    					alert("삭제 실패!");
    				}
    			});
    		});
    	});
    
    </script>




</body>
</html>