<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    
</head>
<body>

	
	
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

        <nav id="main-navigation">
            <ul class="scroll">
                <li><a class="menuitem" href="#dd">1</a></li>
                <li><a class="menuitem" href="#mid">2</a></li>
                <li><a class="menuitem" href="#mid2">3</a></li>
                <li><a class="menuitem" href="#mid3">4</a></li>
                <li><a class="menuitem" href="#d">5</a></li>
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
                            <img id="city1" class="animated fadeInDown" src="resources/image/to.jpg">
                            <div id="inner">
                                <span class="text">
                                    도쿄
                                    <hr>
                                    사람들이 어쩌구 저쩌구
                                </span>
                            </div>
                        </a>
                        <a>
                            <img id="city2" class="animated fadeInDown" src="resources/image/se.jpg">
                            <div id="inner2">
                                <span class="text">
                                    서울
                                    <hr>
                                    사람들이 어쩌구 저쩌구
                                </span>
                            </div>
                        </a>
                    
                        <a>
                            <img id="city3" class="animated fadeInDown" src="resources/image/ch.jpg">
                            <div id="inner3">
                                <span class="text">
                                    북경
                                    <hr>
                                    사람들이 어쩌구 저쩌구
                                </span>
                            </div>
                        </a>
                    
                        <a>
                            <img id="city4" class="animated fadeInDown" src="resources/image/fr.jpg">
                            <div id="inner4">
                                <span class="text">
                                    파리
                                    <hr>
                                    사람들이 어쩌구 저쩌구
                                </span>
                            </div>
                        </a>
                    
                        <a>
                            <img id="city5" class="animated fadeInDown" src="resources/image/am.jpg">
                            <div id="inner5">
                                <span class="text">
                                    뉴욕
                                    <hr>
                                    사람들이 어쩌구 저쩌구
                                </span>
                            </div>
                        </a>

                        
                    </div>

            
                </div>
                

                
                
                <div id="ment">
                    <h1 class= "animated fadein">
                        지친 당신을 위해 준비했어요
                    </h1>
                </div>

                
                    
                        <button class="start-button" id="startButton">떠나고 싶다면.</button>
                    
                    <div class="search-section" id="searchSection">
                        <div class="search-bar">
                            <input type="text" placeholder="어디로 여행을 떠나시나요?">
                            <img src="resources/image/seach.png" alt="search" class="search-icon">
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
                <img id="midphototop" src="resources/image/test1.gif">
            
            
                <img id="midphotobot" src="resources/image/test1.gif">
            
            
                <img id="midphototop" src="resources/image/test1.gif">
            
            
                <img id="midphotobot" src="resources/image/test1.gif">
            
            
                <img id="midphototop" src="resources/image/test1.gif">
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
                                도쿄
                                <hr>
                            </h1>
                            <br><br>
                            
                            <p id="mid2content" >
                                어쩌구저쩌구어쩌구저쩌구
                                어쩌구저쩌구어쩌구저쩌구
                                어쩌구저쩌구어쩌구저쩌구
                            </p>
                        </div>
                    </div>
            
        

                    <div class="swiper-slide">
                        <div id="mid2_img">
                            <div id="mid2_mini2"></div>
                        </div>

                        <div id="ment2">
                            <h1 id="title2" >
                                파리
                                <hr>
                            </h1>
                            <br><br>
                            
                            <p id="mid2content" >
                                어쩌구저쩌구어쩌구저쩌구
                                어쩌구저쩌구어쩌구저쩌구
                                어쩌구저쩌구어쩌구저쩌구
                            </p>
                        </div>
                    </div>
        
            

                    <div class="swiper-slide">
                        <div id="mid2_img">
                            <div id="mid2_mini3"></div>
                        </div>

                        <div id="ment2">
                            <h1 id="title2" >
                                베이징
                                <hr>
                            </h1>
                            <br><br>
                            
                            <p id="mid2content" >
                                어쩌구저쩌구어쩌구저쩌구
                                어쩌구저쩌구어쩌구저쩌구
                                어쩌구저쩌구어쩌구저쩌구
                            </p>
                        </div>
                    </div>
            

                    <div class="swiper-slide">
                        <div id="mid2_img">
                            <div id="mid2_mini4"></div>
                        </div>

                        <div id="ment2">
                            <h1 id="title2" >
                                서울
                                <hr>
                            </h1>
                            <br><br>
                            
                            <p id="mid2content" >
                                어쩌구저쩌구어쩌구저쩌구
                                어쩌구저쩌구어쩌구저쩌구
                                어쩌구저쩌구어쩌구저쩌구
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
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
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