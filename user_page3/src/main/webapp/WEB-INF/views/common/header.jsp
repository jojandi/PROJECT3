<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="./assets/css/base/user_base.css" rel="stylesheet">
<!-- 가장 위 고정 -->
   <header id="top" class="clearfix">
               
       <div id="logoall">
           <div id="logo" class="left"></div>
           <!-- <a href="01.main_user_login.html" id="name" class="left">행복만땅 <br>도서관</a> -->
           <a href="main" id="name" class="left">행복만땅 <br>도서관</a>
       </div>

		<div id="overlay" class="overlay">
	       <div id="menu">
	       		<div id="hamburger-menu" class="right">
				    <div class="bar"></div>
				    <div class="bar"></div>
				    <div class="bar"></div>
				</div>
	       
	           <div id="items" class="left">
				    <ul>
				        <c:if test="${empty login}">
				            <li><a href="bookflix_info" class="item" id="i0">북플릭스</a></li>
				        </c:if>
				        <c:if test="${not empty login && login.user_sub == 'Y'}">
				            <li><a href="bookflix_user?seq=${login.user_seq}" class="item" id="i0">북플릭스</a></li>
				        </c:if>
				        <c:if test="${!empty login && login.user_sub == 'N'}">
				            <li><a href="bookflix_info" class="item" id="i0">북플릭스</a></li>
				        </c:if>
				        
				        <li><a href="user_libraryInfo?lib_id=7000" class="item" id="i20">도서관 정보</a>
				            <ul class="submenu">
				            	<li><a href="user_libraryInfo?lib_id=7000">중앙도서관</a></li>
				            	<li><a href="user_libraryInfo?lib_id=7001">쌍용도서관</a></li>
				            	<li><a href="user_libraryInfo?lib_id=7002">두정도서관</a></li>
				            	<li><a href="user_libraryInfo?lib_id=7003">신방도서관</a></li>
				            	<li><a href="user_libraryInfo?lib_id=7004">청수도서관</a></li>
				            </ul>
				        </li>
				        <li><a href="best" class="item" id="i2">베스트</a></li>
				        <li><a href="notice" class="item" id="i3">정보광장</a>
				            <ul class="submenu">
				            	<li><a href="notice">공지사항</a></li>
				            	<li><a href="request">도서신청</a></li>
				            	<li><a href="notice2">이용안내</a></li>
				            </ul>
				        </li>
				        <li><a href="res?seq=${login.user_seq}" class="item" id="i4">마이페이지</a>
				            <ul class="submenu">
				            	<li><a href="res?seq=${login.user_seq}">이용내역</a></li>
				            	<li><a href="cart?seq=${login.user_seq}">찜 목록</a></li>
				            	<li><a href="apply?seq=${login.user_seq}">도서 신청 내역</a></li>
				            	<li><a href="info?seq=${login.user_seq}">내 정보</a></li>
				            </ul>
				        </li>
				    </ul>
				</div>
	           
				<div class="right" id="userall">
					<c:if test="${ not empty login }">
						<a href="logout">
							<span class="inb" id="user">${ login.user_name }님</span>
						</a>
	                	<span class="material-symbols-outlined">person</span>
					</c:if>
					<c:if test="${ empty login }">
			                <a href="login" class="inb" id="login">로그인</a>
			                <div class="inb">|</div>
			                <a href="join" class="inb" id="userin">회원가입</a>
					</c:if>
	           	</div>
        
           	
			<script>
				let isOn = false;
				document.querySelector("#hamburger-menu").addEventListener('click', function(){
				    console.log("메뉴", isOn);
				    
				    if(!isOn){
					    isOn = true;
					    document.querySelector("#hamburger-menu").classList.add("on");
					    document.querySelector("#items").style.display = "block";
					    document.querySelector("#userall").style.display = "block";
					    document.querySelector("#overlay").style.display = "block";
				    } else{
					    isOn = false;
					    document.querySelector("#hamburger-menu").classList.remove("on");
					    document.querySelector("#items").style.display = "none";
					    document.querySelector("#userall").style.display = "none";
					    document.querySelector("#overlay").style.display = "none";
				    }
				})
				
				// 오버레이를 클릭하면 메뉴 닫기
				overlay.addEventListener('click', function() {
				    isOn = false;
				    document.querySelector("#hamburger-menu").classList.remove("on");
				    document.querySelector("#items").style.display = "none";
				    document.querySelector("#userall").style.display = "none";
				    overlay.style.display = "none"; // 오버레이 숨김
				});
			</script>
		
			</div>
       </div>
   </header>