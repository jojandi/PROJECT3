<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<style>
.container {
            width: 300px;
            margin: 0 auto;
            padding: 100px; 
            background-color: white;
            border-radius: 10px; 
            height: 450px;
}

.title {
    text-align: center;
    font-size: 24px;
}

.input-group {
    position: relative;
    margin-bottom: 15px;
}

.input-group img {
    position: absolute;
    left: -50%;
    top: 50%;
    transform: translateY(-50%);
    width: 150px;
}

.input-group input {
    width: 100%;
    padding: 10px;
    box-sizing: border-box;
}

.login-btn {
    width: 100%;
    padding: 10px;
    background: rgb(165, 224, 144);
    border: 1px solid rgb(106, 170, 82);
    border-radius: 5px;
    cursor: pointer;
}

.login-btn:hover {
    background-color: rgb(140, 199, 119);
}

.idpw {
    text-align: center;
    margin-top: 10px;
}

.idpw input[type="button"] {
    padding: 10px 20px;
    margin: 20px 0;
    background: white;
    border: 1px solid rgb(106, 170, 82);
    color: black;
    border-radius: 5px;
    cursor: pointer;
    font-size: 13px;
}

.idpw input[type="button"]:hover {
    background-color: #ececec;
}

#password{
	margin: 0;
}

#error{
	color: red;
	margin-bottom: 10px;
	font-size: 15px;
}
</style>
</head>

<body>

	<!-- 여기에 내가 짠 코드 넣기 -->
	<div class="container">
		<h1 class="title">행복만땅 도서관</h1>
		<form method="post" action="logingo">
			<div class="input-group">
				<input type="text" id="username" name="user_id" placeholder="ID">
			</div>
			<div class="input-group">
				<input type="password" id="password" name="user_pw" placeholder="Password">
				<img src="../assets/img/logo.png">
			</div>
			<c:if test='${param.code == "LO01" }'>
				<div id="error">
					아이디 또는 비밀번호를 확인해 주세요. 
				</div>
			</c:if>
			<div>
				<input type="submit" value="회원로그인" class="login-btn" id="loginBtn">
			</div>
			
	</form>
	</div>


</body>
</html>
