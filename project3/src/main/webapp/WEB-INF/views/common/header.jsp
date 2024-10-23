<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="../assets/css/base/user_base.css" rel="stylesheet">
<!-- 가장 위 고정 -->
<header id="top" class="clearfix">

	<div id="logoall">
		<div id="logo" class="left"></div>
		<a href="main" id="name" class="left">행복만땅 <br>도서관
		</a>
	</div>

	<div id="menu">
		<div id="hamburger-menu" class="right">
			<span class="bar"></span>
			<span class="bar"></span>
			<span class="bar"></span>
		</div>

		<div id="items" class="left">
			<ul class="menu1">
				<c:if test="${empty login}">
					<li class="item" id="i0">
						<a href="bookflix_info">북플릭스</a>
						<ul class="submenu">
							<li><a href="bookflix_info">북플릭스</a></li>
						</ul>
					</li>
				</c:if>
				<c:if test="${not empty login && login.user_sub == 'Y'}">
					<li class="item" id="i0">
						<a href="bookflix_user?seq=${login.user_seq}">북플릭스</a>
						<ul class="submenu">
							<li><a href="bookflix_user?seq=${login.user_seq}">북플릭스</a></li>
						</ul>
					</li>
				</c:if>
				<c:if test="${!empty login && login.user_sub == 'N'}">
					<li class="item" id="i0">
						<a href="bookflix_info">북플릭스</a>
						<ul class="submenu">
							<li><a href="bookflix_info">북플릭스</a></li>
						</ul>
					</li>
				</c:if>

				<li class="item" id="i20">
					<a href="user_libraryInfo?lib_id=7000">도서관 정보</a>
					<ul class="submenu">
						<li><a href="user_libraryInfo?lib_id=7000">중앙도서관</a></li>
						<li><a href="user_libraryInfo?lib_id=7001">쌍용도서관</a></li>
						<li><a href="user_libraryInfo?lib_id=7002">두정도서관</a></li>
						<li><a href="user_libraryInfo?lib_id=7003">신방도서관</a></li>
						<li><a href="user_libraryInfo?lib_id=7004">청수도서관</a></li>
					</ul>
				</li>
				<li class="item" id="i2">
					<a href="best">베스트</a>
					<ul class="submenu">
						<li><a href="best">베스트</a></li>
					</ul>
				</li>
				<li class="item" id="i3"><a href="notice">정보광장</a>
					<ul class="submenu">
						<li><a href="notice">공지사항</a></li>
						<li>
							<c:if test="${empty login}">
								<a href="request" class="loginFilter">도서신청</a>
							</c:if>
							<c:if test="${not empty login}">
								<a href="request">도서신청</a>
							</c:if>
						</li>
						<li><a href="notice2">이용안내</a></li>
					</ul>
				</li>
				<c:if test="${not empty login}">
					<li class="item" id="i4"><a href="res?seq=${login.user_seq}">마이페이지</a>
						<ul class="submenu">
							<li><a href="res?seq=${login.user_seq}">이용내역</a></li>
							<li><a href="cart?seq=${login.user_seq}">찜 목록</a></li>
							<li><a href="apply?seq=${login.user_seq}">도서 신청 내역</a></li>
							<li><a href="myInfo?seq=${login.user_seq}">내 정보</a></li>
						</ul>
					</li>
				</c:if>
				<c:if test="${empty login}">
					<li class="item" id="i4"><a href="res?seq=${login.user_seq}" class="loginFilter">마이페이지</a>
						<ul class="submenu">
							<li><a href="res?seq=${login.user_seq}" class="loginFilter">이용내역</a></li>
							<li><a href="cart?seq=${login.user_seq}" class="loginFilter">찜 목록</a></li>
							<li><a href="apply?seq=${login.user_seq}" class="loginFilter">도서 신청 내역</a></li>
							<li><a href="myInfo?seq=${login.user_seq}" class="loginFilter">내 정보</a></li>
						</ul>
					</li>
				</c:if>
			</ul>
			<div id="block" style="display: none;"></div>
		</div>


		<div class="right" id="userall">
			<c:if test="${ not empty login }">
				<span class="inb" id="user">${ login.user_name }님</span>
				<span class="material-symbols-outlined">person</span>
				<div class="inb">|</div>
				<a href="logout"> 
					<span id="logout">로그아웃</span>
				</a>
			</c:if>
			<c:if test="${ empty login }">
				<a href="login" class="inb" id="login">로그인</a>
				<div class="inb">|</div>
				<a href="join" class="inb" id="userin">회원가입</a>
			</c:if>
		</div>
	</div>

		
		<script>
			// 로그아웃
			if('${login}'){
				document.getElementById("logout").addEventListener('click',function(e) {
					let c = confirm("로그아웃 하시겠습니까?");
	
					if (c) {
						window.location.href = "http://localhost:8080/user_page/user/main"
					} else {
						e.preventDefault();
						window.location.href = "main"
					}
				})
			}
			
			// hover가 되었을 때 뒷배경 block으로 변환
			const isMobile = window.matchMedia("(max-width: 767px)").matches;
			console.log(isMobile);
			if(!isMobile){
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
		</script>


</header>