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
<title>도서 발주</title>
<link href="./assets/css/admin_table.css" rel="stylesheet">
<link href="./assets/css/00.user_side_base.css" rel="stylesheet">
<link href="./assets/css/admin.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<!-- <link href="./assets/css/click.css" rel="stylesheet"> -->
<link href="./assets/css/mes_stock.css" rel="stylesheet">

<!-- <script src="./assets/js/admin_stock.js"></script> -->
<script src="./assets/js/mes_stock.js"></script>
<script src="./assets/js/mes_stock_search.js"></script>

<style>
	#i3 .material-symbols-outlined {
		background-color: rgb(165, 224, 144);
	}
</style>

</head>
<body>
	<section>

			<div class="main_page" id="main_page_1">
				<h3>도서 발주</h3>
				<div>
					<div class="table_wrap">
						<div class="page_2">
							<table id="main_library">
								<thead>
									<tr>
										<th class="sortable">부품코드</th>
										<th>발주ID</th>
										<th>구매처</th>
										<th>발주상태</th>
										<th>담당자</th>
										<th>발주일</th>
										<th></th>
									</tr>
								</thead>
								<tbody class="main_tbody">
									<c:forEach var="StockList3" items="${StockList3}">
										<tr>
											<td class="sortable">${StockList3.mes_book_code }</td>
											<td>${StockList3.order_id }</td>
											<td>${StockList3.pub_name }</td>
											<td>${StockList3.order_st }</td>
											<td>${StockList3.emp_name }</td>
											<td>${StockList3.order_date }</td>
											<td>
												<form method="get" action="stock_update">
													<input type="hidden" name="order_ID"
														value="${StockList3.order_id }"> <input
														type="submit" value="수정">
												</form>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

						</div>
						<div class="text_right">
							<input id="openForm1" type="button" value="발주">
						</div>
						<!-- <div class="page_1">
                            <h3>도서 구매 내역</h3>
                            <table id="main_library_2">
                                <thead>
                                    <tr>
                                        <th><input type="checkbox" id="p2_checkAll"></th>
                                        <th class="sortable">도서명</th>
                                        <th>저자명</th>
                                        <th>출판사</th>
                                        <th>출판연도</th>
                                        <th>도서코드</th>
                                        <th>발주 권수</th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>

                        </div> -->
					</div>

				</div>
			</div>
			<div id="formModal1" class="modal">
				<!-- 도서 발주 모달 -->
				<div class="modal-content">
					<span class="close1">&times;</span>
					<form id="workForm" method="post" action="mes_stock3">
						<input type="hidden" name="action" value="insert_order">
						<table>
							<tr>
								<th colspan="2">도서 발주</th>
							</tr>
							<tr>
								<td>부품코드</td>
								<td><select name="mes_book_code">
										<c:forEach var="code" items="${mes_book_code}">
											<option value="${code.mes_book_code}">${code.mes_book_code}</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<td>주문개수</td>
								<td><input id="order_count" type="text" name="order_count"></td>
							</tr>
							<tr>
								<td>발주처id</td>
								<td><select name="pub_id">
										<c:forEach var="code" items="${pub_id}">
											<option value="${code.pub_id}">${code.pub_id}</option>
										</c:forEach>
								</select></td>
							</tr>
						</table>
						<input id="workFormBtn" type="submit" value="발주">
					</form>
				</div>
			</div>
			<!-- 			<div id="formModal2" class="modal"> 도서 발주 업데이트 모달 -->
			<!-- 				<div class="modal-content"> -->
			<!-- 					<span class="close2">&times;</span> -->
			<!-- 					<form id="workForm" method="post" action="stockUp"> -->
			<!-- 					<input type="hidden" name="action" value="update_order"> -->
			<!-- 						<table> -->
			<!-- 							<tr> -->
			<!-- 								<th colspan="2">도서 발주</th> -->
			<!-- 							</tr> -->
			<!-- 							<tr> -->
			<!-- 								<td>부품코드</td> -->
			<!-- 								<td></td> -->
			<!-- 							</tr> -->
			<!-- 							<tr> -->
			<!-- 								<td>주문개수</td> -->
			<!-- 								<td></td> -->
			<!-- 							</tr> -->
			<!-- 							<tr> -->
			<!-- 								<td>발주상태</td> -->
			<!-- 								<td></td> -->
			<!-- 							</tr> -->
			<!-- 							<tr> -->
			<!-- 								<td>발주처id</td> -->
			<!-- 								<td></td> -->
			<!-- 							</tr> -->
			<!-- 						</table> -->
			<!-- 						<input id="workFormBtn" type="submit" value="발주"> -->
			<!-- 					</form> -->
			<!-- 				</div> -->
			<!-- 			</div> -->
		</section>
</body>
</html>