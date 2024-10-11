<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	<section>
		<!-- ---------------------- 작업지시서 페이지 ---------------------------- -->
		<div class="main_page" id="main_page_1">
			<h3>작업지시서</h3>
			<div>
				<div class="search-container">
					<input type="text" id="searchInput" placeholder="지시번호 검색">
				</div>
				<div class="page_2">
					<table id="main_library1">
						<col width="15%" />
						<col width="20%" />
						<col width="20%" />
						<col width="10%" />
						<col width="10%" />
						<col width="10%" />
						<col width="10%" />
						<thead>
							<tr>
								<th class="sortable">지시번호</th>
								<th>제품코드</th>
								<th>제품명</th>
								<th>공정</th>
								<th>수량</th>
								<th>상태</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${map.list}">
								<tr>
									<td class="sortable">${ list.wo_id }</td>
									<td>${ list.bom_code }</td>
									<td>${ list.bom_name }</td>
									<td>${ list.wo_process }</td>
									<td>${ list.wo_count }</td>
									<td>${ list.wo_status }</td>
									<td><form method="get" action="mes_workorder1_read">
											<input type="hidden" name="wo_id" value="${ list.wo_id }">
											<input type="submit" value="수정">
										</form></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="bot_btn">
					<input type="button" id="addbtn"
						value="작업지시서 생성">
				</div>
			</div>
		</div>
	</section>
	
	<!-- //////////////////////////// 작업지시서 생성 모달 ////////////////////////////////////// -->
	<div id="modal_2" class="modal_2" style="display: none;">
		<div class="close_2">
			<span class="material-symbols-outlined"> close </span>
		</div>
		<div class="modal-content_2">
			<div id="daylist_2"></div>
			<div id="modal-content-divs_2">
				<h2>&lt;작업 지시서 생성&gt;</h2>
				<div class="modal-div_">
					<span class="red">*</span> 필수
				</div>
					<form method="post" action="insertwo">
				<div id="table">
						<table>
							<tr class="modal-div_2">
								<td><span class="red">*</span> <span class="modal-item">제품코드</span>
								</td>
								<td><select name="bom_code">
										<c:forEach var="code" items="${bom_code}">
											<option value="${code.bom_code}">${code.bom_name}</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr class="modal-div_2">
								<td><span class="red">*</span> <span class="modal-item">공정</span>
								</td>
								<td><select name="wo_process">
										<option value="A공정">A공정</option>
										<option value="B공정">B공정</option>
										<option value="C공정">C공정</option>
								</select></td>
							</tr>
							<tr class="modal-div_2">
								<td class="modal-item">수량</td>
								<td><input type="text" name="wo_count"></td>
							</tr>
						</table>
				</div>
				<div class="modal-div_3" style="text-align: right;">
					<input class="inpa" type="submit" value="생성">
				</div>
				</form>
			</div>
		</div>
	</div>
	<!-- //////////////////////////// 첫번째 모달 ////////////////////////////////////// -->

	<script src="./assets/js/mes_workorderWo.js"></script>

</body>
</html>