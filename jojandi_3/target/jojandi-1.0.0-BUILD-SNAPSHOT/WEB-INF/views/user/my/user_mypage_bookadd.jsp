<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 마이페이지</title>
<link href="../assets/css/my/user_mypage_bookadd.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
        <section id="min">

            <div id="stitle">
                <h3>${ login.user_name }님의 도서 신청 내역</h3>
            </div>

            <div id="t1" class="table">
                <table>
                    <thead> 
                        <tr>
                            <td id="bnameall">도서명</td>
                            <td>신청일</td>
                            <td>신청현황</td>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="add" items="${add}">
                        <tr class="parent">
                            <td class="bname">${add.app_book }</td>
                            <td>${add.app_date }</td>
                            <c:if test="${ add.purchased eq null }">
                          		<td>신청완료</td>
                            </c:if>
                            <c:if test="${ add.purchased != null }">
                            	<td>${add.purchased }</td>
                            </c:if>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <div id="movepage">
                <span class="material-symbols-outlined">chevron_left</span>
                <span class="chap">1</span>
                <span class="material-symbols-outlined">chevron_right</span>
            </div>
        </section>

		<script src="../assets/js/my/mypage_bookadd.js"></script>
</body>
</html>