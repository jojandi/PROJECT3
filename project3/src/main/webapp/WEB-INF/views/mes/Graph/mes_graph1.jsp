<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>사용자용 메인페이지</title>
<link href="../assets/css/mes/mes_mainPage.css" rel="stylesheet">
 <link href="../assets/css/mes/00.user_side_base.css" rel="stylesheet">
<link href="../assets/css/mes/admin.css" rel="stylesheet">
<link href="../assets/css/mes/admin_table.css" rel="stylesheet">
<link href="../assets/css/mes/modal.css" rel="stylesheet">
<script src="../assets/js/mes/modal.js"></script>
<!-- <script src="../assets/js/mes/click.js"></script> -->
<!-- <link href="../assets/css/mes/click.css" rel="stylesheet"> -->
<!-- Chart.js CDN 포함 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<!-- JavaScript 파일 -->
<script src="<%=request.getContextPath()%>/assets/js/mes_graph.js"></script>


<style>
	#i1 .material-symbols-outlined {
		background-color: rgb(165, 224, 144);
	}

	#menu #items #i6 {
	font-weight: 901;
	text-decoration: underline;
}
</style>
</head>
<body>

	<section class="section1">
		<div class="all">
			<div class="mini_title">
				<h3>도서 출고 통계 그래프</h3>
			</div>
			
			<!-- 연도 선택 드롭다운 -->
			<label for="yearSelect">연도 선택: </label> 
			<select id="yearSelect">
				<option value="2023">2023년</option>
				<option value="2022">2022년</option>
				<option value="2021">2021년</option>
				<option value="2020">2020년</option>
				<option value="2019">2019년</option>
			</select>
	
			<!-- 월 선택 드롭다운 -->
			<label for="monthSelect">월 선택: </label> 
			<select id="monthSelect">
				<option value="1">1월</option>
				<option value="2">2월</option>
				<option value="3">3월</option>
				<option value="4">4월</option>
				<option value="5">5월</option>
			</select>
			
			<!-- 컨테이너 안에 차트와 테이블을 나란히 배치 -->
			<div class="container">
				<!-- 그래프를 표시할 캔버스 -->
				<div id="chartSection">
					<canvas id="bookStatisticsChart" width="400" height="200"></canvas>
				</div>

				<!-- 테이블 섹션 -->
				<div id="tableSection">
					<h3>도서 출고 통계 테이블</h3>
					<table id="bookStatisticsTable">
						<thead>
							<tr>
								<th>장르</th>
								<th>출고량</th>
							</tr>
						</thead>
						<tbody>
							<!-- 데이터가 여기 추가됩니다 -->
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>



<div>
</div>
</body>
</html>