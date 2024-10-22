<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="project3.talking.gamja.dto.user.BookflixDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bookflix</title>
    <link href="./assets/css/bookflix/bookflix_use.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<div id="wrap">
    <div id="parent">
        <div id="top_logo">
            <img id="top_logo_img" src="./assets/img/bookflix.png">
        </div>

  		<%
    List<BookflixDTO> list = (List<BookflixDTO>) request.getAttribute("list");
    
    if (list != null && !list.isEmpty()) {
        BookflixDTO dto = list.get(0);

        Date buserDate = dto.getBuser_date();
        Date buserEnd = dto.getBuser_end();

        // SimpleDateFormat 사용하여 연-월-일 형식으로 변환
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        String dateFormatted = dateFormat.format(buserDate);
        String endFormatted = dateFormat.format(buserEnd);

        // 출력
        System.out.println("Formatted date: " + dateFormatted);
        System.out.println("Formatted end: " + endFormatted);
%>
         <div id="top_box">
                <div>
                    ${list[0].user_name}님은 <%= dateFormatted %> 부터 구독 하셨습니다. <br>
                    구독 기간은 <%= dateFormatted %>부터 <%= endFormatted %> 입니다.
                </div>
            </div>
<%
    } else {
        System.out.println("null");
    }
%>

        <div class="top_for_you">
            ${list[0].user_name}님만을 위한 취향저격 이달의 ${list[0].bom_name} 도서
            <div id="top_in_for_you">
                ${list[0].user_name}님을 위한 책을 소개시켜드릴게요!<br>
                인공지능 데이터를 토대로 추천 해드립니다.
            </div>
        </div>

        <div id="book_1_parent">
            <div id="bookall">
                <c:forEach var="item" items="${list}">
                    <div class="book">
                        <img id="book_1_img" src="${item.book_img}">
                        <div class="book_name">&lt; ${item.book_name} &gt;</div>
                        <div>
                            <div class="btn">
                                <button class="popupBnt">책정보 보기</button>
                            </div>

                            <div id="popup1" class="popup">
                                <div class="popup-header">
                                    <h2>${item.book_name}</h2>
                                    <span class="popup-close">&times;</span>
                                </div>
                                <p>${item.book_author} (지은이)  &nbsp;|&nbsp; ${item.book_pub} (주)</p>
                                <p>${item.li_book_info}</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <div id="review">
            <div>BOOKFLIX에 대한 평가를 남겨주세요!</div>
            <button type="button" id="reviewBnt">리뷰쓰기</button>

            <form method="post" action="bookflix_review" id="form">
                <div id="reviewPopup">
                    <div class="close">
                        <span class="popup-close">&times;</span>
                    </div>
                    <div class="star-rating">
                        <span>별점 : </span>
                        <input type="checkbox" name="star" class="star" value="1">
                        <input type="checkbox" name="star" class="star" value="2">
                        <input type="checkbox" name="star" class="star" value="3">
                        <input type="checkbox" name="star" class="star" value="4">
                        <input type="checkbox" name="star" class="star" value="5">
                    </div>
                    <textarea name="review_text" id="review_text" placeholder=" 리뷰를 입력해주세요. "></textarea>
                    <br>
                    <input type="hidden" name="buser" value="${list[0].buser_seq}">
                    <input type="hidden" name="user" value="${list[0].user_seq}">
                    <button type="submit" id="end">작성완료</button>
                </div>
            </form>
        </div>
    </div>
    <script src="./assets/js/bookflix/bookflix_use.js"></script>
</div>

</body>
</html>
