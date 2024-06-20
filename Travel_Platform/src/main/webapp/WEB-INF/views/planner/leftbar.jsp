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
        box-sizing: border-box;
    }
    
   
    .l-navbar {
    position: fixed;
    top: 0;
    left: 0;
    width: 240px;
    height: 100vh;
    background-color: var(--bg-color);
    color: var(--white-color);
    padding: 1.5rem 1.5rem 2rem;
    transition: .5s;
    z-index: var(--z-fixed);
	}
	.nav {
    height: 100%;
    display: flex;
    width : 100%;
    flex-direction: column;
    justify-content: space-between;
    overflow: hidden;
    
	}
	.outer{
		display : flex;
		width : 100%;
		height : 100%;
		
	}
	.nav__brand {
	    display: grid;
	    grid-template-columns: max-content max-content;
	    justify-content: space-between;
	    align-items: center;
	    margin-bottom: 2rem;
	}
	
	.nav__toggle {
	    font-size: 1.25rem;
	    padding: .75rem;
	    cursor: pointer;
	}
	
	.nav__logo {
	    color: var(--white-color);
	    font-weight: 600;
	}
	
	.nav__link {
	    display: grid;
	    grid-template-columns: max-content max-content;
	    align-items: center;
	    column-gap: .75rem;
	    padding: .75rem;
	    color: var(--white-color);
	    border-radius: .5rem;
	    margin-bottom: 1rem;
	    transition: .3s;
	    cursor: pointer;
	}
	
	.nav__link:hover {
	    background-color: cyan;
	}
	
	.nav__icon {
	    font-size: 1.25rem;
	}
	
	.nav_name {
	    font-size: var(--small-font-size);
	}
	
	.left-bar,.leftleft-bar{
        position : absolute;
        width : 500px;
        border-radius : 15px;
        background-color: var(--bg-color);
   		color: var(--white-color);
        height: 95vh;
        z-index : 10;  
       	padding : 5px;
    }
    .t_box{
        width : 100%;
        height : 100px;
        border : 1px solid green;
        border-radius : 15px;
        margin: auto;
        margin-top: 15px;
    }
    .t_img{
        width : 40%;
        height : 100%;
        border : 1px solid black;
        float : left
    }
    .t_img>img{
        width : 100%;
        height : 100%;
    }
    .t_name{
        width: 60%;
        height: 100%;
        border: 1px solid black;
        float : right;
    }
	
	
	.expander {
	    width: calc(var(--nav--width) + 9.25rem); 
	}
	
	
	.body-pd {
	    padding: 2rem 0 0 16rem;
	}
	
	.active {
	    background-color: var(--first-color);
	}
	
	
	.collapse {
	    grid-template-columns: 20px max-content 1fr;
	}
	
	.collapse__link {
	    justify-self: flex-end;
	    transition: .5;
	}
	
	.collapse__menu {
	    display: none;
	    padding: .75rem 2.25rem;
	}
	
	.collapse__sublink {
	    color: var(--sub-color);
	    font-size: var(--small-font-size);
	}
	
	.collapse__sublink:hover {
	    color: var(--white-color);
	}
	
	
	.showCollapse {
	    display: block;
	}
	
	
	.rotate {
	    transform: rotate(180deg);
	    transition: .5s;
	}
	body {
    position: relative;
    margin: 0;
    
    padding: 2rem 0 0 16rem;
    font-family: var(--body-font);
    font-size: var(--normal-font-size);
    transition: .5s;
    
	}
	
	h1 {
	    margin: 0;
	}
	
	ul {
	    margin: 0;
	    padding: 0;
	    list-style: none;
	}
	
	a {
	    text-decoration: none;
	}
	:root {
    --nav--width: 92px;

    /* Colores */
    --first-color: #0c5df4;
    --bg-color: #12192c;
    --sub-color: #b6cefc;
    --white-color: #fff;

    /* Fuente y tipografia */
    --body-font: 'Poppins', sans-serif;
    --normal-font-size: 1rem;
    --small-font-size: .875rem;

    /* z index */
    --z-fixed: 100;
	}
	 .search-div{
        width : 90%;
        margin : auto;
        border : 1px solid black;
        border-radius: 20px;
        vertical-align: middle;
        background-color : white;
    }
    .search-div>table{
        width : 100%;
    }
    .search-div>table>tbody>tr{
    	width : 100%;
    }
    .search-div input {
        width : 270px;
		border: 1px solid #bbb;
        padding: 10px 12px;
        font-size: 14px;
        border-radius: 15px;
        border : 0px;
    }   
    .search-div input[name=keyword]:focus{
        outline: none;
    } 
    .search-div img {
        width: 20px;
        float : left;
        width: 20px;
        margin: 0;
    }
    #search_btn {
        cursor: pointer;
        height: 100%;
        text-align : "center";
        background-color: white;
        border: 0px;
    }
    .search{
    	width : 90%;
    }
    .td1{
    	width : 80%;
    }
    .under-tool>{
    	position : relative;
    }
    #save-plan{
    	height : 40px;
    	background-color : var(--first-color);
    	position : absolute;
    	right : 20px;
    	bottom : 10px;
    	color : white;
    	text-aling : center;
    }
    .addEL{
    	height : 40px;
    	background-color : var(--first-color);
    	color : white;
    }
    #changeDate{
    	height : 40px;
    	background-color : var(--first-color);
    	position : absolute;
    	left : 20px;
    	bottom : 10px;
    	color : white;
    	text-aling : center;
    }
    #save-plan:hover,#changeDate:hover,.addEL:hover{
    	background-color : #0036B5;
    }
    #save-plan>span,#changeDate>span,.addEL>span{
    	padding-bottm : 0px;
    }
	.material-symbols-outlined {
	  font-variation-settings:
	  'FILL' 0,
	  'wght' 5000,
	  'GRAD' 0,
	  'opsz' 48
	}
	.d_box>div{
		text-align : center;
		border : 1px solid green;
		border-radius : 20px;
		margin-top : 10px;
		margin-bottom : 10px;
	}
	.date:hover{
		cursor: pointer;
		border: 3px solid green;
	}
	input[type=number]{
		width : 48px;
		background-color : var(--first-color);
		color : white;
		text-align : left;
	}
	.planObj{
		width : 90%;
		height : 120px;
		border : 1px solid green;
		margin-top : 5px;
	}
	.planTitle{
		border-bottom: 1px solid green;
		
	}
	.adv_search{
		height : 10%;	
	}
	.el_box{
		height : 70%;
	}
	.t_box{
		margin-bottom : 20px;
	}
	.t_box:hover{
		cursor: pointer;
	}
	.address{
		font-size : 12px;
	}
	#planBox{
		overflow:auto;
		overflow-x : hidden;
		height : 100%;
	}
	.d_box{
		overflow:auto;
		overflow-x : hidden;
		height : 100%;
	}
	.ics,.desc{
		width : 24px;
		height : 24px;
		padding : 0px;
	}
	.ics>span,.desc>span{
		font-size : 13px;
		text-aign : center;
	}
	input[type=radio]{
		width : 40px;	
	}
</style>
<!--  <link rel="stylesheet" href="resources/css/styles.css">-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body id="body-pd">

	<div class="l-navbar" id="navbar">
		<div class="outer">
	    <nav class="nav">
	        <div>
	            <div class="nav__brand">
					<span class="material-symbols-outlined">
					travel_explore
					</span>
	                <a id="plan" class="nav__logo">플래너</a>
	            </div>
	            <div class="nav__list">
	            	<!-- <a id="plan" class="dateList nav__link active">
		   				<span class="material-symbols-outlined">
							edit_calendar
						</span>	
	   					<span class="nav_name">일정 관리</span>
	   				</a> -->
	                <a id="station" class="tourList nav__link active">
	                    <span class="material-symbols-outlined">
						map
						</span>
	                    <span class="nav_name">관광지</span>
	                </a>
	                <a id="leport" class="tourList nav__link active">
	                	<span class="material-symbols-outlined">
						downhill_skiing
						</span>
	                	<span class="nav_name">레포츠</span>
	                </a>
	                 <a id="stay" class="tourList nav__link active">
	                    <span class="material-symbols-outlined">
						apartment
						</span>
	                    <span class="nav_name">숙박</span>
	                </a>
	                 <a id="food" class="tourList nav__link active">
	                    <span class="material-symbols-outlined">
						ramen_dining
						</span>
	                    <span class="nav_name">음식점</span>
	                </a>
	            </div>
	            <div class="d_box" style="height : 530px;">
	            	<div>
	            	일정
	            	</div>
	            </div>
	        </div>
	    </nav>
	    </div>
	    <div class="under-tool">
	    	<button class="btn" id="changeDate">
	    		<span class="material-symbols-outlined">
							edit_calendar
				</span>
	    	</button>
	    	<button class="btn" id="save-plan">
	    		<span class="material-symbols-outlined" >
				save
				</span>
	    	</button>
	    </div>
	</div>
	
	<div class="left-bar" style="display : none; width : 0px;">
		<div style="float : right;">
			<button class="btn-cl">&lt;&lt;</button>
		</div>
		<h3 align="center">여행지</h3>
		
		<div align="center" class="search-div">
	       
	            <div class="search">
	                <table>
	                    <tr>
	                        <td class="td1"><input type="text" name="keyword" autocomplete="off" placeholder="검색어 입력"></td>
	                        <td><button type="button"  id="search_btn" ><img src="resources/button-source/search.png"
	                            alt="검색"></button></td>
	                    </tr>
	                </table>
	                <input type="hidden" name="pno" value="1">
	                <input type="hidden" name="flg" value="10">
	                <input type="hidden" name="save_keyword">
	            </div>
	    </div>
	    <div class="adv_search">
	    	 <div align="center">
	    	 <table>
	    	 	<tr>
	    	 		<th style="text-align : right;">관광지명 검색 </th>
	    	 		<td style="width : 40px; text-align : left;"><input type="radio" name="type" value="nameSearch" style="width : 100%;" checked></td>
	    	 	</tr>
	    	 	<tr>
	    	 		<th style="text-align : right;">주변 여행지 검색</th>
	    	 		<td style="width : 40px; text-align : left;"><input type="radio" name="type" value="aroundSearch" style="width : 100%;"></td>
	    	 	</tr>
	    	 </table>
	         </div>
	         
	         <div align="center" style="display : none;"><br>
	         	'<a id="skeyword" style="font-size : 20px;"></a>' 검색 결과
	         </div>
	         <br>
	    </div>
	    
	   	<div class="el_box">
	    </div>
        <div id="button_box" align="center">
        </div>
	</div>
	<div class="leftleft-bar" style="display : none; width : 0px;">
		<div style="float : right;">
			<button class="btn-cl">&lt;&lt;</button>
		</div>
		<h4 align="center">일정관리</h4>
	   	<div class="date_box" align="center">
	   	<input type="hidden" name="dayCount">
	   	<div>
	    	시작시간 
	    	<span>
	    	<button class="ics btn" id="icsStartH" style="color : white;">
		    	<span class="material-symbols-outlined">
				arrow_upward
				</span>
			</button>
	    	<input type="number" min="01" max="24" step="1" value="10" name="startH" readOnly>
	    	<button class="desc btn" id="decStartH" style="color : white;">
	    		<span class="material-symbols-outlined">
					arrow_downward
				</span>
	    	</button>
	    	</span>
	    	 : 
	    	<span>
	    	<button class="ics btn" id="icsStartM" style="color : white;">
		    	<span class="material-symbols-outlined">
				arrow_upward
				</span>
			</button>
			<input type="number" min="00" max="60" step="30" value="00" name="startM" class="endD" readOnly>
	    	<button class="desc btn" id="descStartM" style="color : white;">
		    	<span class="material-symbols-outlined">
					arrow_downward
				</span>
			</button>
	    	</span>
	    	</div>
	    	<div>
	    	종료시간 
	    	<span>
	    	<button class="ics btn" id="icsEndH" style="color : white;">
		    	<span class="material-symbols-outlined">
				arrow_upward
				</span>
			</button>
	    	<input type="number" min="01" max="24" step="1" value="10" name="endH" readOnly>
	    	<button class="desc btn" id="decEndM" style="color : white;">
	    		<span class="material-symbols-outlined">
					arrow_downward
				</span>
	    	</button>
	    	</span>
	    	 : 
	    	<span>
	    	<button class="ics btn" id="icsEndM" style="color : white;">
		    	<span class="material-symbols-outlined">
				arrow_upward
				</span>
			</button>
			<input type="number" min="00" max="60" step="30" value="00" name="endM" class="endD" readOnly>
	    	<button class="desc btn" id="descEndM" style="color : white;">
		    	<span class="material-symbols-outlined">
					arrow_downward
				</span>
			</button>
	    	</span>
	    	</div>
	    	
	    	
	    	<div id="planBox" style="height:750px;"></div>
	   	</div>
	</div>
	
<script>
let type;
let addTo;
let datePlanIdx;
let no = {tPno : 1, aPno : 1,lPno : 1, rPno : 1,sNo:1};
let markerList=[];
let dateUseIdx;
let flag;
let flagTL;
let status;
	function getList(type,pno){
		$.ajax({
			url : "tourList.to",
			method : "GET",
			data : {type : type,areaCode : areaCode,areaName : areaName,pno : pno},
			success : function(e){
				console.log(e);
				let pinfo = e.page;
				$.each(e.list,function(i,v){
					let tbox = $("<div>").attr("class","t_box");
					let timg = $("<div>").attr("class","t_img");
					if(v.thumbImg==null){
						let span = $("<span>").attr("class","material-symbols-outlined").html("close");
						timg.append(span)
					}else{
						let img = $("<img>").attr("src",v.thumbImg);
						timg.append(img);
					}
					let tbody = $("<div>").attr("class","t_name");
					let table = $("<table>").css({"width":"100%","height":"100%"});
					let trN = $("<tr>");
					let tdN = $("<td>").html(v.tourName);
					let trA = $("<tr>");
					let tdA = $("<td>").html(v.address);
					trN.append(tdN);
					trA.append(tdA);
					table.append(trN,trA);
					tbody.append(table);
					let tno = $("<input>").attr({"type":"hidden","name":"tno","value":v.tourNo});
					let contentId = $("<input>").attr({"type":"hidden","name" : "contentId", "value" : v.contentId});
					let xx = $("<input>").attr({"type":"hidden","name" : "XX","value" : v.mapX});
					let yy = $("<input>").attr({"type":"hidden","name" : "YY", "value": v.mapY});
					tbox.append(timg,tbody,tno,contentId,xx,yy);
					$(".el_box").append(tbox);
				});
				
				switch(type){
				case "관광지":
					no.tPno = e.page.currentPage;
					break;
				case "숙박":
					no.aPno = e.page.currentPage;
					break;
				case "음식점":
					no.rPno = e.page.currentPage;
					break;
				case "레포츠":
					no.lPno = e.page.currentPage;
					break;
				}
				
				if(pinfo.startPage!=1){
                    var btnLeft = $("<button>").attr("type","button").attr("id","btn-left").attr("class","left btn btn-success btn-sm").html("&lt;&lt;");
                    //console.log(btnleft);
                    $("#button_box").append(btnLeft);
                }
                for(let i = pinfo.startPage;i<=pinfo.endPage;i++){
                    if(i==pinfo.currentPage){
                    	var btnNum = $("<button>").attr("type","button").attr("disabled","ture").attr("class","btn_no btn btn-success btn-sm").text(i);
                    }else{
                    	var btnNum = $("<button>").attr("type","button").attr("class","btn_no btn btn-success btn-sm").text(i);
                    }
                    
                    //console.log(btnNum);
                    $("#button_box").append(btnNum);
                }
                if(pinfo.maxPage!=pinfo.endPage){
                    
                    var btnRight = $("<button>").attr("type","button").attr("id","btn-right").attr("class","right btn btn-success btn-sm").html("&gt;&gt;");
                    $("#button_box").append(btnRight);
                }
			},
			error : function(){
				console.log("실패");
			}
		});
	}
		function getSearch(type,pno,keyword){
			$.ajax({
				url : "searchTourList.to",
				method : "GET",
				data : {type : type,areaCode : areaCode,areaName : areaName,pno : pno,keyword : $("input[name=keyword]").val()},
				success : function(e){
					console.log(e);
					let pinfo = e.page;
					$.each(e.list,function(i,v){
						let tbox = $("<div>").attr("class","t_box");
						let timg = $("<div>").attr("class","t_img");
						if(v.thumbImg==null){
							let span = $("<span>").attr("class","material-symbols-outlined").html("close");
							timg.append(span)
						}else{
							let img = $("<img>").attr("src",v.thumbImg);
							timg.append(img);
						}
						let tbody = $("<div>").attr("class","t_name");
						let table = $("<table>").css({"width":"100%","height":"100%"});
						let trN = $("<tr>");
						let tdN = $("<td>").html(v.tourName);
						let trA = $("<tr>");
						let tdA = $("<td>").html(v.address);
						trN.append(tdN);
						trA.append(tdA);
						table.append(trN,trA);
						tbody.append(table);
						let tno = $("<input>").attr({"type":"hidden","name":"tno","value":v.tourNo});
						let contentId = $("<input>").attr({"type":"hidden","name" : "contentId", "value" : v.contentId});
						let xx = $("<input>").attr({"type":"hidden","name" : "XX","value" : v.mapX});
						let yy = $("<input>").attr({"type":"hidden","name" : "YY", "value": v.mapY});
						tbox.append(timg,tbody,tno,contentId,xx,yy);
						$(".el_box").append(tbox);
					});
					
					no.sno = e.page.currentPage;
					
					if(pinfo.startPage!=1){
	                    var btnLeft = $("<button>").attr("type","button").attr("id","btn-left").attr("class","search_left btn btn-success btn-sm").html("&lt;&lt;");
	                    //console.log(btnleft);
	                    $("#button_box").append(btnLeft);
	                }
	                for(let i = pinfo.startPage;i<=pinfo.endPage;i++){
	                    if(i==pinfo.currentPage){
	                    	var btnNum = $("<button>").attr("type","button").attr("disabled","ture").attr("class","btn_no btn btn-success btn-sm").text(i);
	                    }else{
	                    	var btnNum = $("<button>").attr("type","button").attr("class","btn_search_no btn btn-success btn-sm").text(i);
	                    }
	                    
	                    //console.log(btnNum);
	                    $("#button_box").append(btnNum);
	                }
	                if(pinfo.maxPage!=pinfo.endPage){
	                    
	                    var btnRight = $("<button>").attr("type","button").attr("id","btn-right").attr("class","search_right btn btn-success btn-sm").html("&gt;&gt;");
	                    $("#button_box").append(btnRight);
	                }
	                $("#skeyword").html(keyword);
	    			$("#skeyword").parent().css("display","block");
				},
				error : function(){
					console.log("실패");
				}
			});
	}
	$(function(){
		$("#search_btn").click(function(){
			$(".el_box").html("");
			$("#button_box").html("");
			$("#skeyword").parent().css("display","none");
			let option = $("input[name=type]").val();
			type=$(this).children().eq(1).html();
			let keyword = $("input[name=keyword]").val();
			$("input[name=save_keyword]").val(keyword);
			type=$(".left-bar>h3").html();
			let pno = no.sNo;
			console.log(type);
			console.log(option);
			console.log(keyword);
			//console.log(sigunguCodeNo);
			if(option=="nameSearch"){
				
				getSearch(type,pno,$("input[name=save_keyword]").val())
			}else{
				
			}
		});
		
		$("#button_box").on("click","button[class^=btn_search_no]",function(){
			$(".el_box").html("");
			$("#button_box").html("");
			
			let pno = $(this).html();
			//console.log(sigunguCodeNo);
			
			getSearch(type,pno,$("input[name=save_keyword]").val());
			
		});
		$("#button_box").on("click","button[class^=search_left]",function(){
			$(".el_box").html("");
			$("#button_box").html("");
			
			let pno=no.sNo;
			pno--;
			getSearch(type,pno,$("input[name=save_keyword]").val());
		});
		$("#button_box").on("click","button[class^=search_right]",function(){
			$(".el_box").html("");
			$("#button_box").html("");
			
			let pno = no.sNo;
			
			pno++;
			getSearch(type,pno,$("input[name=save_keyword]").val());
		});
		$("input[name=keyword]").keypress(function(e){
			//console.log(e.code);
			if(e.code == "Enter"){
				$("#search_btn").click();
			}
		});
		$(".nav__list>a[class^=tourList]").click(function(){
			
				if(dateUseIdx!=null){
					$(".btn-cl").click();
					setTimeout(function(){
						$(".left-bar").css("display","inline");
					},600);
				}else{
					$(".left-bar").css("width","0px");
					$(".left-bar").css("display","inline");
				}
			
			flgTL=1;
			$("#skeyword").parent().css("display","none");
			$("#skeyword").html("");
			$(".left-bar").animate({width : '380px'},500);
			$(".left-bar>h3").html($(this).children().eq(1).html());
			//console.log($(this).children().eq(1).html());
			$(".el_box").html("");
			$("#button_box").html("");
			type=$(this).children().eq(1).html();
			let pno;
			//console.log(sigunguCodeNo);
			switch(type){
			case "관광지":
				pno = no.tPno;
				break;
			case "숙박":
				pno = no.aPno;
				break;
			case "음식점":
				pno = no.rPno;
				break;
			case "레포츠":
				pno = no.lPno;
				break;
			}
			
			getList(type,pno);
			
			
			
			
		});
		$("#button_box").on("click","button[class^=btn_no]",function(){
			$(".el_box").html("");
			$("#button_box").html("");
			
			let pno = $(this).html();
			//console.log(sigunguCodeNo);
			
			getList(type,pno);
		});
		$("#button_box").on("click","button[class^=left]",function(){
			$(".el_box").html("");
			$("#button_box").html("");
			
			let pno;
			//console.log(sigunguCodeNo);
			switch(type){
			case "관광지":
				pno = no.tPno;
				break;
			case "숙박":
				pno = no.aPno;
				break;
			case "음식점":
				pno = no.rPno;
				break;
			case "레포츠":
				pno = no.lPno;
				break;
			}
			pno--;
			getList(type,pno);
		});
		$("#button_box").on("click","button[class^=right]",function(){
			$(".el_box").html("");
			$("#button_box").html("");
			
			let pno;
			//console.log(sigunguCodeNo);
			switch(type){
			case "관광지":
				pno = no.tPno;
				break;
			case "숙박":
				pno = no.aPno;
				break;
			case "음식점":
				pno = no.rPno;
				break;
			case "레포츠":
				pno = no.lPno;
				break;
			}
			pno++;
			getList(type,pno);
		});
		$(".nav__list>a[class^=dateList]").click(function(){
			$(".left-bar").css("display","none").css("width","0px");
			$(".leftleft-bar").css("display","inline");
			
			$(".leftleft-bar").animate({width : '380px'},500);
			$(".leftleft-bar>h3").html($(this).children().eq(1).html());
			
		});
		$(".d_box").on("click","div[class=date]",function(){
			if(flag==null){
				if(dateUseIdx!=null){
					$(".left-bar").css("display","none").css("width","0px");
					$(".btn-cl").click();
					if(status=="NN"){
						return;
					}
					setTimeout(function(){
						$(".leftleft-bar").css("display","inline");
					},500);
					
				}else{
					$(".left-bar").css("display","none").css("width","0px");
					$(".leftleft-bar").css("display","inline");
				}
			}else{
				flag=null;
			}
			
			
			
			$(".leftleft-bar").animate({width : '380px'},500);
			$(".leftleft-bar>h4").html($(this).text());
			//console.log(planner[$(this).children().eq(0).val()]);
			dateUseIdx = $(this).children().eq(0).val();
			let dateObj = plan.planList[dateUseIdx];
			
			//console.log(dateObj);
			$("input[name=startH]").val(dateObj.startTimeH);
			$("input[name=startM]").val(dateObj.startTimeM);
			$("input[name=endH]").val(dateObj.endTimeH);
			$("input[name=endM]").val(dateObj.endTimeM);
			$("input[name=dayCount]").val(dateObj.dayCount);
			//console.log("클릭");
			let startTime = new Date(new Date().setHours(dateObj.startTimeH));
			let endTime = new Date(new Date().setHours(dateObj.endTimeH));
			endTime.setMinutes(dateObj.endTimeM);
			startTime.setMinutes(dateObj.startTimeM);	
			let maxTime = (endTime-startTime)/(1000 * 60 * 60);
			//console.log(maxTime);
			//console.log((endTime-startTime)/(1000 * 60 * 60));
			//console.log(plan);
			$("#planBox").html("");
			for(let i=0;i<dateObj.tourList.length;i++){
				
				let planObj=$("<div>").attr("class","planObj");
				let title=$("<div>").attr("class","planTitle").css("height","28%").html("일정"+(i+1)+" : ");
				let time = $("<input>").attr({"type":"number","step":"0.5","name":"time","value":dateObj.tourList[i].time,"class":"time"}).css("height","90%");
				title.append(time);
				title.append("시간");
				let body=$("<div>").attr("class","planbody").css("height","72%");
				if(dateObj.tourList[i].name==null){
					let button= $("<button>").attr("class","planAdd").html("추가");
					let hidden= $("<input>").attr({"type":"hidden","name" : "datePlanIndex","value": i});
					body.append(button,hidden);
				}else{
					let imgBox = $("<div>").css({"width" : "40%","height" : "100%","float":"left"});
					if(dateObj.tourList[i].img==null){
						let span = $("<span>").attr("class","material-symbols-outlined").html("close");
						imgBox.css("text-align","left").append(span)
					}else{
						let img = $("<img>").attr("src",dateObj.tourList[i].img).css({"width" : "100%","height" : "100%"});
						imgBox.append(img);
					}
					let nameSpace = $("<div>").attr("align","center").css("float","right").css({"width":"60%","height" :"100%"});
					let name = $("<div>").css("border-bottom","1px solid green").html(dateObj.tourList[i].name);
					let address = $("<div>").attr("class","address").css("text-align","left").html(dateObj.tourList[i].address);
					nameSpace.append(name,address);
					let hidden= $("<input>").attr({"type":"hidden","name" : "datePlanIndex","value": i});
					let tno = $("<input>").attr({"type":"hidden","name" : "tno","value": dateObj.tourList[i].tno});
					body.append(imgBox,nameSpace,hidden);
				}
				planObj.append(title,body);
				$("#planBox").append(planObj);
				
			}
			 let dateTotal = $(".planTitle>input[type=number]");
			 let total=0;
			 $.each(dateTotal,function(i,v){
				 total += Number($(v).val()); 
			 });
			 if(total==maxTime){
				 $(".addDiv").remove();
			 }else if(total>maxTime){
				 
			 }else{
				 $(".addDiv").remove();
				 let div = $("<div>").attr("align","center").attr("class","addDiv");
				 let addContent = $("<span>").attr("class","material-symbols-outlined").html("add");
				 let button = $("<button>").attr({"type" : "button","class":"addEL btn"});
				 button.append(addContent);
				 div.append(button);
				 $("#planBox").append(div);
				 
			 }
			//console.log(plan);
		});
		$("#planBox").on("click","button[class=planAdd]",function(){
			addTo = $(this).parent().parent().parent().parent().children().eq(0).val();
			datePlanIdx = $(this).parent().children().eq(1).val();
			console.log(addTo);
			console.log(datePlanIdx);
			//console.log(plan);
			$("#station").click();
		});
		
		$(".el_box").on("click","div[class=t_box]",function(){
			
			//console.log($(this));
			//console.log($(this).children().eq(0).children().attr("src"));
			//console.log($(this).children().eq(1).children().children().eq(0).children().eq(1).text());
			//console.log($(this).children().eq(2).val());
			//console.log(addTo);
			//console.log($(this).children().eq(3).val());
			if(addTo!=null){
				plan.planList[addTo].tourList[datePlanIdx].name = $(this).children().eq(1).children().children().eq(0).children().eq(0).text();
				plan.planList[addTo].tourList[datePlanIdx].img = $(this).children().eq(0).children().attr("src");
				plan.planList[addTo].tourList[datePlanIdx].address = $(this).children().eq(1).children().children().eq(1).children().eq(0).text();
				plan.planList[addTo].tourList[datePlanIdx].tno = $(this).children().eq(2).val();
				plan.planList[addTo].tourList[datePlanIdx].contentId=$(this).children().eq(3).val();
				//console.log(plan.planList[addTo].tourList[datePlanIdx].address.length);
				
				//console.log(plan);
				$("div[class=date]>input[value="+addTo+"]").parent().click();
				no = {tPno : 1, aPno : 1,lPno : 1, rPno : 1,sNo:1};
				addTo=null;
			}else{
				for(let i=0;i<markerList.length;i++){
					markerList[i].setMap(null);
				}
				markerList = [];
				//console.log(marker);
				let mapX = $(this).children().eq(4).val();
				let mapY = $(this).children().eq(5).val();
				var position = new kakao.maps.LatLng(mapY,mapX);
				marker = new kakao.maps.Marker({
					position : position
				});
				markerList.push(marker);
				marker.setMap(map);
				console.log(markerList);
				var newloc =new kakao.maps.LatLng(mapY,mapX);
				map.setCenter(newloc);
				map.setLevel(5);
			}
		});
		$("button[class=btn-cl]").click(function(){
			let bar_cl = $(this).parent().parent().attr("class");
			//console.log($(this));
			if(bar_cl == "left-bar"){
				
				$(".left-bar").animate({width : '0px'},500);
				setTimeout(function(){
					$(".left-bar").css("display","none");
				},500);
				//console.log("발동");
			}else{
				//console.log($(".left-bar").css("width"));
				setTimeout(function(){
					$(".left-bar").css("display","none");
				},400);
				let dateObj = plan.planList[dateUseIdx];
				//console.log(dateObj);
				let startTime = new Date(new Date().setHours(dateObj.startTimeH));
				 let endTime = new Date(new Date().setHours(dateObj.endTimeH));
				 endTime.setMinutes(dateObj.endTimeM);
				 startTime.setMinutes(dateObj.startTimeM);
				 let maxTime = (endTime-startTime)/(1000 * 60 * 60);
				 let dateTotal = $(".planTitle>input[type=number]");
				 let total=0;
				 $.each(dateTotal,function(i,v){
					 total += Number($(v).val()); 
				 });
				 //console.log(Number(maxTime)==total);
				 if(Number(maxTime)==total){
					 status = "YY";
					$(".leftleft-bar").animate({width : '0px'},500);
					setTimeout(function(){
						$(".leftleft-bar").css("display","none");
					},400);
					dateUseIdx = null;	
					//console.log("발동");
				 }else{
					 status = "NN";
					 alert("일정의 총 여행시간과 여행지 여행시간이 일치하지 않습니다.");
					 
				 }
			}
		});
		$("#save-plan").click(function(){
			alert("저장");
		});
		$("#btn_startT").click(function(){
			console.log($("#start1").val());
			$("#start1").val("06:24");
		});
		$(".endD").change(function(){
			let max = Number($(this).attr("max"));
			if($(this).val()>=max){
				$(this).val("00");
			}
		});
		$("button[class^=ics]").click(function(){
			let el = $(this).parent().children().eq(1);
			console.log(el);
			let num = Number(el.val());
			if(el.attr("name")=="startH"||el.attr("name")=="endH"){
				num = num+1;
				if(num==25){
					num="01";
				}
			}else{
				num = num+30;
				if(num==60){
					num="00";
				}
			}
			el.val(num);
			
			let dateObj = plan.planList[dateUseIdx];
			switch(el.attr("name")){
			case "startH":
				dateObj.startTimeH = el.val();
				break;
			case "startM":
				dateObj.startTimeM = el.val();
				break;
			case "endH":
				dateObj.endTimeH = el.val();
				break;
			case "endM":
				dateObj.endTimeM = el.val();
				break;
			}
			
			 let startTime = new Date(new Date().setHours(dateObj.startTimeH));
			 let endTime = new Date(new Date().setHours(dateObj.endTimeH));
			 endTime.setMinutes(dateObj.endTimeM);
			 startTime.setMinutes(dateObj.startTimeM);
			 let maxTime = (endTime-startTime)/(1000 * 60 * 60);
			 let dateTotal = $(".planTitle>input[type=number]");
			 let total=0;
			 flag = 1;
			 $.each(dateTotal,function(i,v){
				 total += Number($(v).val()); 
			 });
			 let minus = Number(maxTime)-total;
			 if(Math.abs(minus)==0.5){
				 dateObj.tourList[dateObj.tourList.length-1].time = Number(dateObj.tourList[dateObj.tourList.length-1].time)+minus; 
				 console.log(plan);
				 $(".d_box input[value="+dateUseIdx+"]").click();
			 }else{
				 if(total==maxTime){
					 flag=null;
					 $(".addDiv").remove();
				 }else if(el.attr("name")=="endH"){
					 if(dateObj.tourList[dateObj.tourList.length-1].time<2){
						 dateObj.tourList[dateObj.tourList.length-1].time = Number(dateObj.tourList[dateObj.tourList.length-1].time)+1; 
						 $(".d_box input[value="+dateUseIdx+"]").click();
					 }else{
						 $(".addDiv").remove();
						 let div = $("<div>").attr("align","center").attr("class","addDiv");
						 let addContent = $("<span>").attr("class","material-symbols-outlined").html("add");
						 let button = $("<button>").attr({"type" : "button","class":"addEL btn"});
						 button.append(addContent);
						 div.append(button);
						 $("#planBox").append(div);
						 flag=null;
					 }
					 
				 }else if(el.attr("name")=="startH"){
					 if(dateObj.tourList[dateObj.tourList.length-1].time>1){
						 dateObj.tourList[dateObj.tourList.length-1].time = Number(dateObj.tourList[dateObj.tourList.length-1].time)-1; 
						 $(".d_box input[value="+dateUseIdx+"]").click();
					 }else{
						 dateObj.tourList.pop();
						 console.log(plan);
						 $(".d_box input[value="+dateUseIdx+"]").click();
					 }
				 }
			 }
			 
			
			 
			
		});
		$("button[class^=desc]").click(function(){
			let el = $(this).parent().children().eq(1);
			let num = Number(el.val());
			if(el.attr("name")=="startH"||el.attr("name")=="endH"){
				num = num-1;
				if(num==25){
					num="01";
				}
			}else{
				num = num-30;
				if(num<=0){
					num="00";
				}
			}
			
			el.val(num);
			
			let dateObj = plan.planList[dateUseIdx];
			switch(el.attr("name")){
			case "startH":
				dateObj.startTimeH = el.val();
				break;
			case "startM":
				dateObj.startTimeM = el.val();
				break;
			case "endH":
				dateObj.endTimeH = el.val();
				break;
			case "endM":
				dateObj.endTimeM = el.val();
				break;
			}
			
			 let startTime = new Date(new Date().setHours(dateObj.startTimeH));
			 let endTime = new Date(new Date().setHours(dateObj.endTimeH));
			 endTime.setMinutes(dateObj.endTimeM);
			 startTime.setMinutes(dateObj.startTimeM);
			 let maxTime = (endTime-startTime)/(1000 * 60 * 60);
			 let dateTotal = $(".planTitle>input[type=number]");
			 let total=0;
			 //console.log(minus);
			 $.each(dateTotal,function(i,v){
				 total += Number($(v).val()); 
			 });
			 flag=1;
			 let minus = Number(maxTime)-total;
			 if(Math.abs(minus)==0.5){
				 console.log(plan);
				 dateObj.tourList[dateObj.tourList.length-1].time = Number(dateObj.tourList[dateObj.tourList.length-1].time)+minus; 
				 $(".d_box input[value="+dateUseIdx+"]").click();
			 }else{
				 if(total==maxTime){
					 flag=null;
					 $(".addDiv").remove();
				 }else if(el.attr("name")=="endH"){
					 if(dateObj.tourList[dateObj.tourList.length-1].time>1){
						 dateObj.tourList[dateObj.tourList.length-1].time = Number(dateObj.tourList[dateObj.tourList.length-1].time)-1; 
						 $(".d_box input[value="+dateUseIdx+"]").click();
					 }else{
						 dateObj.tourList.pop();
						 console.log(plan);
						 $(".d_box input[value="+dateUseIdx+"]").click();
					 }
				 }else if(el.attr("name")=="startH"){
					 if(dateObj.tourList[dateObj.tourList.length-1].time<2){
						 dateObj.tourList[dateObj.tourList.length-1].time = Number(dateObj.tourList[dateObj.tourList.length-1].time)+1; 
						 $(".d_box input[value="+dateUseIdx+"]").click();
					 }else{
						 $(".addDiv").remove();
						 let div = $("<div>").attr("align","center").attr("class","addDiv");
						 let addContent = $("<span>").attr("class","material-symbols-outlined").html("add");
						 let button = $("<button>").attr({"type" : "button","class":"addEL btn"});
						 button.append(addContent);
						 div.append(button);
						 $("#planBox").append(div);
						 flag=null;
					 }
					 
					
					 
				 } 
			 }
			 
			
			 
		});
		$("#planBox").on("click","button[class^=addEL]",function(){
			 let dateObj = plan.planList[dateUseIdx];
			 let startTime = new Date(new Date().setHours(dateObj.startTimeH));
			 let endTime = new Date(new Date().setHours(dateObj.endTimeH));
			 endTime.setMinutes(dateObj.endTimeM);
			 startTime.setMinutes(dateObj.startTimeM);
			 let maxTime = (endTime-startTime)/(1000 * 60 * 60);
			 let dateTotal = $(".planTitle>input[type=number]");
			 let total=0;
			 $.each(dateTotal,function(i,v){
				 total += Number($(v).val()); 
			 });
			 let time = maxTime-total;
			 if(time%2==0){
				 for(let i= 0;i<time/2;i++){
					 let nt = 2;
					 let p = {time : nt};
					 dateObj.tourList.push(p);
				 }
			 }else{
				 let nt = 2;
				 for(let i =0;i<(time-1)/2;i++){
					 
					 let p = {time : nt};
					 dateObj.tourList.push(p);
				 }
				 nt = 1;
				 let p = {time:nt};
				 dateObj.tourList.push(p);
			 }
			 flag=1;
			 $(".d_box input[value="+dateUseIdx+"]").click();
			 
		});
		$(".date_box>input[type=number]").change(function(){
			let pdiv = $(this).parent();
			//console.log("dayCount값 : "+pdiv.children().eq(0).val());
			
			let idx = pdiv.children().eq(0).val();
			let dateObj = plan.planList[idx];
			let changeVal = $(this).val();
			if($(this).val()==0)
				changeVal="00";
			switch($(this).attr("name")){
			case "startH":
				dateObj.startTimeH = changeVal;
				break;
			case "startM":
				dateObj.startTimeM = changeVal;
				break;
			case "endH":
				dateObj.endTimeH = changeVal;
				break;
			case "endM":
				dateObj.endTimeM = changeVal;
				break;
			}
			//console.log(plan);
			 let startTime = new Date(new Date().setHours(dateObj.startTimeH));
			 let endTime = new Date(new Date().setHours(dateObj.endTimeH));
			 endTime.setMinutes(dateObj.endTimeM);
			 startTime.setMinutes(dateObj.startTimeM);
			 let maxTime = (endTime-startTime)/(1000 * 60 * 60);
			 let dateTotal = $(".planTitle>input[type=number]");
			 let total=0;
			 $.each(dateTotal,function(i,v){
				 total += Number($(v).val());
				 
			 });
			 if(total==maxTime){
				 $(".addDiv").remove();
			 }else if(total>maxTime){
				 
			 }else{
				 $(".addDiv").remove();
				 let div = $("<div>").attr("align","center").attr("class","addDiv");
				 let addContent = $("<span>").attr("class","material-symbols-outlined").html("add");
				 let button = $("<button>").attr({"type" : "button","class":"addEL btn"});
				 button.append(addContent);
				 div.append(button);
				 $("#planBox").append(div);
				 
			 }
			
		});
		$("#planBox").on("change","input[type=number]",function(){
			//console.log($(this).parent().parent().children().eq(1).children().eq(1).val());
			idx = $(this).parent().parent().children().eq(1).children().eq(1).val();
			let time = $(this).val();
			plan.planList[dateUseIdx].tourList[idx].time = time;
			//console.log(plan);
			
			
		});
		
	});
</script>
 <!-- IONICONS -->
 <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>

</body>
</html>