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
<link href="../assets/css/mes/modal.css" rel="stylesheet">
<script src="../assets/js/mes/modal.js"></script>
<script src="../assets/js/mes/click.js"></script>
<link href="../assets/css/mes/click.css" rel="stylesheet">
<link href="../assets/css/mes/mes_mainPage.css" rel="stylesheet">
<!-- Chart.js CDN 포함 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<!-- JavaScript 파일 -->
<script
	src="<%=request.getContextPath()%>/assets/js/mes/mes_mainPage.js"></script>



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
						<div id="hukwan_bot">
							<div class="circle_1"></div>
							<small>출고일</small>
							<div class="circle_2"></div>
							<small>도서입고일</small>
						</div>
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
			
		</section>
		<section class="section1">
			<div class="all">
				<div id="chartName">
					도서 출고 모니터링
				</div>

				<div id="chart-table-container" style="display: flex; align-items: flex-end;">
					<!-- 도넛 그래프 -->
					<div style="flex: 1;">
						<canvas id="orderDeliveryChart"></canvas>
					</div>

					<!-- 테이블 -->
					<div style="border: 1px solid #ccc">
						<table border="1" style="width: 100%; text-align: center;">
							<thead>
								<tr>
									<th>항목</th>
									<th>수량</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>주문 수량</td>
									<td id="orderCountCell"></td>
									<!-- 주문 수량이 표시될 셀 -->
								</tr>
								<tr>
									<td>출고 수량</td>
									<td id="deliveryCountCell"></td>
									<!-- 출고 수량이 표시될 셀 -->
								</tr>
							</tbody>
						</table>
					</div>
				</div>

				<!-- 숨겨진 데이터 컨테이너 -->
				<div id="dataContainer" data-order-count="${orderCount}"
					data-delivery-count="${deliveryCount}"></div>
			</div>
		</section>

		<section class="section3">
			<div class="mini_title">
				<h3>실시간 작업 로그</h3>
			</div>
			<div class="all">
				<table>
					<colgroup>
						<col width="22%">
						<col width="55%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr>
							<td>시간</td>
							<td>작업내용</td>
							<td>상태</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="log" items="${log}">
							<tr>
								<td>${log.log_date}</td>
								<td style="text-align: left;">
									<c:if test="${log.os_status == 'null' }">
										${log.bom_name} 주문
									</c:if>
									<c:if test="${log.os_status == '진행중'}">
										${log.lib_name} 세트 ${log.wo_process}
									</c:if>
									<c:if test="${log.os_status == '완료'}">
										${log.lib_name} 세트 ${log.wo_process}
									</c:if>
								</td>
								<td>
									<c:if test="${log.os_status == 'null' }">
										-
									</c:if>
									<c:if test="${log.os_status == '진행중'}">
										작업 시작
									</c:if>
									<c:if test="${log.os_status == '완료'}">
										작업 완료
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</section>
		
		
		<section class="section2">

			<div id="noticewrap">
				<div id="noticetitle">
					<sapn>게시판</sapn>
					<a href="notice"> <span class="material-symbols-outlined">add</span>
					</a>
				</div>

				<div id="notices">

					<ul>
						<c:forEach var="noti" items="${noticeList}">
							<li class="notice" id="n1">
								<div class="noticeTD">
									<a class="title"
										href="mes_noticeRead?notice_id=${noti.notice_id}">${noti.notice_name}</a>
									<div class="update">${noti.notice_date}</div>
								</div>
							</li>
						</c:forEach>
					</ul>

				</div>
			</div>
		</section>
	</div>


</body>
</html>