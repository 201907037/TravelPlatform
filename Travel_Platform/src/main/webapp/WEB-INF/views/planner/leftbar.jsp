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
        width : 250px;
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
    #sub-search input {
        width: 100%;
        border: 1px solid #bbb;
        padding: 10px 12px;
        font-size: 14px;
        border-radius: 15px;
        border : 0px;

    }   
    #sub-search input:focus{
        outline: none;
    } 
    #sub-search img {
        width: 20px;
        float : left;
        width: 20px;
        margin: 0;
    }
    #search_btn {
        cursor: pointer;
        height: 100%;
        background-color: white;
        border: 0px;
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
    #changeDate{
    	height : 40px;
    	background-color : var(--first-color);
    	position : absolute;
    	left : 20px;
    	bottom : 10px;
    	color : white;
    	text-aling : center;
    }
    #save-plan:hover,#changeDate:hover{
    	background-color : #0036B5;
    }
    #save-plan>span,#changeDate>span{
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
		width : 280px;
		height : 100px;
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
	                 <a id="stay" class="tourList nav__link active">
	                    <span class="material-symbols-outlined">
						apartment
						</span>
	                    <span class="nav_name">숙소</span>
	                </a>
	                 <a id="food" class="tourList nav__link active">
	                    <span class="material-symbols-outlined">
						ramen_dining
						</span>
	                    <span class="nav_name">식당</span>
	                </a>
	            </div>
	            <div class="d_box">
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
			<button id="btn-cl">&lt;&lt;</button>
		</div>
		<h3 align="center">여행지</h3>
		<div align="center" class="search-div">
	        <form id="sub-search" action="" method="get">
	            <div class="search">
	                <table>
	                    <tr>
	                        <td class="td1"><input type="text" name="keyword" placeholder="검색어 입력"></td>
	                        <td><button  id="search_btn" ><img src="resources/button-source/search.png"
	                            alt="검색"></button></td>
	                    </tr>
	                </table>
	                <input type="hidden" name="pno" value="1">
	                <input type="hidden" name="flg" value="10">
	            </div>
	        </form>
	    </div>
	    <div class="adv_search">
	    
	    </div>
	   	<div class="el_box">
	    </div>
        <div id="button_box" align="center">
        </div>
	</div>
	<div class="leftleft-bar" style="display : none; width : 0px;">
		<div style="float : right;">
			<button id="btn-dateCl">&lt;&lt;</button>
		</div>
		<h4 align="center">일정관리</h4>
	   	<div class="date_box" align="center">
	   	<input type="hidden" name="dayCount">
	    	시작시간  
	    	<input type="number" min="01" max="24" step="1" value="10" name="startH"> : <input type="number" min="00" max="60" step="30" value="00" name="startM" class="endD">
	    	<button class="btn" id="btn_startT" style="color : white;">저장</button><br>
	    	종료시간 
	    	<input type="number" min="01" max="24" step="1" value="10" name="endH"> : <input type="number" min="00" max="60" step="30" value="00" name="endM" class="endD">
	    	<button class="btn" id="btn_endT" style="color : white;">저장</button>
	    	<div id="planBox"></div>
	   	</div>
	</div>
	
<script>
let type;
let no = {tPno : 1, aPno : 1, rPno : 1};
	$(function(){
		$(".nav__list>a[class^=tourList]").click(function(){
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
			case "숙소":
				pno = no.aPno;
				break;
			case "식당":
				pno = rPno;
				break;
			}
			
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
						let img = $("<img>").attr("src",v.thumbImg);
						let tname = $("<div>").attr("class","t_name").html(v.tourName);
						timg.append(img);
						tbox.append(timg,tname);
						$(".el_box").append(tbox);
					});
					
					switch(type){
					case "관광지":
						no.tPno = e.page.currentPage;
						break;
					case "숙소":
						no.aPno = e.page.currentPage;
						break;
					case "식당":
						no.rPno = e.page.currentPage;
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
			
			$(".leftleft-bar").css("display","none").css("width","0px");
			$(".left-bar").css("display","inline");
			
			$(".left-bar").animate({width : '300px'},500);
			$(".left-bar>h3").html($(this).children().eq(1).html());
		});
		$("#button_box").on("click","button[class^=btn_no]",function(){
			$(".el_box").html("");
			$("#button_box").html("");
			
			let pno = $(this).html();
			//console.log(sigunguCodeNo);
			
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
						let img = $("<img>").attr("src",v.thumbImg);
						let tname = $("<div>").attr("class","t_name").html(v.tourName);
						timg.append(img);
						tbox.append(timg,tname);
						$(".el_box").append(tbox);
					});
					
					switch(type){
					case "관광지":
						no.tPno = e.page.currentPage;
						break;
					case "숙소":
						no.aPno = e.page.currentPage;
						break;
					case "식당":
						no.rPno = e.page.currentPage;
						break;
					}
					
					if(pinfo.startPage!=1){
	                    var btnLeft = $("<button>").attr("type","button").attr("id","btn-left").attr("class","left btn btn-success btn-sm").html("&lt;&lt;");
	                    //console.log(btnleft);
	                    $("#button_box").append(btnLeft);
	                }
	                for(let i = pinfo.startPage;i<=pinfo.endPage;i++){
	                    if(i==pinfo.currentPage){
	                    	var btnNum = $("<button>").attr("type","button").attr("disabled","ture").attr("class","btn btn-success btn-sm").text(i);
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
			case "숙소":
				pno = no.aPno;
				break;
			case "식당":
				pno = rPno;
				break;
			}
			pno--;
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
						let img = $("<img>").attr("src",v.thumbImg);
						let tname = $("<div>").attr("class","t_name").html(v.tourName);
						timg.append(img);
						tbox.append(timg,tname);
						$(".el_box").append(tbox);
					});
					
					switch(type){
					case "관광지":
						no.tPno = e.page.currentPage;
						break;
					case "숙소":
						no.aPno = e.page.currentPage;
						break;
					case "식당":
						no.rPno = e.page.currentPage;
						break;
					}
					
					if(pinfo.startPage!=1){
	                    var btnLeft = $("<button>").attr("type","button").attr("id","btn-left").attr("class","left btn btn-success btn-sm").html("&lt;&lt;");
	                    //console.log(btnleft);
	                    $("#button_box").append(btnLeft);
	                }
	                for(let i = pinfo.startPage;i<=pinfo.endPage;i++){
	                    if(i==pinfo.currentPage){
	                    	var btnNum = $("<button>").attr("type","button").attr("disabled","ture").attr("class","btn btn-success btn-sm").text(i);
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
			case "숙소":
				pno = no.aPno;
				break;
			case "식당":
				pno = rPno;
				break;
			}
			pno++;
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
						let img = $("<img>").attr("src",v.thumbImg);
						let tname = $("<div>").attr("class","t_name").html(v.tourName);
						timg.append(img);
						tbox.append(timg,tname);
						$(".el_box").append(tbox);
					});
					
					switch(type){
					case "관광지":
						no.tPno = e.page.currentPage;
						break;
					case "숙소":
						no.aPno = e.page.currentPage;
						break;
					case "식당":
						no.rPno = e.page.currentPage;
						break;
					}
					
					if(pinfo.startPage!=1){
	                    var btnLeft = $("<button>").attr("type","button").attr("id","btn-left").attr("class","left btn btn-success btn-sm").html("&lt;&lt;");
	                    //console.log(btnleft);
	                    $("#button_box").append(btnLeft);
	                }
	                for(let i = pinfo.startPage;i<=pinfo.endPage;i++){
	                    if(i==pinfo.currentPage){
	                    	var btnNum = $("<button>").attr("type","button").attr("onclick","noclick(this);").attr("disabled","ture").attr("class","btn btn-success btn-sm").text(i);
	                    }else{
	                    	var btnNum = $("<button>").attr("type","button").attr("onclick","noclick(this);").attr("class","btn_no btn btn-success btn-sm").text(i);
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
		});
		$(".nav__list>a[class^=dateList]").click(function(){
			$(".left-bar").css("display","none").css("width","0px");
			$(".leftleft-bar").css("display","inline");
			
			$(".leftleft-bar").animate({width : '300px'},500);
			$(".leftleft-bar>h3").html($(this).children().eq(1).html());
			
		});
		$(".d_box").on("click","div[class=date]",function(){
			$(".left-bar").css("display","none").css("width","0px");
			$(".leftleft-bar").css("display","inline");
			
			$(".leftleft-bar").animate({width : '300px'},500);
			$(".leftleft-bar>h4").html($(this).text());
			//console.log(planner[$(this).children().eq(0).val()]);
			let dateObj = plan.planList[$(this).children().eq(0).val()];
			
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
			//console.log((endTime-startTime)/(1000 * 60 * 60));
			//console.log(plan);
			$("#planBox").html("");
			for(let i=0;i<=maxTime/2;i++){
				dateObj['p'+i] = {};
				dateObj['p'+i]["time"] = 2;
				if(i==1||i==4){
					dateObj['p'+i]["time"] = 1;
				}
				dateObj['p'+0]["name"] = "서울숲";
				dateObj['p'+0]["img"] = "https://i.ytimg.com/an_webp/XSFT8BfLnAo/mqdefault_6s.webp?du=3000&sqp=CLDWubMG&rs=AOn4CLAYoDt-oqjwzMeRN4mDkqLmxWobPQ";				
				let planObj=$("<div>").attr("class","planObj");
				let title=$("<div>").attr("class","planTitle").css("height","28%").html("일정"+(i+1)+" : ");
				let time = $("<input>").attr({"type":"number","name":"time","value":dateObj['p'+i]["time"],"class":"time"}).css("height","90%");
				title.append(time);
				title.append("시간");
				let body=$("<div>").attr("class","planbody").css("height","72%");
				if(dateObj['p'+i].name==null){
					let button= $("<button>").attr("class","planAdd").html("추가");
					body.append(button);
				}else{
					let imgBox = $("<div>").css({"width" : "40%","height" : "100%","float":"left"});
					let img = $("<img>").attr("src",dateObj['p'+i]['img']).css({"width" : "100%","height" : "100%"});
					imgBox.append(img);
					let nameSpace = $("<div>").attr("align","center").css("float","right").css({"width":"60%","height" :"100%"}).html(dateObj['p'+i]["name"]);
					body.append(imgBox,nameSpace);
				}
				planObj.append(title,body);
				$("#planBox").append(planObj);
				
			}
			console.log(dateObj);
		});
		$("#btn-cl").click(function(){
			
			$(".left-bar").animate({width : '0px'},500);
			$(".leftleft-bar").animate({width : '0px'},500);
			//console.log($(".left-bar").css("width"));
			setTimeout(function(){
				$(".left-bar").css("display","none");
			},400);
			
		});
		$("#btn-dateCl").click(function(){
			$(".leftleft-bar").animate({width : '0px'},500);
			//console.log($(".left-bar").css("width"));
			setTimeout(function(){
				$(".leftleft-bar").css("display","none");
			},400);
			
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
		$(".date_box>input[type=number]").change(function(){
			let pdiv = $(this).parent();
			//console.log("dayCount값 : "+pdiv.children().eq(0).val());
			
			let idx = pdiv.children().eq(0).val()-1;
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
		});
	});
</script>
 <!-- IONICONS -->
 <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>

</body>
</html>