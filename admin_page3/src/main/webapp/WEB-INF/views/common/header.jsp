<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 가장 위 고정 -->
<header id="top" class="clearfix">

	<div id="logoall">
		<div id="logo" class="left"></div>
		<!-- <a href="01.main_user_login.html" id="name" class="left">행복만땅 <br>도서관</a> -->
		<a href="main" id="name" class="left">행복만땅 <br>도서관
		</a>
	</div>

	<div id="menu">
		<div id="items" class="left">
			<a href="inventory" class="item" id="i0">재고 현황</a> <a href="member"
				class="item" id="i1">회원관리</a> <a href="noti" class="item" id="i2">정보광장관리</a>
		</div>


		<link rel="stylesheet"
			href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
		<div class="right" id="userall">
			<form action="logout">
				<input type="submit" class="inb" id="user" value="조잔디님"> <span
					class="material-symbols-outlined">person</span>
			</form>
		</div>
	</div>

	<script>
		document
				.getElementById("userall")
				.addEventListener(
						'click',
						function() {
							let c = confirm("로그아웃 하시겠습니까?");

							if (c) {
								window.location.href = "http://localhost:8080/user_page/user/main"
							} else {
								window.location.href = "main"
							}
						})
	</script>

</header>
