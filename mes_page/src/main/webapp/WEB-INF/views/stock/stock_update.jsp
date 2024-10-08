<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>재고 관리</title>
<link href="./assets/css/admin_table.css" rel="stylesheet">
<link href="./assets/css/00.user_side_base.css" rel="stylesheet">
<link href="./assets/css/admin.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link href="./assets/css/click.css" rel="stylesheet">
<link href="./assets/css/mes_stock.css" rel="stylesheet">
<link href="./assets/css/mes_notice2.css" rel="stylesheet">

<script src="./assets/js/admin_stock.js"></script>
</head>

<body>

		<section>
			<div class="main_page" id="main_page_1">
				<div>
					<h3>발주 상세 및 수정</h3>
					<form id="postForm" method="post" action="stockUpdate">
						<div id="table">
							<table id="main_library">
								<colgroup>
									<col width="30%"/>
					    			<col width="60%"/>
								</colgroup>
								<tr>
									<td>주문번호</td>
									<td>${dto.order_id }</td>
								</tr>
								<tr>
									<td>발주일</td>
									<td>${dto.order_date }</td>
								</tr>
								<tr>
									<td>총금액</td>
									<td>${dto.order_price }</td>
								</tr>
								<tr>
									<td>주문개수</td>
									<td>${dto.order_count }</td>
								</tr>
								<tr>
									<td>발주상태</td>
									<td>
										<select name="order_st">
											<option value="진행중" ${dto.order_st == '진행중' ? 'selected' : ''}>진행중</option>
											<option value="완료" ${dto.order_st == '완료' ? 'selected' : ''}>완료</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>직원 ID</td>
									<td>${dto.emp_id }</td>
								</tr>
								<tr>
									<td>구매처 ID</td>
									<td>${dto.pub_id }</td>
								</tr>
								<tr>
									<td>부품코드</td>
									<td>${dto.mes_book_code }</td>
								</tr>
							</table>
							<input type="hidden" name="order_id" value="${dto.order_id }">
							<input type="hidden" name="order_date"	value="${dto.order_date }">
							<input type="hidden" name="order_price"	value="${dto.order_price }">
							<input type="hidden" name="order_count"	value="${dto.order_count }">
							<input type="hidden" name="emp_ID" value="${dto.emp_id }">
							<input type="hidden" name="pub_id" value="${dto.pub_id }">
							<input type="hidden" name="mes_book_code" value="${dto.mes_book_code }">
							<div id="bnt">
								<a href="stock"><input type="button" value="목록으로" id="back"></a><br>
								<input type="submit" value="등록" id="submit">
							</div>
						</div>
					</form>

				</div>
			</div>
		</section>
	</div>


	<!-- 가장 아래 고정 -->

</body>
<script src="./assets/js/mes_stock.js"></script>
</html>