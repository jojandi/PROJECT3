<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 가장 위 고정 -->
   <header id="top" class="clearfix">
               
       <div id="logoall">
           <div id="logo" class="left"></div>
           <!-- <a href="01.main_user_login.html" id="name" class="left">행복만땅 <br>도서관</a> -->
           <a href="main" id="name" class="left">행복만땅 <br>도서관</a>
       </div>

       <div id="menu">
           <div id="items" class="left">
           	<c:if test="${ empty login }">
               	<a href="bookflix_info" class="item" id="i0">북플릭스</a>
               </c:if>
           	<c:if test="${ login.user_sub == true }">
               	<a href="bookflix_use?seq=${login.user_seq}" class="item" id="i0">북플릭스</a>
               </c:if>
           	<c:if test="${ login.user_sub == false }">
               	<a href="bookflix_info" class="item" id="i0">북플릭스</a>
               </c:if>
               <a href="best" class="item" id="i2">베스트</a>
               <a href="notice" class="item" id="i3">정보광장</a>
              	<a href="res?seq=${ login.user_seq }" class="item" id="i4">마이페이지</a>
           </div>
           
			<c:if test="${ not empty login }">
				<div class="right" id="userall">
					<span class="inb" id="user">${ login.user_name }님</span>
	                <span class="material-symbols-outlined">person</span>
				</div>
			</c:if>
			<c:if test="${ empty login }">
				<div class="right" id="userall">
	                <a href="login" class="inb" id="login">로그인</a>
	                <div class="inb">|</div>
	                <a href="join" class="inb" id="userin">회원가입</a>
	           	</div>
			</c:if>
		
       </div>
       
   </header>
