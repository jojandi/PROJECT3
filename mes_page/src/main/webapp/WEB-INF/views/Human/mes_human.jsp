<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>직원 관리</title>

    <link href="./assets/css/00.user_side_base.css" rel="stylesheet">
    <link href="./assets/css/admin.css" rel="stylesheet">
    <link href="./assets/css/mes_human.css" rel="stylesheet">
    <link href="./assets/css/admin_table.css" rel="stylesheet">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <style>
        /* -------------------------------관리자 직원관리------------------------------ */
        #menu #items #i4 {
            font-weight: 901;
            text-decoration: underline;
        }

        #i_1 {
            background-color: rgb(165, 224, 144);
        }

        .clickable {
            cursor: pointer;
            color: blue;
            text-decoration: underline;
        }

        /* ------------------------------------------------------------------ */
    </style>
</head>

<body>
    <!-- 페이지 시작 -->
    <section>
        <div class="main_page" id="main_page_1">
            <h3>직원관리</h3>
            <div>
                <div class="bot_btn">
                    <div class="search-container">
                        <input type="text" id="searchInput" placeholder="사원 검색...">
                        <!-- <input type="button" value="Excel 파일화"> -->
                    </div>
                </div>
                <div class="page_2">
                    <table id="main_library">
                        <colgroup>
                            <col width="7%">
                            <col width="8%">
                            <col width="11%">
                            <col width="8%">
                            <col width="16%">
                            <col width="21%">
                            <col width="20%">
                        </colgroup>
                        <thead>
                            <tr>
                                <th class="sortable">사원번호</th>
                                <th>이름</th>
                                <th>직급</th>
                                <th>부서</th>
                                <th>전화번호</th>
                                <th>주소</th>
                                <th>입사일</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="dto" items="${list}">
                                <tr>
                                    <td>${dto.emp_id}</td>
                                    <td><a href="http://localhost:8080/mesPage/mes_read?emp_id=${dto.emp_id}">${dto.emp_name}</a></td>
                                    <td>${dto.po_name}</td>
                                    <td>${dto.dept_name}</td>
                                    <td>${dto.emp_hp}</td>
                                    <td>${dto.emp_add}</td>
                                    <td>${dto.emp_hiredate}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="text_right">
                    <input id="openForm" type="button" value="직원추가">
                </div>
            </div>
        </div>

        <!-- 직원 추가 모달 -->
        <div id="formModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <form id="workForm" method="post" action="mes_human/insert">
                    <table>
                        <tr>
                            <th colspan="2">사원 추가</th>
                        </tr>
                        <tr>
                            <td>이름</td>
                            <td><input type="text" name="emp_name"></td>
                        </tr>
                        <tr>
                            <td>직급</td>
                            <td>
                                <select name="po_name">
                                    <option value="전임">전임</option>
                                    <option value="선임">선임</option>
                                    <option value="책임">책임</option>
                                    <option value="사장">사장</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>부서</td>
                            <td>
                                <select name="dept_name">
                                    <option value="생산팀">생산팀</option>
                                    <option value="영업팀">영업팀</option>
                                    <option value="인사팀">인사팀</option>
                                    <option value="재고관리팀">재고관리팀</option>
                                    <option value="환경관리팀">환경관리팀</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>전화번호</td>
                            <td><input type="text" name="emp_hp"></td>
                        </tr>
                        <tr>
                            <td>주소</td>
                            <td><input type="text" name="emp_add"></td>
                        </tr>
                        <tr>
                            <td>입사일</td>
                            <td><input name="emp_hiredate" type="date"></td>
                        </tr>
                    </table>
                    <input id="workFormBtn" type="submit" value="등록하기">
                </form>
            </div>
        </div>
    </section>

    <!-- 자바스크립트 영역 -->
    <script>
        // 모달 열기
        var modal = document.getElementById("formModal");
        var btn = document.getElementById("openForm");
        var span = document.getElementsByClassName("close")[0];

        btn.onclick = function () {
            modal.style.display = "block";
        }

        // 모달 닫기
        span.onclick = function () {
            modal.style.display = "none";
        }

        // 모달 외부 클릭 시 닫기
        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>
</body>

</html>
