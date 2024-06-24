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
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .paging-area button:hover {
            background-color: #00BFFF;
            color: white;
        }
    </style>
</head>
<body>

    <br><br><br><br><br><br><br><br>
    
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
        <c:forEach var="i" begin="0" end="11">
            <div class="planner-thumbnail">
                <div class="planner-thumbnail-image">
                    <img src="resources/planImg/2024062415441631522.jpg" width="200px" height="130px">
                </div>
                <div class="planner-ex">
				    <span class="title">나의 첫 제주 여행기</span> <br>
                    <span class="region">지역 : 제주</span>
                    <span class="count">조회수 11</span>
				</div>
				<input type="hidden" name="plan_no" value="1"/>
            </div>
        </c:forEach>  
        </div>

        <!-- 페이징바 -->
		<div align="center" class="paging-area">
            <button>&lt;&lt;</button>
            <button>&lt;</button>
            <c:forEach var="i" begin="1" end="10">
            <button>${i}</button>
            </c:forEach>
            <button>&gt;</button>
            <button>&gt;&gt;</button>
		</div>
    </div>
<script>
	$(function(){
		$(".planner-gallery").on("click","div[class=planner-thumbnail]",function(){
			location.href="detail.pl?pno="+$("input[name=plan_no]").val();
		});
	});
</script>
</body>
</html>