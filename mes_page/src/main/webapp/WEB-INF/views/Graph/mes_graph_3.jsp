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
<link href="./assets/css/mes_mainPage.css" rel="stylesheet">
 <link href="./assets/css/00.user_side_base.css" rel="stylesheet">
<link href="./assets/css/admin.css" rel="stylesheet">
<link href="./assets/css/admin_table.css" rel="stylesheet">
<link href="./assets/css/modal.css" rel="stylesheet">
<script src="./assets/js/modal.js"></script>
<script src="./assets/js/click.js"></script>
<link href="./assets/css/click.css" rel="stylesheet">
<!-- Chart.js CDN 포함 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<!-- JavaScript 파일 -->
<script src="<%=request.getContextPath()%>/assets/js/mes_graph3.js"></script>


<style>
#menu #items #i6 {
	font-weight: 901;
	text-decoration: underline;
}

</style>
</head>
<body>

	<section class="section3">
			 <div class="content-container">
			 <h3>수요 예측 통계 그래프</h3>
        <!-- 연도 및 월 선택 드롭다운 -->
        <label for="yearSelectForecast">연도 선택: </label>
        <select id="yearSelectForecast">
            <option value="2024">2024년</option>
        </select>

        <label for="monthSelectForecast">월 선택: </label>
        <select id="monthSelectForecast">
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

        <!-- 차트와 테이블을 함께 표시할 컨테이너 -->
        <div class="chart-table-container">
            <!-- 차트를 표시할 캔버스 -->
            <canvas id="forecastStatisticsChart" width="400" height="200"></canvas>

            <!-- 수요 예측 통계 테이블 -->
            	<h3>수요 예측 통계 테이블</h3>
            <table id="forecastStatisticsTable">
                <thead>
                    <tr>
                        <th>장르</th>
                        <th>예측 수요량</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- 데이터가 여기 추가됩니다 -->
                </tbody>
            </table>
        </div>
    </div>
			
		</section>

	

 
<div>
</div>
</body>
</html>