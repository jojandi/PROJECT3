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
						<td>${notice.lib_id}</td>
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
							<!-- Ajax로 수정 요청 전송 -->
							<button type="button" onclick="updateNotice(${notice.ann_seq}, '${notice.ann_title}')">수정</button>
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

		// 공지사항 수정용 Ajax 함수
 		function updateNotice(ann_seq, currentTitle) {
			// 새로운 제목을 입력받는 prompt 창 표시
			const newTitle = prompt('새로운 제목을 입력하세요:', currentTitle);
			if (newTitle && newTitle !== currentTitle) {
				const url = "${pageContext.request.contextPath}/notice2"; // 수정 URL
				const param = { "ann_seq": ann_seq, "ann_title": newTitle }; // 수정할 공지사항 번호 및 새 제목
				ajax(url, param, function(response) {
					alert("공지사항이 수정되었습니다.");
					location.reload(); // 수정 후 페이지 리로드
				}, "PUT"); // PUT 메서드로 호출
			}
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
