<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%-- <%@ page import="mes_DTO.MesStockDTO"%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보유 도서 목록</title>
<link href="./assets/css/admin_table.css" rel="stylesheet">
<link href="./assets/css/00.user_side_base.css" rel="stylesheet">
<link href="./assets/css/admin.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<!-- <link href="./assets/css/click.css" rel="stylesheet"> -->
<link href="./assets/css/mes_stock.css" rel="stylesheet">

<!-- <script src="./assets/js/admin_stock.js"></script> -->
<script src="./assets/js/mes_stock_search.js"></script>
<style>
	#i2 .material-symbols-outlined {
		background-color: rgb(165, 224, 144);
	}
</style>

</head>
<body>
	<section>
			

			<div class="main_page" id="main_page_1">
				<h3>보유 도서 목록</h3>
				<div>
					<div class="bot_btn">
						<div class="search-container">
							<input type="text" id="searchInput" placeholder="도서명 검색...">
						</div>
					</div>
					<div class="page_2">
						<table id="main_library">
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
								<c:forEach var="StockList2" items="${StockList2}">
									<tr>
										<td>${StockList2.mes_book_code }</td>
										<td class="sortable">${StockList2.book_name }</td>
										<td>${StockList2.book_isbn }</td>
										<td>${StockList2.book_author }</td>
										<td>${StockList2.book_pub }</td>
										<td>${StockList2.book_count }</td>
										<td>${StockList2.wh_code }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- 보유도서 페이징 -->
<%-- 						<% --%>
<!--  						Map map = (Map) request.getAttribute("map"); -->
<!--  						int totalCount = (int) map.get("totalCount"); -->

<!--  						String str_countPerPage = (String) request.getAttribute("countPerPage"); -->
<!-- 					int countPerPage = Integer.parseInt(str_countPerPage); -->

<!-- 						String str_pageNo = (String) request.getAttribute("page"); -->
<!-- 					int pageNo = Integer.parseInt(str_pageNo); -->

<!-- 						int lastPage = (int) Math.ceil((double) totalCount / countPerPage); -->

<!-- 						// 한번에 보여줄 페이지의 개수 -->
<!-- 						int countPerSection = 3; -->
<!--  						// 페이지 섹션 위치 -->
<!-- 						int position = (int) Math.ceil((double) pageNo / countPerSection); -->
<!--  						int sec_first = ((position - 1) * countPerSection) + 1; -->
<!--  						int sec_last = position * countPerSection; -->
<!--  						if (sec_last > lastPage) { -->
<!--  							sec_last = lastPage; -->
<!--  						} -->
<%--  						%>  --%>
<%-- 						<c:set var="lastPage2" value="<%=lastPage%>" scope='page' /> --%>

<%-- 						<c:if test="<%=sec_first == 1%>"> --%>
<!-- 					      &lt; -->
<%-- 					   	</c:if> --%>
<%-- 						<c:if test="<%=sec_first != 1%>"> --%>
<%-- 							<a href="stock?page=<%=sec_first - 1%>">&lt;</a> --%>
<%-- 						</c:if> --%>

<%-- 						<c:forEach var="i" begin="<%=sec_first%>" end="<%=sec_last%>"> --%>
<%-- 							<c:if test="${i eq page}"> [<a href="stock?page=${i}&mainPage=2"><strong>${ i }</strong></a>] </c:if> --%>
<%-- 							<c:if test="${i != page}">[<a href="stock?page=${i}&mainPage=2">${ i }</a>]</c:if> --%>
<%-- 						</c:forEach> --%>

<%-- 						<c:if test="<%=sec_last == lastPage%>"> --%>
<!-- 						  &gt; -->
<%-- 					    </c:if> --%>
<%-- 						<c:if test="<%=sec_last != lastPage%>"> --%>
<%-- 							<a href="stock?page=<%=sec_last + 1%>">&gt;</a> --%>
<%-- 						</c:if> --%>
<!-- 						여기까지 페이징 -->
				</div>
			</div>
		</section>
</body>
</html>