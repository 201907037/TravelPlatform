<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/style.css" />
<script src="https://kit.fontawesome.com/13a6fd1fbd.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
    <script src="https://unpkg.com/scrollreveal"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
    />
    <link
        rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    
    <!-- JavaScript -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/alertify.min.js"></script>
	
	<!-- CSS -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/alertify.min.css"/>
	<!-- Default theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/default.min.css"/>
	<!-- Semantic UI theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/semantic.min.css"/>


    <style>
        .start-button:hover{
        background-color: black;
        color: white;

    }

    #mid3_button:hover{
        color: grey;
    }

    #startButton{

        
    }


    </style>

    
</head>
<body>


	<c:if test="${ not empty sessionScope.alertMsg }">
		<script>
			alertify.alert('알림', '${ sessionScope.alertMsg }', function(){ alertify.success('Ok'); });
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>





	
	
	<div class="wrap">
        <!--  스크롤 첫번째로 한거
        <div class="scroll">
            <ul>
                <li><a href="#dd" id="scroll_move">div1로 이동</a></li>
                <li><a href="#mid" id="scroll_move">div2로 이동</a></li>
                <li><a href="#mid2" id="scroll_move">div3로 이동</a></li>
                <li><a href="#mid3" id="scroll_move">div4로 이동</a></li>
            </ul>
        </div>  
        -->
        <jsp:include page="common/header1.jsp" />


        <nav id="main-navigation">
            <ul class="scroll">
                <li><a class="menuitem" href="#dd">1</a></li>
                <li><a class="menuitem" href="#mid">2</a></li>
                <li><a class="menuitem" href="#mid2">3</a></li>
                <li><a class="menuitem" href="#mid3">4</a></li>
                <li><a class="menuitem" href="#footer">5</a></li>
            </ul>
        </nav>
        

        <div class="main_bg">
            <div id="dd" class="d_d">
                <div id="bgimg" class="bg">
                    <jsp:include page="common/header1.jsp" />
                    <video id="bgimg" class="bg_img" src="resources/image/video2.mp4" autoplay muted loop></video>

                
                </div>

                <div id="bgimg2" class="bg_img2">
                   <jsp:include page="common/header1.jsp" />
                    <div id="kkk" class="kkk">
                        <a class="kkk1">
                            <img id="city1" class="animated fadeInDown" src="resources/image/dd1.jpg">
                            <div id="inner">
                                <span class="text">
                                    # 감악산
                                    <hr>
                                    보랏빛 향기가 가득 일렁이는 곳
                                </span>
                            </div>
                        </a>
                        <a>
                            <img id="city2" class="animated fadeInDown" src="resources/image/dd2.jpg">
                            <div id="inner2">
                                <span class="text">
                                    # 구엄리돌염전
                                    <hr>
                                    제주 바다를 배경으로 한 컷
                                </span>
                            </div>
                        </a>
                    
                        <a>
                            <img id="city3" class="animated fadeInDown" src="resources/image/dd3.jpg">
                            <div id="inner3">
                                <span class="text">
                                    # 당진팽나무
                                    <hr>
                                    황금빛 벼 사이 우뚝 선 나
                                </span>
                            </div>
                        </a>
                    
                        <a>
                            <img id="city4" class="animated fadeInDown" src="resources/image/dd4.jpg">
                            <div id="inner4">
                                <span class="text">
                                    # 백양사
                                    <hr>
                                    타오르는 듯한 단풍이 멋진 곳 
                                </span>
                            </div>
                        </a>
                    
                        <a>
                            <img id="city5" class="animated fadeInDown" src="resources/image/dd5.jpg">
                            <div id="inner5">
                                <span id="last" class="text">
                                    # 도담정원
                                    <hr>
                                    동글동글 분홍 댑싸리 정원
                                </span>
                            </div>
                        </a>

                        
                    </div>

            
                </div>
                

                
                
                <div id="ment">
                    <h1 class= "animate__animated animate__fadeInLeft animate__delay-1s">
                        지친 당신을 위해 준비했어요
                    </h1>
                </div>

                
                    
                    <button class="start-button animate__animated animate__fadeIn animate__delay-2s" id="startButton">떠나고 싶다면.</button>
                    
                    <div class="search-section" id="searchSection">
                        <div class="search-bar">
                            <button class="start-button animate__animated animate__fadeIn" id="startButton2">플래너 작성</button>
                            
                            
                        </div>
                        
                    </div>
                

               

                
                <!--  
                <div id="container">
                
                    <button id="mm" class="learn-more animated fadeInRight">
                      <span class="circle" aria-hidden="true">
                        <span class="icon arrow"></span>
                      </span>
                      
                      <span class="button-text">떠나고 싶다면.</span>
                    </button>
                </div>
                -->
            </div>
            
            
            
           
            
        </div>

        
       
        
        <div id="mid" class="mid">
            
            <div class="mid_img">
                <img id="midphototop" src="resources/image/city.jpg">
            
            
                <img id="midphotobot" src="resources/image/ww1.jpg">
            
            
                <img id="midphototop" src="resources/image/tra.jpg">
            
            
                <img id="midphotobot" src="resources/image/se.jpg">
            
            
                <img id="midphototop" src="resources/image/ww2.jpg">
            </div>
            
        </div>

      
        
        

      
        
        <div id="mid2" class="mid2">

            <div class="swiper mySwiper"> 
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div id="mid2_img">
                            <div id="mid2_mini1"></div>
                        </div>
                    

                        <div id="ment2">
                            <h1 id="title2" >
                                대관령 양떼목장
                                
                                
                            </h1>
                            <br><br>
                            
                            <p id="mid2content" >
                            넓게 펼쳐진 풀밭이 아니라 눈을 돌릴 때마다 달라지는 언덕 풍경이 매력적인 이곳에서 휴식 같은 하루를 즐겨 보세요.
                            </p>
                        </div>
                    </div>
            
        

                    <div class="swiper-slide">
                        <div id="mid2_img">
                            <div id="mid2_mini2"></div>
                        </div>

                        <div id="ment2">
                            <h1 id="title2" >
                                인제 자작나무숲
                                
                            </h1>
                            <br><br>
                            
                            <p id="mid2content" >
                                이 숲에는 곳곳마다 포토존이 있어 멋진 사진을 찍기에도 좋아요.<br><br>
                                 겨울에 눈이라도 내리면 더 신비로워지는 이곳은 사계절 언제 찾아도 행복해지는 곳이에요.
                            </p>
                        </div>
                    </div>
        
            

                    <div class="swiper-slide">
                        <div id="mid2_img">
                            <div id="mid2_mini3"></div>
                        </div>

                        <div id="ment2">
                            <h1 id="title2" >
                                부산 더베이 101
                                
                            </h1>
                            <br><br>
                            
                            <p id="mid2content" >
                                해운대 앞바다에 반사된 빛으로 더욱 눈부신 해운대의 야경은 사진으로 다 담아낼 수 없을 정도로 환상적이에요.<br><br>
                                해운대의 낭만적인 밤을 만끽하고 싶은 사람이라면 꼭 방문해 보세요.
                            </p>
                        </div>
                    </div>
            

                    <div class="swiper-slide">
                        <div id="mid2_img">
                            <div id="mid2_mini4"></div>
                        </div>

                        <div id="ment2">
                            <h1 id="title2" >
                                이가리 닻 전망대
                                
                            </h1>
                            <br><br>
                            
                            <p id="mid2content" >
                                이가리 닻 전망대는 우리의 땅 독도 방향으로 뻗은 길이 102m, 높이 10m의 멋진 전망대예요. <br><br>
                                닻 전망대는 하늘에서 내려다본 모양이 닻을 닮아서 지은 이름인데 멀리서 바라보던 바다를 가까이서 느끼려면 꼭 걸어가 보세요.
                            </p>
                        </div>
                    </div>

               
                </div>
                    <div class="swiper-pagination"></div>
            </div>
        </div>







    

        <div id="mid3" class="mid3">

            <div id="mid3_img">
                <div id="mid3_mini"></div>
            </div>

            <div id="mid3_img2">
                <div id="mid3_mini2"></div>
            </div>

            <div id="mid3_img3">
                <div id="mid3_mini3"></div>
            </div>

            <div id="ment3">
                <h1 id="title2" >
                    다양한 여행지의 후기가 보고싶다면
                    
                </h1>
                <br><br>
                
                <button class="start-button" id="mid3_button">다양한 후기들 > </button>
            </div>
            </div>
            

            


        </div>

        
        

        
        



    </div>
    
    <button onclick="backToTop()" id="btn-back-to-top" title="위로 가기">Top</button>

    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

    

 
   
    
</body>

<script>
     ScrollReveal().reveal('.mid_img > img', {
        delay:600, 
        duration : 900,
        interval : 300
        });     

        ScrollReveal().reveal('.mid3 > div', {
        delay:600, 
        duration : 900,
        interval : 300
        });  

        ScrollReveal().reveal('.scroll a', {
        delay:600, 
        duration : 900,
        interval : 300
        });

        ScrollReveal().reveal('#mid3_button', {
        delay:600, 
        duration : 900
        
        });

       

        
        // ScrollReveal().reveal('#mid2_img', {
        // delay:300
        
        
        // });

        var swiper = new Swiper(".mySwiper", {
      direction: "vertical",
      autoplay : true,
      loop : true,
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
    });
  // 플래너 작성 페이지로 이동
  $(function(){
	  $("#startButton2").click(function(){
			location.href="goPlanner.pl";
	   });
  });
        

  // 버튼 누르면 검색창 나오고 배경바뀜
  $(document).ready(function() {
    $('#startButton').click(function(event) {
        event.stopPropagation();
        $(this).fadeOut(500, function() {
            $('#searchSection').css('display', 'block').animate({ opacity: 1 }, 500);
        });
        $("#bgimg").fadeOut(500, function() {
            $('#bgimg').css('display', 'none').animate({ opacity: 1 }, 500);
        });
        $("#ment").fadeOut(500, function() {
            $('#ment').css('display', 'none').animate({ opacity: 1 }, 500);
        });

        $("#bgimg2").fadeIn(1000, function() {
            $('#bgimg2').css('display', 'block').fadeIn(1000);
        });

        $("#main-navigation").fadeOut(500, function() {
            $('#main-navigation').css('display', 'none').animate({ opacity: 1 }, 500);
        });

        
       

        

       
    });

    $(document).click(function(event) {
        if (!$(event.target).closest('#searchSection').length && !$(event.target).is('#startButton')) {
            $('#searchSection').animate({ opacity: 0 }, 500, function() {
                $(this).css('display', 'none');
                $('#startButton').fadeIn(800);
                $('#bgimg').fadeIn(800);
                $('#ment').fadeIn(800);
                $('#bgimg2').css('display', 'none');
                $('#main-navigation').fadeIn(800);
                
            });

            
        }
    });

    $('#searchSection').click(function(event) {
        event.stopPropagation();
    });

    $('#header').click(function(event) {
        event.stopPropagation();
    });

    $('#kkk').click(function(event) {
        event.stopPropagation();
    });

    $('#btn-back-to-top').click(function(event) {
        event.stopPropagation();
    });

    $('#mid').click(function(event) {
        event.stopPropagation();
    });


});

/*
// 버튼 누르면 해당 div 로 이동하는 스크립트
$(document).ready(function($) {

$(".scroll_move").click(function(event){         

        event.preventDefault();

        $('html,body').animate({scrollTop:$(this.hash).offset().top}, 4000);

});

});
*/



$(document).ready(function () {

$('a[href^="#site-main"]').addClass('active');

//smoothscroll
$('.menuitem').on('click', function (e) {
    e.preventDefault();
    //  $(document).off("scroll");
    var athis = this;
    var target = this.hash,
            menu = target;
    $target = $(target);
    $('html, body').stop().animate({
        'scrollTop': $target.offset().top + 2
    }, 800, 'swing', function () {
        window.location.hash = target;
        $('.menuitem').removeClass('active');
        $(athis).addClass('active');

    });

});


$(window).scroll(function (event) {
    var scrollPos = $(document).scrollTop();
    if (scrollPos === 0)
    {
        $('a[href^="#site-main"]').addClass('active');
        return;
    }

    $('.menuitem').each(function () {
        var currLink = $(this);
        var refElement = $(currLink.attr("href"));
        if (refElement.position().top <= scrollPos && refElement.position().top + refElement.height() > scrollPos) {
            $('.menuitem').removeClass("active");
            currLink.addClass("active");
        } else {
            currLink.removeClass("active");
        }
    });

})

});




    
    
    
    
window.addEventListener('scroll', () => {
    // 스크롤 위치가 100px 이상일 때 위로 가기 버튼을 보이게 함
    if (
      document.body.scrollTop > 100 ||
      document.documentElement.scrollTop > 20
    ) {
      document.getElementById('btn-back-to-top').style.display = 'block';
    } else {
      document.getElementById('btn-back-to-top').style.display = 'none';
    }
  });
  
  // 클릭 시 페이지 맨 위로 스크롤 (애니메이션 효과 추가)
  function backToTop() {
    const position =
      document.documentElement.scrollTop || document.body.scrollTop;
    if (position) {
      window.requestAnimationFrame(() => {
        window.scrollTo(0, position - position / 10);
        backToTop();
      });
    }
  }    


</script>
	
	
	
	
	
	

	
	<jsp:include page="common/footer1.jsp" />
</body>
</html>