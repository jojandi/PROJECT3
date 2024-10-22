<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>북플릭스</title>
<link href="../assets/css/bookflix/bookflix.css" rel="stylesheet">
<link href="../assets/css/base/admin_table.css" rel="stylesheet">
</head>
<body>

	<div id="parent">
		<div id="top_logo">
			<img id="top_logo_img" src="../assets/img/bookflix.png">
		</div>

		<div class="top_for_you">
			당신만을 위한 취향저격 이달의 구독 도서 서비스!
			<div id="top_in_for_you">
				당신만을 위한 책을 소개시켜드릴게요.<br> 인공지능 데이터를 토대로 추천 해드립니다.
			</div>
		</div>
		<div class="slider">
			<div class="slider-container">
				<!-- 복제된 마지막 슬라이드 -->
				<img
					src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791198686114.jpg"
					alt="Book 9" class="book">
				<!-- 원본 슬라이드들 -->
				<img
					src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9788965138068.jpg"
					alt="Book 1" class="book"> <img
					src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9788930041683.jpg"
					alt="Book 2" class="book"> <img
					src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791198517425.jpg"
					alt="Book 3" class="book"> <img
					src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791170611561.jpg"
					alt="Book 4" class="book"> <img
					src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791198682505.jpg"
					alt="Book 5" class="book"> <img
					src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9788998441012.jpg"
					alt="Book 6" class="book"> <img
					src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9788952776372.jpg"
					alt="Book 7" class="book"> <img
					src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791198682550.jpg"
					alt="Book 8" class="book"> <img
					src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791198686114.jpg"
					alt="Book 9" class="book">
				<!-- 복제된 첫 번째 슬라이드 -->
				<img
					src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9788965138068.jpg"
					alt="Book 1" class="book">
			</div>
		</div>
		<div class="mid_for_you">
			도서관 방문이 어려운 당신을 위해 !<br> 한 달에 두권씩 배송해드립니다.
			<div id="mid_in_for_you">
				취향에 맞는 책만 읽으시면 됩니다.<br> <br> 간단한 리뷰를 작성해 주시면 최대 1000포인트 적립
				찬스까지!
			</div>
			<div id="reviewWindow">
				<h3>&lt;북플릭스 유저들의 리뷰&gt;</h3>
				<c:choose>
					<c:when test="${not empty topReviews}">
						<div id="review">
							<c:forEach var="review" items="${topReviews}">
								<div class="reviewBox">
									<div class="userBox">
										<span class="material-symbols-outlined">
											account_circle 
										</span>
										${review.user_id} 
									</div>
									<div style="width: 510px;">
										<div class="reStar">★★★★★</div>
										"${review.review_contents}"
										<div class="reDate">${review.review_date}</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</c:when>
					<c:otherwise>
						<div>조회된 리뷰가 없습니다.</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>


		<c:choose>
			<c:when test="${login != null}">
				<div id="top_box">
					<form method="post" action="bookflix_sub">
						<input type="hidden" name="seq" value="${login.user_seq}">
						<input type="submit" value="구독 서비스 신청하기" id="fixed-button">
					</form>
				</div>
			</c:when>
			<c:otherwise>
				<div id="top_box">
					<form method="get" action="login">
						<input type="submit" value="구독 서비스 신청하기" id="fixed-button">
					</form>
				</div>
			</c:otherwise>
		</c:choose>

	</div>

	<!-- wrap -->
	<script src="../assets/js/bookflix/slider.js"></script>
	<script src="../assets/js/bookflix/bookflix_use.js"></script>

</body>
</html>