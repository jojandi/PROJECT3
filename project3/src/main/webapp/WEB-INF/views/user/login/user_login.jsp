<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>로그인 페이지</title>
    <link href="../assets/css/login/login.css" rel="stylesheet">
</head>

<body>
		<!--내가 짠 코드 넣기   -->
    <!-- 로그인 폼 -->
    <div class="container">
        <h1 class="title">행복만땅 도서관</h1>
        <form method="post" action="logingo">
            <!-- ID 입력 -->
            <div class="input-group">
                <input type="text" id="username" name="user_id" placeholder="ID" required>
            </div>

            <!-- 비밀번호 입력 -->
            <div class="input-group">
                <input type="password" id="password" name="user_pw" placeholder="Password" required>
                <img src="../assets/img/logo.png" alt="Logo">
            </div>

            <!-- 로그인 실패 시 오류 메시지 표시 -->
            <c:if test='${param.code == "LO01"}'>
                <div id="error" style="color: red; margin-top: 10px;">
                    아이디 또는 비밀번호를 확인해 주세요.
                </div>
            </c:if>

            <!-- 로그인 버튼 -->
            <div>
                <input type="submit" value="회원로그인" class="login-btn" id="loginBtn">
            </div>
        </form>
    </div>

</body>
</html>
