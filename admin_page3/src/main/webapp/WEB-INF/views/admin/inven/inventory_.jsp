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
		<div class="main_page" id="main_page_1">
			<h3>실시간 재고 현황</h3>
			<div id="table2">
				<table id="main_library">
					<tr>
						<td rowspan="5" class="img, rigthBorder"><img src="${dto.book_img}"></td>
						<td class="rigthBorder">도서명</td>
						<td>${dto.book_name}</td>
					</tr>
					<tr>
						<td class="rigthBorder">도서관</td>
						<td>${dto.lib_name}</td>
					</tr>
					<tr>
						<td class="rigthBorder">ISBN</td>
						<td>${dto.book_ISBN}</td>
					</tr>
					<tr>
						<td class="rigthBorder">출판사</td>
						<td>${dto.book_pub}</td>
					</tr>
					<tr>
						<td class="rigthBorder">수량</td>
						<td>${dto.count}</td>
					</tr>
				</table>
			</div>
			<div class="bot_btn">
				 <a href="inven?page=${page}">
					 <input type="button" value="목록">
				 </a>
			</div>
		</div>
	</section>
</body>
</html>