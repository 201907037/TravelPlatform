<!-- 유진 - 관리자 여행지 추가 페이지 (2024.06.10) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="adminCommon.jsp"></jsp:include>
	<!-- 패딩 영역 -->
	<div style="width: 100%; padding:50px;">
	<!-- 내부 영역 -->
	<div class="card mb-4" style="width: 100%;">
        <div class="card-header">
            <!-- <i class="fas fa-pen"></i> -->
            <i class="fas fa-edit"></i>
           	여행지 추가
        </div>
        
        <div class="card-body">
        	<div class="form-group">
				<label for="sel1">여행지 분류 :</label>
			  	<select class="form-control" id="sel1">
			  		<option>-- 선택 --</option>
			    	<option value="tourSpot">관광지</option>
			    	<option value="lodging">숙박시설</option>
			    	<option value="restaurant">식당/카페</option>
			    	<option value="leports">레포츠</option>
			  	</select>
			</div>
			
			<br>
			
			<form action="" method="post">
	        	<div id="tourEnrollForm">
	        	</div>
	        </form>
        </div>
        
        <script>
	        $(function () {
	            $("#sel1").change(function () {
	            	
	            	// 선택한 옵션 태그의 value 값 가져오기
	                let selectedOption = $(this).val();
	                
	                // 기존에 있던 폼 비우기
	                $("#tourEnrollForm").empty();
	                
	                // 선택된 옵션에 따라 다른 폼이 뜸
	                switch(selectedOption) {
                    case "tourSpot":
                        $("#tourEnrollForm").html("<label>여행지명 :</label>" + 
												  "<input type='text' class='form-control' name='tourName'>" + "<br>" + 
												  "<label>주소 :</label>" + 
												  "<input type='text' class='form-control' name='address'>" + "<br>" + 
												  "<label>이용 시간 :</label>" + 
												  "<input type='text' class='form-control' name='useTime'>" + "<br>" + 
												  "<label>전화번호 :</label>" + 
												  "<input type='text' class='form-control' name='tel'>" + "<br>" + 
												  "<label>운영시기 :</label>" + 
												  "<input type='text' class='form-control' name='season'>" + "<br>" + 
												  "<label>애견 동반 가능 여부 :</label>" + "<br>" + 
												  "<input type='radio' id='petY' name='pet' value='Y' checked><label for='petY'>예</label>" + " " + 
												  "<input type='radio' id='petN' name='pet' value='N'><label for='petN'>아니오</label>" + "<br>");
                        break;
                    case "lodging":
                        $("#tourEnrollForm").html("<label>숙박시설 추가</label><input type='text' class='form-control' name='lodgingInput'>");
                        break;
                    case "restaurant":
                        $("#tourEnrollForm").html("<label>식당/카페 추가</label><input type='text' class='form-control' name='restaurantInput'>");
                        break;
                    case "leports":
                        $("#tourEnrollForm").html("<label>레포츠 추가</label><input type='text' class='form-control' name='leportsInput'>");
                        break;
                    default:
                        break;
	                }
	            });
        	});
        </script>
        
        <footer class="py-4 bg-light mt-auto">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">Copyright &copy; Your Website 2023</div>
                </div>
            </div>
        </footer>
        </div>
    </div>
</body>
</html>