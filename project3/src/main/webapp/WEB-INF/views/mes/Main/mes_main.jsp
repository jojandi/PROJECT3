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
<link href="../assets/css/mes/admin.css" rel="stylesheet">
<link href="../assets/css/mes/admin_table.css" rel="stylesheet">
<link href="../assets/css/mes/modal.css" rel="stylesheet">
<script src="../assets/js/mes/modal.js"></script>
<script src="../assets/js/mes/click.js"></script>
<link href="../assets/css/mes/click.css" rel="stylesheet">
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
				<script src="../assets/js/mes/01.calendar.js"></script>

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
					<h3>도서 출고 모니터링</h3>
				</div>
				
				<div>
 
			</div>
			<div id="dataContainer" data-order-count="${orderCount}" data-delivery-count="${deliveryCount}"></div>
				<canvas id="orderDeliveryChart"></canvas>

			</div>
		</section>

		<section class="section2">
			<div class="all">
				<div class="mini_title">
					<h3>공지사항</h3>
				</div>
				  <table border="1">
            <thead>
                <tr>
                  <th>공지날짜</th>
                  <th>제목</th>
                  <th>공지내용</th>
                  <th>사원명</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="notice" items="${noticeList}">
                    <tr>
                        <td><fmt:formatDate value="${notice.notice_date}" pattern="yyyy-MM-dd"/></td>
                       <td><a href="mes_noticeRead?notice_id=${ notice.notice_id }">${ notice.notice_name }</a></td>
                       <td>${notice.notice_contents}</td>
                        <td>${notice.emp_name}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
		</div>
		</section>

		<section class="section3">
			<div class="all">
				<div class="mini_title">
					<h3>작업자 로그</h3>
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
</div>

<div>
</div>

</body>
</html>