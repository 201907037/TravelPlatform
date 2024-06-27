<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        .chart-container {
            display: flex;
            justify-content: space-around;
            align-items: center;
            height: 1100px;
        }
        .chart {
            flex: 1;
            max-width: 600px;
            margin: 20px;
        }
    </style>
</head>
<body>
    <jsp:include page="../admin/adminCommon.jsp"></jsp:include>
    <div class="chart-container">
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">대시보드 통계</h1>
                        <br>
                        <div class="card mb-4" style="width:1500px;">
                            <div class="card-header">
                                                            		<i class="fas fa-chart-area me-1"></i>
                                        일별 게시글 등록 수

                            </div>
                            <div class="card-body"><canvas id="boardChart"  width="100%" height="30"></canvas></div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        여행지 종류
                                    </div>
                                    <div class="card-body"><canvas id="barChart" width="100%" height="50"></canvas></div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                <i class="fas fa-chart-pie me-1"></i>
                                사용자 성별
                                    </div>
                                    <div class="card-body"><canvas id="myChart" width="100%" height="50"></canvas></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
    </div>

    <script>

        window.onload = function() {
            let typeCount = ${requestScope.typeCount};
            let createList = ${requestScope.createList};
            let countList = ${requestScope.countList};
            const myChartCtx = document.getElementById('myChart').getContext('2d');
            new Chart(myChartCtx, {
                type: 'doughnut',
                data: {
                    labels: ['남자', '여자'],
                    datasets: [{
                        label: 'My First Dataset',
                        data: [${requestScope.M}, ${requestScope.F}],
                        backgroundColor: [
                            'rgba(0, 0, 255, 0.5)',   // Blue
                            'rgba(0, 128, 0, 0.5)'    // Green
                        ],
                        borderColor: [
                            'rgba(0, 0, 255, 1)',
                            'rgba(0, 128, 0, 1)'
                        ],
                        borderWidth: 2
                    }]
                }
            });

            const chartCtx = document.getElementById('barChart').getContext('2d');
            new Chart(chartCtx, {
                type: 'bar',
                data: {
                    labels: ['관광지', '레포츠', '숙박시설', '식당/카페'],
                    datasets: [{
                        label: '# of Votes',
                        data: [typeCount[0], typeCount[1], typeCount[2], typeCount[3]],
                        backgroundColor: [
                            'rgba(255, 165, 0, 0.5)',
                            'rgba(255, 255, 0, 0.5)',
                            'rgba(0, 128, 0, 0.5)',
                            'rgba(0, 0, 255, 0.5)',
                        ],
                        borderColor: [
                            'rgba(255, 165, 0, 1)',
                            'rgba(255, 255, 0, 1)',
                            'rgba(0, 128, 0, 1)',
                            'rgba(0, 0, 255, 1)',
                        ],
                        borderWidth: 2
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
            
            
            
            const boardCtx = document.getElementById('boardChart').getContext('2d');
            new Chart(boardCtx, {
                type: 'line',
                data: {
                    labels: createList,
                    datasets: [{
                        label: '게시글 등록 수',
                        data: countList,
                        backgroundColor: 'rgba(0, 0, 255, 0.3)',
                        borderColor: 'rgba(0, 0, 255, 1)',
                        borderWidth: 2,
                        fill: true 
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        }
    </script>
</body>
</html>
