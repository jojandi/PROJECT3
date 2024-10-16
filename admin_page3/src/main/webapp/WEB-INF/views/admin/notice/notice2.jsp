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
header #menu #items #i2 {
    font-weight: 900;
    text-decoration: underline;
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
				<col width="25%">
				<col width="10%">
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
                        <!-- 조회수 -->
                        <td>${notice.ann_check}</td>
                        <td>
                            <!-- Ajax로 삭제 요청 전송 -->
                            <button type="button" onclick="deleteNotice(${notice.ann_seq})">삭제</button>
                        </td>
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

        // 공지사항 수정용 모달창 열기 함수
        function updateNotice(ann_seq, class_id, lib_id, title, regi, check, attach) {
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
