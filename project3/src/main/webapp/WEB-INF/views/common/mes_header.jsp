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
<link href="../assets/css/base/mes_base.css" rel="stylesheet">

<style>
	

</style>

</head>
<body>
	<!-- 가장 위 고정 -->
	<header id="top" class="clearfix">

		<div id="logoall">
			<div id="logo" class="left">
				<a href="mes_main"><img class="logo_img"
					src="../assets/img/mes_logo.png"></a>
			</div>
		</div>

		<div id="menu">
			<div id="hamburger-menu" class="right">
				<span class="bar"></span>
				<span class="bar"></span>
				<span class="bar"></span>
			</div>
			
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
							<li><a href="mes_workorder2">BOM</a></li>
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
					
					<li class="item" id="i5"><a href="mes_bookflix1">북플릭스 관리</a>
						<ul class="submenu">
							<li><a href="mes_bookflix1">회원 관리</a></li>
							<li><a href="mes_bookflix2">리뷰 관리</a></li>
						</ul>
					</li>
					
					<li class="item" id="i6"><a href="mes_graph1">수요 예측 및 통계</a>
						<ul class="submenu">
							<li><a href="mes_graph1">도서 출고 통계</a></li>
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
			
			<div class="right" id="userall">
				<form action="logout" id="logoutbase">
					<span class="inb" id="user">${ login.user_name }님</span>
					<span class="material-symbols-outlined">person</span><br>
					<a href="/gamja/user/logout"> 
					<span id="logout">로그아웃</span>
					</a>
				</form>
			</div>
		</div>
		
		<script>
			// hover가 되었을 때 뒷배경 block으로 변환
			const isMobile = window.matchMedia("(max-width: 767px)").matches;
			console.log(isMobile);
			if(!isMobile) {
				document.querySelectorAll('.menu1, .submenu .li').forEach(function(item) {
				    item.addEventListener('mouseover', function() {
				        document.getElementById('block').style.display = 'block';
				    });
				    
				    item.addEventListener('mouseout', function() {
				        document.getElementById('block').style.display = 'none';
				    });
				});
			}
			
			// 모바일 아코디언 자바스크립트
			let isOn = false;
			const hamburgerMenu = document.querySelector("#hamburger-menu");
			const items = document.querySelector("#items");
			const userall = document.querySelector("#userall");
			const overlay = document.querySelector("#overlay");
			
			// 햄버거 메뉴 클릭 시
			hamburgerMenu.addEventListener('click', function() {
			    console.log("메뉴", isOn);

			    if (!isOn) {
			        isOn = true;
			        hamburgerMenu.classList.add("on"); // 햄버거 바 상태 추가
			        items.classList.add("show"); // 애니메이션 클래스 추가
			        userall.classList.add("show"); // 애니메이션 클래스 추가
			    } else {
			        isOn = false;
			        hamburgerMenu.classList.remove("on"); // 햄버거 바 상태 제거
			        items.classList.remove("show"); // 애니메이션 클래스 제거
			        userall.classList.remove("show"); // 애니메이션 클래스 제거
			    }
			});
			
			// 메뉴 클릭시
			if(isMobile){
				document.querySelectorAll('.menu1 .item > a').forEach(function(item) {
				    item.addEventListener('click', function(e) {
				        e.preventDefault(); // 기본 링크 동작 방지
				        const parentLi = item.parentElement; // a태그의 부모 요소 가져오기 -> 해당 .item 가져오기
						let isActive = parentLi.classList.contains('active');
				        
				        if (isActive) {
				            parentLi.classList.remove('active');
				        } else {
				            // 모든 메뉴를 닫고 클릭된 메뉴만 열기
				            document.querySelectorAll('.menu1 .item').forEach(li => li.classList.remove('active'));
				            parentLi.classList.add('active');
				        }
				    });
				});
			}
			
			// 로그아웃
			document.getElementById("logout").addEventListener('click',function(e) {
				let c = confirm("로그아웃 하시겠습니까?");

				if (c) {
					window.location.href = "http://localhost:8080/user_page/user/main"
				} else {
					e.preventDefault();
					window.location.href = "mes_main"
				}
			})
		</script>
	</header>
</body>
</html>