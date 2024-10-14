<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link href="./assets/css/notice/noti2.css" rel="stylesheet">
<meta charset="UTF-8">
<title>공지사항 게시판</title>
<style>
aside #items #i3 .material-symbols-outlined {
    background-color: rgb(165, 224, 144);
}

h1 {
    border: 1px solid #ccc;
    width: 100%;
    text-align: center;
    font-size: 22px;
    padding: 17px;
    box-sizing: border-box;
}

section h1 {
    border: 1px solid #ccc;
    width: 100%;
    text-align: center;
    font-size: 22px;
    padding: 17px;
    box-sizing: border-box;
}

th, td {
    padding: 12px;
    border-bottom: 1px solid #ddd;
}

button {
    width: 50px;
}

/* 모달창 스타일 */
.modal {
    display: none;
    position: fixed;
    z-index: 1;
    padding-top: 100px;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
}

.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 40%;
    text-align: center;
}

.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
    cursor: pointer;
}

.close:hover, .close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}

input[type="text"] {
    width: 50%;
    padding: 10px;
    margin: 10px 0;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

label {
    color: black; 
    font-size: 16px; 
    display: block; 
    margin-bottom: 5px; 
    
    }
    #modalUpdateButton{
    width : 100px;
    }
}
</style>
</head>
<body>
    <section>
        <h1>공지사항 게시판</h1>

        <table>
            <thead>
                <tr>
                    <th>번호</th>
                    <th>분류 ID</th>
                    <th>도서관</th>
                    <th>제목</th>
                    <th>등록일</th>
                    <th>조회수</th>
                    <th>첨부파일</th>
                    <th>삭제</th>
                    <th>수정</th>
                </tr>
            </thead>
            <tbody>
                <!-- 공지사항 목록을 동적으로 표시 -->
                <c:forEach var="notice" items="${noticeList}">
                    <tr>
                        <td>${notice.ann_seq}</td>
                        <!-- 공지사항 번호 -->
                        <td>${notice.class_id}</td>
                        <!-- 분류 ID -->
                        <c:if test = "${notice.lib_id eq 7000}" >
                        <td>두정도서관</td>
                        </c:if>
                        <c:if test = "${notice.lib_id eq 7001}" >
                        <td>신방도서관</td>
                        </c:if>
                        <c:if test = "${notice.lib_id eq 7002}" >
                        <td>쌍용도서관</td>
                        </c:if>
                        <c:if test = "${notice.lib_id eq 7003}" >
                        <td>중앙도서관</td>
                        </c:if>
                        <c:if test = "${notice.lib_id eq 7004}" >
                        <td>청수도서관</td>
                        </c:if>
                        <!-- 도서관 -->
                        <td><a href="notice3_${notice.ann_seq}">${notice.ann_title}</a></td>
                        <!-- 제목 클릭하면 세부 정보로 이동 -->
                        <td>${notice.ann_regi}</td>
                        <!-- 등록일 -->
                        <td>${notice.ann_check}</td>
                        <!-- 조회수 -->
                        <td>${notice.ann_attach}</td>
                        <!-- 첨부파일 -->
                        <td>
                            <!-- Ajax로 삭제 요청 전송 -->
                            <button type="button" onclick="deleteNotice(${notice.ann_seq})">삭제</button>
                        </td>
                        <td>
                            <!-- 모달창을 이용한 수정 요청 -->
                            <button type="button" onclick="updateNotice(
                                ${notice.ann_seq}, '${notice.class_id}', '${notice.lib_id}', 
                                '${notice.ann_title}', '${notice.ann_regi}', 
                                '${notice.ann_check}', '${notice.ann_attach}')">수정</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </section>

    <!-- 수정 모달창 HTML -->
    <div id="updateModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>공지사항 수정</h2>
            <form id="updateForm">
                <input type="hidden" id="modalAnnSeq" />
                <label for="modalClassId">분류 ID</label>
                <input type="text" id="modalClassId" />
                <label for="modalLibId">도서관</label>
                <input type="text" id="modalLibId" />
                <label for="modalAnnTitle">제목</label>
                <input type="text" id="modalAnnTitle" />
                <label for="modalAnnRegi">등록일</label>
                <input type="text" id="modalAnnAttach" /><br>
                <button type="button" id="modalUpdateButton">수정하기</button>
            </form>
        </div>
    </div>

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

        // 공지사항 수정용 모달창 열기 함수
        function updateNotice(ann_seq, class_id, lib_id, title, regi, check, attach) {
            // 모달창 열기
            const modal = document.getElementById("updateModal");
            modal.style.display = "block";

            // 모달창에 기존 데이터 설정
            document.getElementById("modalAnnSeq").value = ann_seq; // 공지사항 번호
            document.getElementById("modalClassId").value = class_id; // 분류 ID
            document.getElementById("modalLibId").value = lib_id; // 도서관
            document.getElementById("modalAnnTitle").value = title; // 제목
            document.getElementById("modalAnnRegi").value = regi; // 등록일
            document.getElementById("modalAnnCheck").value = check; // 조회수
            document.getElementById("modalAnnAttach").value = attach; // 첨부파일

            // 수정 버튼 클릭 이벤트 등록
            document.getElementById("modalUpdateButton").onclick = function() {
                const updatedData = {
                    ann_seq: ann_seq,
                    class_id: document.getElementById("modalClassId").value,
                    lib_id: document.getElementById("modalLibId").value,
                    ann_title: document.getElementById("modalAnnTitle").value,
                    ann_regi: document.getElementById("modalAnnRegi").value,
                    ann_check: document.getElementById("modalAnnCheck").value,
                    ann_attach: document.getElementById("modalAnnAttach").value
                };

                const url = "${pageContext.request.contextPath}/notice2"; // 수정 URL

                ajax(url, updatedData, function(response) {
                    alert("공지사항이 수정되었습니다.");
                    modal.style.display = "none"; // 수정 후 모달창 닫기
                    location.reload(); // 페이지 새로고침
                }, "PUT"); // PUT 메서드로 호출
            };
        }

        // 모달창 닫기 이벤트
        const modal = document.getElementById("updateModal");
        const closeBtn = document.getElementsByClassName("close")[0];

        // 'X' 버튼을 누르면 모달창 닫기
        closeBtn.onclick = function() {
            modal.style.display = "none";
        };

        // 모달창 외부를 클릭하면 닫기
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        };

        // 공통 Ajax 실행 함수
        function ajax(url, param, cb, method) {
            if (!method) method = "GET"; // 기본값 설정
            const xhr = new XMLHttpRequest();
            xhr.open(method, url);
            xhr.setRequestHeader("Content-Type", "application/json");
            const strData = JSON.stringify(param);
            console.log("strData : " + strData);
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
