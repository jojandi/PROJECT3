<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./assets/css/base/user_base.css" rel="stylesheet">

<style>
	ul {
    margin: 0;
    padding: 0;
}

ul li {
    list-style: none;
    margin: 0;
    padding: 0;
}

a {
    text-decoration: none;
}

.menu1 {
	height: 60px;
}

.menu1 > li {
    float: left;
    text-align: center;
    line-height: 40px;
    position: relative;
}

/* 서브메뉴 크기 통일 */
.submenu {
	text-align: center;
    display: none; /* 서브메뉴 항상 표시 */
    position: absolute;
    top: 60px;  /* 메인 메뉴 하단에 서브메뉴가 위치 */
    left: -10px;  /* 모든 서브메뉴가 같은 위치에서 시작 */
    background: white;
    z-index: 1000;
    padding: 0;
    transition: opacity 0.5s ease, visibility 0.5s ease;
    width: 210px; /* 서브메뉴 너비 고정 */
    font-size: 17px;
    height: 160px;
    border-left: 1px solid #ccc;
}

.borderNone{
	border: none;
}

/* 전체 메뉴에 호버할 때 서브메뉴 표시 */
.menu1:hover .submenu,
.submenu li:hover {
	display: block;
}

/* 서브메뉴 항목 스타일 */
.submenu li {
	font-weight: 500;
    text-align: left;
    padding: 5px 10px;
    white-space: nowrap;  /* 서브메뉴 항목이 줄바꿈되지 않도록 설정 */
}

/* 서브메뉴 항목 호버 시 */
.submenu li:hover {
    text-decoration: underline;
}

/* 메뉴 호버 시 스타일 */
.menu1 > li:hover {
    text-decoration: underline;
}

/* clearfix를 사용해 플로트 요소 정리 */
.menu1::after {
    content: "";
    display: block;
    clear: both;
}

#block{
    display: none; /* 서브메뉴 항상 표시 */
    position: absolute;
    top: 100px;  /* 메인 메뉴 하단에 서브메뉴가 위치 */
    left: 0;  /* 모든 서브메뉴가 같은 위치에서 시작 */
    background: white;
    z-index: 100;
    width: 100%; /* 서브메뉴 너비 고정 */
    font-size: 17px;
    height: 160px;
    border-bottom: 2px solid #ccc;
}

</style>

</head>
<body>
	<!-- 가장 위 고정 -->
	<header id="top" class="clearfix">

		<div id="logoall">
			<div id="logo" class="left">
				<a href="mes_main"><img class="logo_img"
					src="./assets/img/mes_logo.png"></a>
			</div>
			<!-- <div id="name" class="left">행복만땅 <br>도서관</div> -->
		</div>

		<div id="menu">
			<div id="items" class="left">
				<ul class="menu1">
					<li class="item" id="i1"><a href="mes_pfwork1">작업 수행</a>
						<ul class="submenu borderNone">
							<li><a href="mes_pfwork1">주문현황</a></li>
							<li><a href="mes_pfwork2">출고현황</a></li>
						</ul>
					</li>
					
					<li class="item" id="i2"><a href="mes_workorder1">생산 관리</a>
						<ul class="submenu">
							<li><a href="mes_workorder1">작업지시서</a></li>
							<li><a href="mes_bom">BOM</a></li>
						</ul>
					</li>
					
					<li class="item" id="i3"><a href="mes_stock1">재고 관리</a>
						<ul class="submenu">
							<li><a href="mes_stock1">재고 현황</a></li>
							<li><a href="mes_stock2">보유 도서 목록</a></li>
							<li><a href="mes_stock3">도서 발주</a></li>
						</ul>
					</li>
					
					<li class="item" id="i4"><a href="mes_human">인사 관리</a>
						<ul class="submenu">
							<li><a href="mes_human">직원 관리</a></li>
						</ul>
					</li>
					
					<li class="item" id="i5"><a href="mes_buser">북플릭스 관리</a>
						<ul class="submenu">
							<li><a href="mes_buser">회원 관리</a></li>
							<li><a href="mes_review">리뷰 관리</a></li>
						</ul>
					</li>
					
					<li class="item" id="i6"><a href="mes_graph">수요예측 및 통계</a>
						<ul class="submenu">
							<li><a href="mes_graph">도서 출고 통계</a></li>
							<li><a href="mes_graph2">도서 수요 통계</a></li>
							<li><a href="mes_graph3">도서 수요 예측</a></li>
						</ul>
					</li>
					
					<li class="item" id="i7"><a href="mes_notice1">게시판</a>
						<ul class="submenu">
							<li><a href="mes_notice1">게시판</a></li>
						</ul>
					</li>
					
				</ul>
				<div id="block" style="display:none;"></div>
			</div>
			<%--             <c:if test="${ not empty login }"> --%>
			<div class="right" id="userall">
				<span class="inb" id="user">김승환님</span> <span
					class="material-symbols-outlined">person</span>
			</div>
			<%-- 			</c:if> --%>
		</div>
		
		<script>
			// hover가 되었을 때 뒷배경 block으로 변환
			document.querySelectorAll('.menu1, .submenu .li').forEach(function(item) {
			    item.addEventListener('mouseover', function() {
			        document.getElementById('block').style.display = 'block';
			    });
			    
			    item.addEventListener('mouseout', function() {
			        document.getElementById('block').style.display = 'none';
			    });
			});
		</script>
	</header>
</body>
</html>