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
	    background-color: var(--first-color);
	}
	
	.nav__icon {
	    font-size: 1.25rem;
	}
	
	.nav_name {
	    font-size: var(--small-font-size);
	}
	
	.left-bar{
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
        width: 50%;
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
	                <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
	                <a id="plan" class="nav__logo">플래너</a>
	            </div>
	            <div class="nav__list">
	                <a id="station" class="nav__link active">
	                    <span class="material-symbols-outlined">
						map
						</span>
	                    <span class="nav_name">관광지</span>
	                </a>
	                 <a id="stay" class="nav__link active">
	                    <span class="material-symbols-outlined">
						apartment
						</span>
	                    <span class="nav_name">숙소</span>
	                </a>
	                 <a id="food" class="nav__link active">
	                    <span class="material-symbols-outlined">
						ramen_dining
						</span>
	                    <span class="nav_name">식당</span>
	                </a>
	            </div>
	            
	        </div>
	    </nav>
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
	   	<div class="t_box">
	    	<div class="t_img">
	    		<img src=""/>
	    	</div>
	    	<div class="t_name">
	    	여행지명
	    	</div>
	   	</div>
	</div>
	
<script>
	$(function(){
		$(".nav__list>a").click(function(){
			//console.log($(this));
			$(".left-bar").css("display","inline");
			$(".left-bar").animate({width : '300px'},500);
			$(".left-bar>h3").html($(this).children().eq(1).html());
		});
		$("#btn-cl").click(function(){
			
			$(".left-bar").animate({width : '0px'},500);
			//console.log($(".left-bar").css("width"));
			setTimeout(function(){
				$(".left-bar").css("display","none");
			},400);
			
		});
	});
</script>
 <!-- IONICONS -->
 <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
 <!-- JS -->

</body>
</html>