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
<link href="./assets/css/admin.css" rel="stylesheet">
<link href="./assets/css/admin_table.css" rel="stylesheet">
<link href="./assets/css/modal.css" rel="stylesheet">
<script src="./assets/js/modal.js"></script>
<script src="./assets/js/click.js"></script>
<link href="./assets/css/click.css" rel="stylesheet">
<!-- Chart.js CDN 포함 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<!-- JavaScript 파일 -->
<script src="<%=request.getContextPath()%>/assets/js/mes_mainPage.js"></script>


<style>
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



</style>
</head>
<body>

	<!-- 가장 위 고정 -->
	<!-- 헤더  -->
	<%@ include file="/WEB-INF/views/mes_base/header.jsp"%>
	<!-- 헤더  -->

	<!-- 메인페이지 -->

	<!-- google fonts 가져오기 -->
	<link rel="stylesheet"
		href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

	<div id="wrap">

		<section class="section1">

			<div id="hukwan">


				<div id="calendar">
					<div class="calHeader">
						<h2 id="YearMonth">
							<!-- YYYY년 M월 -->
						</h2>
					</div>

					<div id="days">
						<div>일</div>
						<div>월</div>
						<div>화</div>
						<div>수</div>
						<div>목</div>
						<div>금</div>
						<div>토</div>
					</div>

					<div id="dates">
						<!-- 날짜들 들어오는 곳 -->
					</div>
				</div>
				<script src="./assets/js/01.calendar.js"></script>

			</div>
			<div id="hukwan_bot">
				<div class="circle_1"></div>
				출고일
				<div class="circle_2"></div>
				<small>도서입고일</small>
			</div>
		</section>

		<section class="section1">
			<div class="all">
				<div class="mini_title">
					<h3>도서 출고 통계</h3>
				</div>
				<!-- 연도 선택 드롭다운 -->
				<label for="yearSelect">연도 선택: </label> <select id="yearSelect">
					<!-- 연도 옵션 추가 (서버에서 동적으로 불러올 수도 있음) -->
					<option value="2023">2023년</option>
					<option value="2022">2022년</option>
					<option value="2021">2021년</option>
					<option value="2020">2020년</option>
					<option value="2019">2019년</option>
					<option value="2018">2018년</option>

					<!-- 필요에 따라 추가 -->
				</select>

				<!-- 월 선택 드롭다운 -->
				<label for="monthSelect">월 선택: </label> <select id="monthSelect">
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

				<!-- 그래프를 표시할 캔버스 -->
				 <button class="open-modal" data-modal="bookStatisticsModal">도서 출고 통계 테이블 보기</button>
				<canvas id="bookStatisticsChart" width="400" height="200"></canvas>


			</div>
		</section>

		<section class="section2">
			<div class="all">
				<div class="mini_title">
					<h3>도서 수요 통계</h3>
				</div>
					<label for="yearSelectDemand">연도 선택: </label>
					<select id="yearSelectDemand">
						<option value="2023">2023년</option>
						<option value="2022">2022년</option>
						<option value="2021">2021년</option>
						<option value="2020">2020년</option>
						<option value="2019">2019년</option>
						<option value="2018">2018년</option>
						<!-- 다른 연도 선택 가능 -->
					</select> 
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
						<!-- 다른 월 선택 가능 -->
					</select>
					
					<canvas id="demandStatisticsChart" width="400" height="200"></canvas>

				
			</div>
		</section>

		<section class="section3">
			<div class="all">
				<div class="mini_title">
					<h3>도서 수요 예측 통계</h3>
				</div>
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
		
        <canvas id="forecastStatisticsChart" width="400" height="200"></canvas>
         </div>
       
			
		</section>

		<!-- wrap -->
	</div>

	<!--<script>
		// 페이지 로드 시 그래프 초기화
		window.onload = function() {
			console.log('Page loaded'); // 로드 확인
			loadBookStatistics(); // 첫 번째 로드 시 기본 값을 로드
		};
	</script>-->




	<!-- 가장 아래 고정 -->

	<!-- 모달 -->
	<!-- 
	<div id="taskModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<h2>작업지시서</h2>
			<div class="modal-body">
				<p>
					<strong>작업명:</strong> <span id="taskName"></span>
				</p>
				<p>
					<strong>작업자:</strong> <span id="taskAssignee"></span>
				</p>
				<p>
					<strong>진행상황:</strong> <span id="taskStatus"></span>
				</p>
				<p>
					<strong>발생 일자:</strong> <span id="taskDate"></span>
				</p>
				<p>
					<strong>위치:</strong> <span id="taskLocation"></span>
				</p>
				<p>
					<strong>작업 세부사항:</strong>
				</p>
				<textarea id="taskDetails" rows="4" cols="50" readonly></textarea>
			</div>
		</div>
	</div> -->
	<!-- 모달 창 -->
	 <div id="bookStatisticsModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>도서 출고 통계 테이블</h2>
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

    <!-- 수요 통계 모달 -->
    <div id="demandStatisticsModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>수요 통계 테이블</h2>
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

    <!-- 수요 예측 통계 모달 -->
    <div id="forecastStatisticsModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>수요 예측 통계 테이블</h2>
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
</div>
<div>
</div>
</body>
</html>