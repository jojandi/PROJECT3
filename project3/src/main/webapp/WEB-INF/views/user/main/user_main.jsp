<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%-- <%@ page import="user.dto.noti.NotiDTO"%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 메인페이지</title>
<link href="../assets/css/main/main_user.css" rel="stylesheet">
</head>
<body>

	<!-- popup 창 가져오기 -->
	<jsp:include page="/WEB-INF/views/user/popup/user_popup.jsp" />

    <!-- google fonts 가져오기 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <div id="wrap">

	<section id="section">
        <div class="section1">

            <div id="hukwan">
            
            	<div id="librarys">
                    
                    <div class="library" id="joong">중앙</div>
                    <div class="library" id="ssang">쌍용</div>
                    <div class="library" id="du">두정</div>
                    <div class="library" id="sin">신방</div>
                    <div class="library" id="cheng">청수</div>
                    
                </div>
                
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
                <script src="../assets/js/main/calendar.js"></script>

            </div>

        </div>

        <div class="section1">

            <div id="search">
            	<form action="search" method="get">
	                <h2 id="searchText">자료 검색</h2><br>
	                <input type="text" id="searchIn" name="book_name" placeholder=" 검색어를 입력해주세요. ">
	                <!-- <input type="button" id="searchBnt" value="⌕"> -->
	                
	                <input type="submit" id="searchBnt" value="⌕">
            	</form>
            </div>

            <div id="pageall">

                <div class="pages">

                    <div>
                        <div class="page" id="p1">
                            <span class="material-symbols-outlined">home</span>
                            <a href="user_libraryInfo?lib_id=7000"></a>
                        </div>
                        <div class="pname">도서관소개</div>
                    </div>
                    <div>
                        <div class="page" id="p2">
                            <span class="material-symbols-outlined">kid_star</span>
                            <a href="best"></a>
                        </div>
                        <div class="pname">베스트도서</div>
                    </div>
                    <div>
                        <div class="page" id="p3">
							<c:if test="${ login.user_sub == 'Y' }">
	                            <span class="material-symbols-outlined">sync_saved_locally</span>
								<a href="bookflix_use?seq=${login.user_seq}"></a>
							</c:if>
							<c:if test="${ login.user_sub == 'N' }">
	                            <span class="material-symbols-outlined">sync_saved_locally</span>
								<a href="bookflix_info"></a>
							</c:if>
							<c:if test="${ empty login }">
	                            <span class="material-symbols-outlined">sync_saved_locally</span>
                            	<a href="bookflix_info"></a>
                            </c:if>
                        </div>
                        <div class="pname">북플릭스</div>
                    </div>
                    <div>
                        <div class="page" id="p4">
                            <span class="material-symbols-outlined">assignment_add</span>
                            <c:if test="${empty login}">
	                            <a class="loginFilter" href="request"></a>
                            </c:if>
                            <c:if test="${not empty login}">
	                            <a href="request"></a>
                            </c:if>
                        </div>
                        <div class="pname">도서 신청</div>
                    </div>
                    
                </div>

                <div class="pages">

                    <div>
                        <div class="page" id="p5">
                            <span class="material-symbols-outlined">shopping_cart</span>
                            <c:if test="${empty login}">
	                            <a class="loginFilter" href="cart?seq=${login.user_seq}"></a>
                            </c:if>
                            <c:if test="${not empty login}">
	                            <a href="cart?seq=${login.user_seq}"></a>
                            </c:if>
                        </div>
                        <div class="pname">장바구니</div>
                    </div>
                    <div>
                        <div class="page" id="p6">
                            <span class="material-symbols-outlined">person_edit</span>
                            <c:if test="${empty login}">
	                            <a class="loginFilter" href="res?seq=${login.user_seq}"></a>
                            </c:if>
                            <c:if test="${not empty login}">
	                            <a href="res?seq=${login.user_seq}"></a>
                            </c:if>
                        </div>
                        <div class="pname">내 이용정보</div>
                    </div>
                    <div>
                        <div class="page" id="p7">
                            <span class="material-symbols-outlined">full_coverage</span>
                            <a href="notice"></a>
                        </div>
                        <div class="pname">정보광장</div>
                    </div>
                    <div>
                        <div class="page" id="p8">
                            <span class="material-symbols-outlined">lightbulb</span>
                            <a href="notice2"></a>
                        </div>
                        <div class="pname">이용안내</div>
                    </div>
                    
                </div>

                <script src="../assets/js/main/box.js"></script>
            </div>
        </div>
	</section>


        <section class="section2">
            
            <div id="noticewrap">          
                <div id="noticetitle">
                    <sapn>공지사항</sapn>
                    <a href="notice">
                        <span class="material-symbols-outlined">add</span>
                    </a>
                </div>

                <div id="notices">

                    <ul>
	                    <c:forEach var="noti" items="${noti}">
	                        <li class="notice" id="n1">
	                            <div class="nbox joong">${noti.class_name}</div>
	                            <div class="noticeTD">
	                                <a class="title" href="notice3?ann_seq=${noti.ann_Seq}">${noti.ann_Title}</a>
	                                <div class="update">${noti.ann_Regi}</div>
	                            </div>
	                        </li>
	                    </c:forEach>
                    </ul>

                </div>
            </div>

        </section>

        <section class="section3">
            <div id="booksub">
            	<div id="img">
	                <img src="../assets/img/bookflix.png">
            	</div>
            	<div id="mineSection">
	                <div id="booksubInfoTitle">
	                    취향 맞춤 도서 추천 서비스!
	                </div>
	                <div id="booksubInfo">
	                    매달 2권씩 당신의 취향에 맞는 
	                    <div>
		                    책을 추천해드립니다.
	                    </div>
	                </div>
	                <a href="bookflix_info">
	                    <input type="button" id="booksubBnt" value="더 알아보기">
	                </a>
            	</div>
            </div>
            
        </section>


    <!-- wrap -->
    </div> 
</body>
</html>