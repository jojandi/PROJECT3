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
#modalUpdateButton {
    width: 100px;
}

#movepage {
    text-align: center;
    margin-top: 20px;
}

#page {
    margin: 0 5px;
    text-decoration: none;
    color: black;
}

#page.strong {
    font-weight: bold;
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
                        <c:if test="${notice.class_id eq 5001}">
                            <td>공지</td>
                        </c:if>
                        <c:if test="${notice.class_id eq 5002}">
                            <td>안내</td>
                        </c:if>

                        <c:if test="${notice.lib_id eq 7000}">
                            <td>두정도서관</td>
                        </c:if>
                        <c:if test="${notice.lib_id eq 7001}">
                            <td>신방도서관</td>
                        </c:if>
                        <c:if test="${notice.lib_id eq 7002}">
                            <td>쌍용도서관</td>
                        </c:if>
                        <c:if test="${notice.lib_id eq 7003}">
                            <td>중앙도서관</td>
                        </c:if>
                        <c:if test="${notice.lib_id eq 7004}">
                            <td>청수도서관</td>
                        </c:if>
                        <td><a href="notice3_${notice.ann_seq}">${notice.ann_title}</a></td>
                        <td>${notice.ann_regi}</td>
                        <td>${notice.ann_check}</td>
                        <td>${notice.ann_attach}</td>
                        <td>
                            <button type="button" onclick="deleteNotice(${notice.ann_seq})">삭제</button>
                        </td>
                        <td>
                            <button type="button" onclick="updateNotice(
                                ${notice.ann_seq}, '${notice.class_id}', '${notice.lib_id}', 
                                '${notice.ann_title}', '${notice.ann_regi}', 
                                '${notice.ann_check}', '${notice.ann_attach}')">수정</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- 페이징 처리를 위한 코드 추가 -->
        <%
        Map map = (Map) request.getAttribute("map");
        System.out.println("totalCount : " + map.get("totalCount"));
        int totalCount = Integer.parseInt(map.get("totalCount").toString());

        System.out.println("countPerPage : " + request.getAttribute("countPerPage"));
        System.out.println("page : " + request.getAttribute("page"));

        String str_countPerPage = request.getAttribute("countPerPage").toString();
        int countPerPage = Integer.parseInt(str_countPerPage);

        String str_pageNo = request.getAttribute("page").toString();
        int pageNo = Integer.parseInt(str_pageNo);

        int lastPage = (int) Math.ceil((double) totalCount / countPerPage);
        int countPerSection = 3;
        int position = (int) Math.ceil((double) pageNo / countPerSection);

        int sec_first = ((position - 1) * countPerSection) + 1;
        int sec_last = position * countPerSection;

        if (sec_last > lastPage) {
            sec_last = lastPage;
        }
        %>

        <c:set var="lastPage" value="<%=lastPage%>" />

        <div id="movepage">
            <c:if test="<%=sec_first == 1%>">
                <span class="material-symbols-outlined">chevron_left</span>
            </c:if>
            <c:if test="<%=sec_first != 1%>">
                <span class="material-symbols-outlined">
                    <a href="notice2?page=<%=sec_first - 1%>">chevron_left</a>
                </span>
            </c:if>

            <c:forEach var="i" begin="<%=sec_first%>" end="<%=sec_last%>">
                <c:if test="${i eq param.page}">
                    <a href="notice2?page=${i}&keyword=${param.keyword}" id="page" class="strong"><strong>${i}</strong></a>
                </c:if>
                <c:if test="${i != param.page}">
                    <a href="notice2?page=${i}&keyword=${param.keyword}" id="page" class="chap">${i}</a>
                </c:if>
            </c:forEach>

            <c:if test="<%=sec_last == lastPage%>">
                <span class="material-symbols-outlined">chevron_right</span>
            </c:if>
            <c:if test="<%=sec_last != lastPage%>">
                <span class="material-symbols-outlined">
                    <a href="notice2?page=<%=sec_last + 1%>">chevron_right</a>
                </span>
            </c:if>
        </div>
    </section>

    <!-- JavaScript 함수들 (삭제 및 수정) -->
    <script>
        function deleteNotice(ann_seq) {
            if (confirm('정말로 삭제하시겠습니까?')) {
                const url = "${pageContext.request.contextPath}/notice2";
                const param = { "ann_seq": ann_seq };
                ajax(url, param, function(response) {
                    alert("공지사항이 삭제되었습니다.");
                    location.reload();
                }, "DELETE");
            }
        }

        function updateNotice(ann_seq, class_id, lib_id, title, regi, check, attach) {
            const modal = document.getElementById("updateModal");
            modal.style.display = "block";

            document.getElementById("modalAnnSeq").value = ann_seq;
            document.getElementById("modalClassId").value = class_id;
            document.getElementById("modalLibId").value = lib_id;
            document.getElementById("modalAnnTitle").value = title;
            document.getElementById("modalAnnRegi").value = regi;
            document.getElementById("modalAnnCheck").value = check;
            document.getElementById("modalAnnAttach").value = attach;

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

                const url = "${pageContext.request.contextPath}/notice2";

                ajax(url, updatedData, function(response) {
                    alert("공지사항이 수정되었습니다.");
                    modal.style.display = "none";
                    location.reload();
                }, "PUT");
            };
        }

        const modal = document.getElementById("updateModal");
        const closeBtn = document.getElementsByClassName("close")[0];

        closeBtn.onclick = function() {
            modal.style.display = "none";
        };

        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        };

        function ajax(url, param, cb, method) {
            if (!method) method = "GET";
            const xhr = new XMLHttpRequest();
            xhr.open(method, url);
            xhr.setRequestHeader("Content-Type", "application/json");
            const strData = JSON.stringify(param);
            xhr.send(strData);

            if (typeof cb === "function") {
                xhr.onload = function() {
                    cb(xhr.responseText);
                };
            }
        }
    </script>
</body>
</html>
