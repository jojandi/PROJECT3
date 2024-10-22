<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link href="../assets/css/mes/admin_table.css" rel="stylesheet">
<link href="../assets/css/mes/00.user_side_base.css" rel="stylesheet">
<link href="../assets/css/mes/admin.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script src="../assets/js/mes/click.js"></script>
<link href="../assets/css/mes/mes_workorder.css" rel="stylesheet">
<link href="../assets/css/mes/click.css" rel="stylesheet">

</head>
<body>

	<section>
		<!-- ---------------------- 작업지시서 페이지 ---------------------------- -->
		<div class="main_page" id="main_page_1">
			<h3>작업지시서</h3>
			<div>
				<div class="page_2">
					<div class="search-container">
						<input type="text" id="searchInput" placeholder="지시번호 검색">
					</div>
					<form method="post" action="workorderUpdate">
						<table id="main_library1">
							<thead>
								<tr>
									<th class="sortable">지시번호</th>
									<th>제품코드</th>
									<th>제품명</th>
									<th>공정</th>
									<th>수량</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="sortable"><input type="hidden" name="wo_id"
										value="${ list.wo_id }">${ list.wo_id }</td>
									<td><input type="hidden" name="bom_code"
										value="${ list.bom_code }">${ list.bom_code }</td>
									<td><input type="hidden" name="bom_name"
										value="${ list.bom_name }">${ list.bom_name }</td>
									<td><select name="wo_process">	
										<option value="포장공정"
												${list.wo_status == '포장공정' ? 'selected' : ''}>포장공정</option>
											<option value="배송공정"
												${list.wo_status == '배송공정' ? 'selected' : ''}>배송공정</option>
										</select></td>
									<td><input type="hidden" name="wo_count"
										value="${ list.wo_count }">${ list.wo_count }</td>
									<td><select name="wo_status">
											<option value="진행중"
												${list.wo_status == '진행중' ? 'selected' : ''}>진행중</option>
											<option value="완료"
												${list.wo_status == '완료' ? 'selected' : ''}>완료</option>
									</select></td>
									<td>
										<input type="hidden" name="lr_seq" value="${list.lr_seq }">
										<input type="hidden" name="lib_id" value="${list.lib_id }">
										<input type="hidden" name="os_id" value="${list.os_id }">
										<input type="hidden" name="wo_id" value="${ list.wo_id }">
										<input type="submit" value="완료">
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
	</section>

</body>
</html>