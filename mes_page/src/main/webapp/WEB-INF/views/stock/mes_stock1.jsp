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
<title>재고 관리</title>
<link href="./assets/css/admin_table.css" rel="stylesheet">
<link href="./assets/css/00.user_side_base.css" rel="stylesheet">
<link href="./assets/css/admin.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link href="./assets/css/click.css" rel="stylesheet">
<link href="./assets/css/mes_stock.css" rel="stylesheet">

<!-- <script src="./assets/js/admin_stock.js"></script> -->
<script src="./assets/js/mes_stock_search.js"></script>
</head>
<body>
	<section>
			<div class="main_page" id="main_page_1">
				<h3>재고 현황</h3>
				<div>
					<div class="bot_btn">
						<div class="search-container">
							<input type="text" id="searchBom" placeholder="제품명 검색...">
						</div>
					</div>
					<div class="page_2">
						<table id="main_library">
							<colgroup>
								<col width="3%">
								<col width="20%">
								<col width="7%">
								<col width="8%">
								<col width="8%">
							</colgroup>
							<thead>
								<tr>
									<th>제품 코드</th>
									<th class="sortable">제품명</th>
									<th>재고 수량</th>
									<th>보관 위치</th>
									<th>비고</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="StockList1" items="${StockList1}">
									<tr>
										<td>${StockList1.bom_code }</td>
										<td class="sortable">${StockList1.bom_name }</td>
										<td>${StockList1.pd_count }</td>
										<td>${StockList1.wh_name }</td>
										<td>${StockList1.pd_note }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

				</div>
			</div>
		</section>
</body>
</html>