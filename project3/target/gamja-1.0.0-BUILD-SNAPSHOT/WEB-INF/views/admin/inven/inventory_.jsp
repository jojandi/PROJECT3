<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고현황</title>
<link href="./assets/css/inven/inven.css" rel="stylesheet">
<style>
aside #items #i1 .material-symbols-outlined {
	background: rgb(165, 224, 144);
}

.popup {
	display: block;
}
</style>
</head>
<body>
	<section>
		<h3>실시간 재고 현황 세부내역</h3>
		<div id="table2">
			<table id="main_library">
				<colgroup>
					<col width="15%">
					<col width="12%">
					<col width="9%">
					<col width="9%">
					<col width="9%">
					<col width="8%">
					<col width="7%">
				</colgroup>
				<thead>
					<tr>
						<th class="img"></th>
						<th class="sortable">도서명</th>
						<th>도서관</th>
						<th>저자명</th>
						<th>출판사</th>
						<th>ISBN</th>
						<th>수량</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><img src="${dto.book_img}"></td>
						<td>${dto.book_name}</td>
						<td>${dto.lib_name}</td>
						<td>${dto.book_author}</td>
						<td>${dto.book_pub}</td>
						<td>${dto.book_ISBN}</td>
						<td>${dto.count}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="bot_btn">
			<c:if test="${empty param.page}">
				<a href="inven">
					<input type="button" value="목록">
				</a>
			</c:if>
			<c:if test="${not empty param.page}">
				<a href="inven?page=${param.page}">
					<input type="button" value="목록">
				</a>
			</c:if>
		</div>
	</section>
</body>
</html>