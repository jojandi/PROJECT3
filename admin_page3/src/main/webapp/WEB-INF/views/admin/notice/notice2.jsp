<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link href="../assets/css/noti/noti2.css" rel="stylesheet">
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
	/*     text-align: left; */
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
				<c:forEach var="notice" items="${notices}">
					<tr>
						<td>${notice.ann_seq}</td>
						<td>${notice.class_id}</td>
						<td><a
							href="http://localhost:8080/admin_page/admin/notice3?ann_seq=${notice.ann_seq}">${notice.ann_title}</a></td>
						<td>${notice.ann_regi}</td>
						<td>${notice.ann_check}</td>
						<%--                     <td>${notice.ann_detail}</td> --%>
						<td>${notice.ann_attach}</td>
						<td>
							<form action="${pageContext.request.contextPath}/notice/delete"
								method="post" onsubmit="return confirm('정말로 삭제하시겠습니까?');">

								<input type="hidden" name="ann_seq" value="${notice.ann_seq}" />
								<button type="submit">삭제</button>
							</form>
						</td>
						<td>
							<form action="${pageContext.request.contextPath}/notice/update"
								method="post" onsubmit="return confirm('정말로 삭제하시겠습니까?');">

								<input type="hidden" name="ann_seq" value="${notice.ann_seq}" />
								<button type="submit">수정</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</section>
</body>
</html>
