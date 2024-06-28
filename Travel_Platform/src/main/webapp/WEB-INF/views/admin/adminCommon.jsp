<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Static Navigation - SB Admin</title>
        <link href="resources/css/adminStyle.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	    
	    <!-- JavaScript -->
		<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/alertify.min.js"></script>
		
		<!-- CSS -->
		<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/alertify.min.css"/>
		<!-- Default theme -->
		<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/default.min.css"/>
		<!-- Semantic UI theme -->
		<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/semantic.min.css"/>
    </head>
    <body>
			<c:if test="${ not empty sessionScope.alertMsg }">
				<script>
					alertify.alert('알림', '${ sessionScope.alertMsg }', function(){ alertify.success('Ok'); });
				</script>
				<c:remove var="alertMsg" scope="session" />
			</c:if>
    
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="dashBoard.ad"><i class="fa-solid fa-user-tie"></i>
                &nbsp;AdminPage
            </a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="/travely">MainPage</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="logout.me">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">main</div>
                            <a class="nav-link" href="dashBoard.ad">
                                <div class="sb-nav-link-icon"></div><i class="fas fa-tachometer-alt"></i>&nbsp;
                                &nbsp;대시보드 통계
                            </a>
                            <div class="sb-sidenav-menu-heading">Member</div>
                            <a class="nav-link" href="adminMember.ad">&nbsp;<i class="fa-solid fa-users"></i> &nbsp;
                                &nbsp;회원 관리
                            </a>
                            <div class="sb-sidenav-menu-heading">Interface</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"></div><i class="fas fa-columns"></i>&nbsp;
                                &nbsp;커뮤니티 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                	<!-- Notice 경로 추가 (나현성) -->
                                    <a class="nav-link" href="noticeList.ad"><i class="fa-solid fa-angle-right"></i>&nbsp;&nbsp;공지사항 관리</a>
                                    <a class="nav-link" href="adminBoardListView.ad"><i class="fa-solid fa-angle-right"></i>&nbsp;&nbsp;여행후기게시판 관리</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"></div><i class="fa-solid fa-pen-to-square"></i>&nbsp;
                                &nbsp;플래너 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <!-- 유진 - 여행지 관리 부분 포워딩 처리 (2024.06.10) -->
                                    <a class="nav-link collapsed" href="adminTour.ad"><i class="fa-solid fa-angle-right"></i>&nbsp;&nbsp;
                                        여행지 관리
                                    </a>
                                </nav>
                            </div>
                            <!-- 기존 그래프 있던 영역 필요시 추가 -->
                        </div>
                    </div>
                    <!-- 푸터 -->
                    <div class="sb-sidenav-footer">
                        <div class="small">Travel</div>
                        여행을 떠나요
                    </div>
                </nav>
            </div>

            
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
            <script src="resources/js/scripts.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
            <script src="resources/assets/demo/chart-area-demo.js"></script>
            <script src="resources/assets/demo/chart-bar-demo.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
            <script src="resources/js/datatables-simple-demo.js"></script>
        </body>
    </html>
    