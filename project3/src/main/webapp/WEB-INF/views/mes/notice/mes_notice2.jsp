<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="./assets/css/mes/mes_notice2.css" rel="stylesheet">
        <link href="./assets/css/mes/admin_table.css" rel="stylesheet">
    <link href="./assets/css/mes/00.user_side_base.css" rel="stylesheet">
    <link href="./assets/css/mes/admin.css" rel="stylesheet">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link href="./assets/css/mes/click.css" rel="stylesheet">
    <link href="./assets/css/mes/mes_notice.css" rel="stylesheet">
    <title>공지사항 글쓰기</title>
</head>
<body>
<section>
    <div class="main_page">
        <h3>게시판 글쓰기</h3>
        <form id="postForm" method="post" action="mes_notice2">
            <label for="title">제목</label>
            <input type="text" id="title" name="notice_name" required>  
            <label for="content">내용</label>
            <textarea id="content" name="notice_contents" rows="10" required></textarea>
            <br>
            <input type="submit" value="등록">
        </form>
    </div>
</section>
</body>
</html>