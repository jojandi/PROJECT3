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
<link href="../assets/css/mes/00.user_side_base.css" rel="stylesheet">
<link href="../assets/css/mes/admin.css" rel="stylesheet">
<link href="../assets/css/mes/graph.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"
	rel="stylesheet">
<link href="../assets/css/mes/admin_table.css" rel="stylesheet">
<!-- <script src="./assets/js/mes/click.js"></script> -->
<!-- <link href="./assets/css/mes/click.css" rel="stylesheet"> -->
<!-- Chart.js CDN 포함 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<!-- JavaScript 파일 -->
<script src="<%=request.getContextPath()%>/assets/js/mes/mes_graph2.js"></script>


<style>
#i2 .material-symbols-outlined {
	background-color: rgb(165, 224, 144);
}

#section1 {
	width: 90vw;
	height: 50vh;
	text-align: center;
	margin: auto;
}

#productionChart {
	width: 90vw;
	height: 80vh;
	text-align: center;
	margin: auto;
}

#menu #items #i6 {
	font-weight: 901;
	text-decoration: underline;
}
</style>
</head>
<body>

	<section>
		<div class="mini_title">
			<h3>수요 통계 그래프</h3>
		</div>
		<div id="all">
			<div id="graph">
			<!-- 연도 선택 드롭다운 -->
			<label for="yearSelectDemand">연도 선택: </label> <select
				id="yearSelectDemand">
				<option value="2024">2024년</option>
				<option value="2023">2023년</option>
				<option value="2022">2022년</option>
			</select>

			<!-- 월 선택 드롭다운 -->
			<label for="monthSelectDemand">월 선택: </label> 
			<select id="monthSelectDemand">
				<option value="1">1월</option>
				<option value="2">2월</option>
				<option value="3">3월</option>
				<option value="4">4월</option>
				<option value="5">5월</option>
				<option value="6">6월</option>
				<option value="7">7월</option>
				<option value="8">8월</option>
				<option value="9">9월</option>
				<option value="10">10월</option>
				<option value="11">11월</option>
				<option value="12">12월</option>
			</select>

			<!-- 컨테이너 안에 차트와 테이블을 나란히 배치 -->
			<div class="container">
				<!-- 그래프를 표시할 캔버스 -->
				<div id="chartSection">
					<canvas id="demandStatisticsChart" width="400" height="350"></canvas>
				</div>
			</div>
			</div>

			<!-- 테이블 섹션 -->
			<div id="tableSection">
				<table id="demandStatisticsTable">
					<thead>
						<tr>
							<th>장르</th>
							<th>수요량</th>
						</tr>
					</thead>
					<tbody>
						<!-- 데이터가 여기 추가됩니다 -->
					</tbody>
				</table>
			</div>
		</div>
	</section>
</body>
</html>