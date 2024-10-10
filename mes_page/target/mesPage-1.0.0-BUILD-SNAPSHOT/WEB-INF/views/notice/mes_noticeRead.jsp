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
    <link href="./assets/css/mes_notice_read.css" rel="stylesheet">
  
</head>

<body>


    <div id="wrap">
        <section>
        	<div id="content_all">
				<div class="name">
					<strong>${ read.notice_name } </strong>
					<div id="mini">
						<span class="mini_date">등록일 | ${ read.notice_date }</span> <span>작성자 | ${ read.emp_name }</span>
					</div>
				</div>

				<div id="content">
					${ read.notice_contents }
				</div>
				
				<div style="border: 1px solid lightgray; whidth: 300px;">
					<span>김승환 : 넵!</span>
				</div>
				<br>
				
				<input type="button" value="댓글쓰기">
				<br>
				<br>
				<a href="/mmes_page/notice_update?notice_id=${ read.notice_id }"><input type=button value="수정"></a>
				<a href="/mmes_page/notice_delete?notice_id=${ read.notice_id }"><input type="button" value="삭제"></a>
				
				<div id="pagination"></div>
                <br>
                <br>
                <div class="write" style="text-align:right;">
                    <a href="notice">
                        <input type="button" class="btnnn" value="목록으로">
                    </a>
                </div>
			</div>
        </section>
    </div>


</body>

</html>