<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootStrap4 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style>
@font-face {
	font-family: 'WavvePADO-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/2404@1.0/WavvePADO-Regular.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

div {
	box-sizing: border-box;
	/* border : 1px solid darkblue; */
}

html, body {
	margin: 0;
	padding: 0;
}

a {
	text-decoration: none;
	color: inherit;
}

.outer {
	width: 1200px;
	margin: auto;
	margin-top: 50px;
	font-family: 'WavvePADO-Regular';
}

.outer table {
	width: 90%;
	font-size: 15px;
	text-align: center;
}

.outer table td {
	padding: 10px;
	/* white-space: nowrap; */
}

.border-table tr {
	border-left: none;
	border-right: none;
}

.title-fbt {
	color: #23443e;
	margin: auto;
	text-align: center;
	padding-top: 20px;
	padding-bottom: 5px;
	font-size: 40px;
}

.info-table {
	font-size: 25px;
	height: 29px;
	margin: auto;
}

.info-table td, .info-table tr {
	border-top: 1px solid #23443e;
	border-bottom: 1px solid #23443e;
}

.info-table td:nth-child(odd) {
	background-color: #23443e;
	color: white;
}

.info-table td:nth-child(even) {
	background-color: lightgray;
}
/* 내용 */
.contents {
	text-align: center;
	margin-top: 15px;
	color: #23443e;
}

.outer p#content {
	width: 100%;
	height: 230px;
	resize: none;
	font-size: 30px;
	box-sizing: border-box;
	border: none;
	text-align: left;
	padding: 10px;
}
                .fbtns>a {
                    background-color: #23443e;
                    color: white;
                    text-decoration: none;
                    border-radius: 3px;
                    padding: 10px;
                    margin-left: 20px;
                }

                .fbtns>a:hover {
                    color: crimson;
                }

                .fbtns>button {
                    background-color: #23443e;
                    color: white;
                    text-decoration: none;
                    border-radius: 3px;
                    padding: 10px;
                    border: none;
                }

                .fbtns>button:hover {
                    color: crimson;
                }
</style>
</head>
<body>

	<div>

		<jsp:include page="../common/header1.jsp" />
		<br>
		<br>
		<br>
		<div class="outer" align="center">
			<table class="boardTitle border-table">
				<tr>
					<td>
						<div align="center" class="title-fbt">${ requestScope.n.noticeTitle }
						</div>
					</td>
				</tr>
			</table>

			<table class="info-table">
				<tr>
					<td width="10%">작성자</td>
					<td>관리자</td>


					<td width="10%">작성일</td>
					<td width="30%">${ requestScope.n.createDate }</td>


					<td width="10%">조회수</td>
					<td>0</td>
				</tr>
			</table>

			<table class="contents border-table">
				<tr style="border: none;">
					<td>
												<c:if test="${ not empty requestScope.n.changeName }">
							<div align="center">
							<img src="${requestScope.n.changeName }" width="300x" height="300px">
							</div>
							</c:if>
						<p id="content" name="content">
							${ requestScope.n.noticeContent }
						</p>
					</td>
				</tr>
				<br>
			</table>

		</div>
			<div align="center" class="fbtns" id="btns-fb-btn">

				<a href="javascript:history.back()" class="btn"> 뒤로가기 </a>
			</div>

	</div>

</body>
</html>