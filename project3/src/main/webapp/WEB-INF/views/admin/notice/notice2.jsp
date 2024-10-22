<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link href="../assets/css/notice/noti2.css" rel="stylesheet">
<meta charset="UTF-8">
<title>공지사항 게시판</title>
<style>
/* 기존 스타일 유지 */
aside #items #i2.material-symbols-outlined {
    background: rgb(165, 224, 144);
}
</style>
</head>
<body>
    <section>
        <h1>공지사항 게시판</h1>

        <table>
            <colgroup>
                <col width="6%">
                <col width="6%">
                <col width="12%">
                <col width="30%">
                <col width="12%">
                <col width="6%">
                <col width="7%">
                <col width="7%">
            </colgroup>
            <thead>
                <tr>
                    <td>번호</td>
                    <td>분류</td>
                    <td>도서관</td>
                    <td>제목</td>
                    <td>등록일</td>
                    <td>파일</td>
                    <td>조회수</td>
                    <td>삭제</td>
                    <td>수정</td>
                </tr>
            </thead>
            <tbody>
                <!-- 공지사항 목록을 동적으로 표시 -->
                <c:forEach var="notice" items="${noticeList}">
                    <tr>
                        <!-- 공지사항 번호 -->
                        <td>${notice.ann_seq}</td>
                        <c:if test="${notice.class_id eq 5001}">
                            <td>공지</td>
                        </c:if>
                        <c:if test="${notice.class_id eq 5002}">
                            <td>안내</td>
                        </c:if>
                        
                        <td>${notice.lib_name}</td>
                        <!-- 제목 클릭하면 세부 정보로 이동 -->
                        <td class="bname"><a href="notice3_${notice.ann_seq}">${notice.ann_title}</a></td>
                        <!-- 등록일 -->
                        <td>${notice.ann_regi}</td>

                        <!-- 파일 첨부 -->
                        <td>
                            <c:choose>
                                <c:when test="${notice.ann_attach != null}">
                                    <a target="_blank" class="fileDown"
                                    href="download?fileName=${notice.ann_attach}">
                                    O
                                    </a>
<%--                                    <img src="http://localhost:8080/admin/download?fileName=${notice.ann_attach}"/> --%>
                                </c:when>
                                <c:otherwise>
                                    X
                                </c:otherwise>
                            </c:choose>
                        </td>

                        <!-- 조회수 -->
                        <td>${notice.ann_check}</td>

                        <!-- 삭제 버튼 -->
                        <td>
                            <button type="button" onclick="deleteNotice(${notice.ann_seq})">삭제</button>
                        </td>

                        <!-- 수정 버튼 -->
                        <td>
                            <a href="notice_${notice.ann_seq}?cmd=edit">
                                <button type="button">수정</button>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </section>
    
    <script>
        // 공지사항 삭제용 Ajax 함수
        function deleteNotice(ann_seq) {
            if (confirm('정말로 삭제하시겠습니까?')) {
                const url = "${pageContext.request.contextPath}/notice2"; // 삭제 URL
                const param = { "ann_seq": ann_seq }; // 삭제할 공지사항 번호
                ajax(url, param, function(response) {
                    alert("공지사항이 삭제되었습니다.");
                    location.reload(); // 삭제 후 페이지 리로드
                }, "DELETE"); // DELETE 메서드로 호출
            }
        }

        // 공통 Ajax 실행 함수
        function ajax(url, param, cb, method) {
            if (!method) method = "GET"; // 기본값 설정
            const xhr = new XMLHttpRequest();
            xhr.open(method, url);
            xhr.setRequestHeader("Content-Type", "application/json");
            const strData = JSON.stringify(param);
            xhr.send(strData); // 최종 전송

            if (typeof cb === "function") {
                xhr.onload = function() {
                    cb(xhr.responseText); // 콜백 함수로 응답 처리
                };
            }
        }
    </script>
</body>
</html>
