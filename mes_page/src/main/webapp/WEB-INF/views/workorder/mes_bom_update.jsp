<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link href="./assets/css/admin_table.css" rel="stylesheet">
<link href="./assets/css/00.user_side_base.css" rel="stylesheet">
<link href="./assets/css/admin.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script src="./assets/js/click.js"></script>
<link href="./assets/css/mes_workorder.css" rel="stylesheet">
<link href="./assets/css/click.css" rel="stylesheet">

</head>

<body>
	<link rel="stylesheet"
		href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

	
		<aside class="clearfix" id="side">
			<div id="sideleft">
				<h2 id="title">생산 관리</h2>
				<div id="items">
					<div class="item" id="i2">
						<span>작업지시서</span> <span class="material-symbols-outlined active"
							style="background-color: rgb(255, 255, 255)">arrow_forward_ios</span>
					</div>
					<div class="item" id="i1">
						<span>BOM</span> <span class="material-symbols-outlined"
							style="background-color: rgb(165, 224, 144)">arrow_forward_ios</span>
					</div>
				</div>
			</div>
		</aside>
		<script src="../assets/js/my/mypage.js"></script>
		<section>
			<div class="main_page" id="main_page_1">
				<h3>보유 도서 목록</h3>
				<div>
					<div class="page_2">
						<table id="main_library2">
							<thead>
								<tr>
									<th>부품번호</th>
									<th class="sortable">도서명</th>
									<th>도서 코드</th>
									<th>저자</th>
									<th>출판사</th>
									<th>수량</th>
									<th>보관 위치</th>
								</tr>
							</thead>
							<!-- 여기에 데이터 -->
							<tbody>
								<c:forEach var="mesbook" items="${mesBook}">
									<tr>
										<td><select name="mes_book_code">
												<c:forEach var="code" items="${mes_book_code}">
													<option value="${code}">${code}</option>
												</c:forEach>
										</select></td>
										<td class="sortable">${mesbook.book_name }</td>
										<td>${mesbook.book_isbn }</td>
										<td>${mesbook.book_author }</td>
										<td>${mesbook.book_pub }</td>
										<td>${mesbook.book_count }</td>
										<td>${mesbook.wh_code }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>


					<form id="postForm" method="post" action="bomupdate">
						<input type="hidden" value="${mesBook.mes_book_code }"> <input
							type="submit" value="수정하기">
					</form>


				</div>
			</div>
		</section>

</body>
</html>