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
				<div id="bookAdd">
						<input type="button" value="도서 추가" class="addBnt">
					</div>
				<div>
					<div class="page_2">
						<table id="main_library">
							<colgroup>
								<col width="5%">
								<col width="25%">
								<col width="12%">
								<col width="8%">
								<col width="12%">
								<col width="8%">
								<col width="8%">
								<col width="8%">
							</colgroup>
							<thead>
								<tr>
									<th><input type="checkbox" id="p1_checkAll"></th>
									<th class="sortable">도서명</th>
									<th>저자명</th>
									<th>출판사</th>
									<th>ISBN</th>
									<th>도서코드</th>
									<th>대출</th>
									<th>예약</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="list" items="${map.list}">
									<tr>
										<td><input type="checkbox" class="p1_main_chack"></td>
										<td class="bname"><a
											href="inventory_?isbn=${list.book_ISBN}">${list.book_name}</a>
										</td>
										<td>${list.book_author}</td>
										<td>${list.book_pub}</td>
										<td>${list.book_ISBN}</td>
										<td>${list.book_code}</td>
										<td><c:if test="${list.book_loan == false}">
	                                    		-
	                                    	</c:if> <c:if
												test="${list.book_loan == true}">
												<a href="loan_read">대출중</a>
	                                    	</c:if></td>
										<td><c:if test="${list.book_res == false}">
	                                    		-
	                                    	</c:if> <c:if
												test="${list.book_res == true}">
												<a href="reservation_read">예약중</a>
	                                    	</c:if></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="bot_btn">
						<form method="get" action="inventory">
							<div class="search-container">
								<input type="text" id="searchInput" name="text"
									placeholder="도서명"> <input type="submit" value="검색">
							</div>
						</form>
					</div>
				</div>
			</div>

			<div class="popup">
				<div class="close">
					<span class="popup-close">&times;</span>
				</div>
				<table>
					<colgroup>
						<col width="15%">
						<col width="25%">
						<col width="15%">
						<col width="20%">
						<col width="10%">
					</colgroup>
					<thead>
						<tr>
							<th></th>
							<th>도서명</th>
							<th>ISBN</th>
							<th>출판사</th>
							<th>수량</th>
							<th>대출횟수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="img"><img src="${dto.book_img}"
								alt="${dto.book_name}의 책표지"></td>
							<td>${dto.book_name}</td>
							<td>${dto.book_ISBN}</td>
							<td>${dto.book_pub}</td>
							<td>${dto.count}</td>
							<td>${dto.book_loan_seq}</td>
						</tr>

					</tbody>
				</table>

			</div>
			
			<div class="insert">
				<div class="close">
					<span class="popup-close insert-close">&times;</span>
				</div>
				<form method="post" action="inventory">
				<table>
					<tr>
						<th>책 표지 URL</th>
						<td><input type="text" name="img"></td>
					</tr>
					<tr>
						<th>ISBN</th>
						<td><input type="text" name="isbn"></td>
					</tr>
					<tr>
						<th>도서명</th>
						<td><input type="text" name="name"></td>
					</tr>
					<tr>
						<th>출판사</th>
						<td><input type="text" name="pub"></td>
					</tr>
					<tr>
						<th>저자</th>
						<td><input type="text" name="athour"></td>
					</tr>
					<tr>
						<th>기본 정보</th>
						<td><input type="text" name="info"></td>
					</tr>
				</table>
					<div id="submit">
						<input type="submit" value="추가하기">
					</div>
				</form>

			</div>

			<%-- <%
			Map map = (Map) request.getAttribute("map");
			int totalCount = (int) map.get("totalCount");

			String str_countPerPage = (String) request.getAttribute("countPerPage");
			int countPerPage = Integer.parseInt(str_countPerPage);

			String str_pageNo = (String) request.getAttribute("page");
			int pageNo = Integer.parseInt(str_pageNo);

			// 마지막 페이지 구하기 -> 전체 페이지수 / 페이지당 개수 -> 올림처리
			int lastPage = (int) Math.ceil((double) totalCount / countPerPage);

			int countPerSection = 5; // 한 번에 보여줄 페이지의 개수
			// 몇 번째 섹션인지 -> 현재페이지 / 한 번에 보여줄 페이지의 개수 -> 올림처리
			int position = (int) Math.ceil((double) pageNo / countPerSection);

			int sec_first = ((position - 1) * countPerSection) + 1; // 섹션의 첫 번째 페이지
			int sec_last = position * countPerSection; // 섹션으 마지막 페이지

			// 마지막 페이지 이상으로 더이상 페이지가 나오지 않게 설계
			if (sec_last > lastPage) {
				sec_last = lastPage;
			}
			%>
			<!-- 자바영역의 값 올리기 -->
			<c:set var="lastPage" value="<%=lastPage%>" />

			<div id="movepage">
				<c:if test="<%=sec_first == 1%>">
					<span class="material-symbols-outlined">chevron_left</span>
				</c:if>
				<c:if test="<%=sec_first != 1%>">
					<span class="material-symbols-outlined"> <a
						href="inventory?page=<%=sec_first - 1%>">chevron_left</a>
					</span>
				</c:if>

				<!-- 섹션 내에서의 첫번째 페이지부터 마지막 페이지만 나오게 -->
				<c:forEach var="i" begin="<%=sec_first%>" end="<%=sec_last%>">

					<!-- 페이지 이동, 현재 페이지는 strong 처리 -->
					<c:if test="${i eq param.page}&text=${param.text}">
						<a href="inventory?page=${i}" id="page" class="chap"><strong>${i}</strong></a>
					</c:if>
					<c:if test="${i != param.page}">
						<a href="inventory?page=${i}&text=${param.text}" id="page" class="chap">${i}</a>
					</c:if>

				</c:forEach>

				<c:if test="<%=sec_last == lastPage%>">
					<span class="material-symbols-outlined">chevron_right</span>
				</c:if>
				<c:if test="<%=sec_last != lastPage%>">
					<span class="material-symbols-outlined"> <a
						href="inventory?page=<%=sec_last + 1%>">chevron_right</a>
					</span>
				</c:if>
			</div> --%>

		</section>
		<script src="../assets/js/inven/inven_popup.js"></script>
</body>
</html>