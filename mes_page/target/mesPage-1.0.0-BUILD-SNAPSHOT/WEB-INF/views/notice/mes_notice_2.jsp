<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="./assets/css/mes_notice2.css" rel="stylesheet">
    <title>공지사항 글쓰기</title>
</head>
<body>
    <div class="container">
        <h1>게시판</h1>
        <form id="postForm" method="post" action="notice_insert">
            <h2>게시판 글쓰기</h2>
            <label for="title">제목</label>
            <input type="text" id="title" name="notice_name" required>
            
            <label for="content">내용</label>
            <textarea id="content" name="notice_contents" rows="10" required></textarea>

            <br>
            <input type="submit" value="등록">
        </form>
        
    </div>

        
</body>
</html>