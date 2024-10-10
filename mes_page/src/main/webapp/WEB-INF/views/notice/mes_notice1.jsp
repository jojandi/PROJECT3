<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link rel="stylesheet" href="layout.css" type="text/css">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link href="./assets/css/admin_table.css" rel="stylesheet">
    <link href="./assets/css/00.user_side_base.css" rel="stylesheet">
    <link href="./assets/css/admin.css" rel="stylesheet">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link href="./assets/css/click.css" rel="stylesheet">
    <link href="./assets/css/mes_notice.css" rel="stylesheet">
    
    <style>
    	#menu #items #i6{
            font-weight: 901;
            text-decoration: underline;
        }
    </style>
  
</head>

<body>

        <section>
            <div class="main_page">
                <h3>게시판</h3>
                <div class="notince" >
                    <div class="t1">
	                    <div class="scc" style="text-align: right;">
	                        <input class="sch" type="text" name="search" placeholder="검색어를 입력하세요">
	                        <button class="sb" name="검색" value="검색">검색</button>
	                    </div>
                        <div>
                            <table>
                                <tr>
                                    <th>번호</th>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>작성날짜</th>
                                </tr>
                                <c:forEach var="notice" items="${ noticeList1 }">
                                <tr>
                                	<td>${ notice.notice_id }</td>
                                	<td><a href="notice_read?notice_id=${ notice.notice_id }">${ notice.notice_name }</a></td>
                                	<td>${ notice.emp_name }</td>
                                	<td>${ notice.notice_date }</td>
                                </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                    <div id="pagination"></div>
                    <br>
                    <div class="write" style="text-align:right;">
                        <a href="notice_insert">
                            <input type="button" class="btnnn" value="글쓰기">
                        </a>
                    </div>
                </div>
            </div>
        </section>

<script src="./assets/js/mes_notice.js"></script>
</body>

</html>