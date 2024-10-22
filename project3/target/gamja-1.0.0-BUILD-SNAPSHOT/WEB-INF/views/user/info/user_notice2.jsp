<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 사용자용 이용시간 안내</title>
<link href="../assets/css/info/user_notice2.css" rel="stylesheet">
<link href="../assets/css/base/user_base.css" rel="stylesheet">
<link href="../assets/css/info/user_info_side.css" rel="stylesheet">
</head>
<style>
aside #items #i3 .material-symbols-outlined {
        background: rgb(165, 224, 144);
}
</style>
<body>
        <div id="section">
            <div class="name">
                <strong>이용안내</strong>
            </div>

            <div id="table">
                <table class="report" id="reportTable">
				<colgroup>
				    <col width="20%"/>
				    <col width="12%"/>
				    <col width="12%"/>
				    <col width="15%"/>
				    <col width="8%"/>
				</colgroup>
                <thead>
                    <tr>
                        <td>도서관</td>
                        <td>평일 이용시간</td>
                        <td>주말 이용시간</td>
                        <td>휴관일</td>
                        <td>비고</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td> 중앙도서관</td>
                        <td>09:00 - 21:00</td>
                        <td>09:00 - 18:00</td>
                        <td>매달 홀수주 월요일</td>
                        <td>-</td>
                    </tr>
                    <tr>
                        <td>쌍용도서관</td>
                        <td>09:00 - 21:00</td>
                        <td>09:00 - 17:00</td>
                        <td>매달 짝수주 월요일</td>
                        <td>-</td>
                    </tr>
                    <tr>
                        <td>두정도서관</td>
                        <td>09:00 - 21:00</td>
                        <td>09:00 - 17:00</td>
                        <td>매달 홀수주 월요일</td>
                        <td>-</td>
                    </tr>
                    <tr>
                        <td>신방도서관</td>
                        <td>09:00 - 20:00</td>
                        <td>09:00 - 17:00</td>
                        <td>매달 짝수주 화요일</td>
                        <td>-</td>
                    </tr>
                    <tr>
                        <td>청수도서관</td>
                        <td>09:00 - 22:00</td>
                        <td>09:00 - 18:00</td>
                        <td>매달 짝수주 화요일</td>
                        <td>-</td>
                    </tr>
                  
                </tbody>

            </table>
        </div>

    </div>
    <script src="../assets/js/info/user_notice.js"></script>
</body>
</html>
