<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
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
<link href="./assets/css/click.css" rel="stylesheet">
<link href="./assets/css/mes_pfwork.css" rel="stylesheet">
</head>
<body>

	<section>
		<div class="main_page" id="main_page_1">
			<h3>주문 현황</h3>
			<div class="bot_btn">
				<div class="search-container">
					<input type="text" id="searchInput" placeholder="주문번호 검색">
				</div>
			</div>
			<div>
				<div class="page_2">
					<table id="main_library">
						<thead>
							<tr>
								<th class="sortable">주문번호</th>
								<th>제품명</th>
								<th>회원ID</th>
								<th>주문날짜</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="work" items="${ map.list }">
								<tr>
									<td class="sortable">${ work.os_id }</td>
									<c:if test="${ work.bom_name eq null }">
										<td>${ work.app_book }</td>
									</c:if>
									<c:if test="${ work.bom_name != null }">
										<td>${ work.bom_name }</td>
									</c:if>
									<c:if test="${ work.bom_name eq null }">
										<td>${ work.lib_name }</td>
									</c:if>
									<c:if test="${ work.bom_name != null }">
										<td>${ work.user_id }</td>
									</c:if>
									<td>${ work.os_date }</td>
									<td id="createwo">
										<form method="post" action="pfinsertwo">
											<input type="hidden" name="lib_id" value="${work.lib_id }">
											<input type="hidden" name="lr_count" value="${work.lr_count }"> 
											<input type="hidden" name="os_id" value="${work.os_id }">
											<c:if test="${empty work.os_status }">
												<input type="submit" value="작업지시서 생성">
											</c:if>
											<c:if test="${not empty work.os_status }">
												${work.os_status }
											</c:if>
										</form>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<br>
				<div id="pfworkpush">
						<input type="button" id="addpf" value="주문추가">
					</div>
			</div>
		</div>
	</section>
	
	<!-- //////////////////////////// 첫번째 모달 ////////////////////////////////////// -->
	<div id="modal_2" class="modal_2">
		<div class="close_2">
			<span class="material-symbols-outlined"> close </span>
		</div>
		<div class="modal-content_2">
			<div id="daylist_2"></div>
			<div id="modal-content-divs_2">
				<h2>&lt;주문추가&gt;</h2>
				<div class="modal-div_">
					<span class="red">*</span> 필수
				</div>
				<form method="post" action="pfwork_insert">
					<div id="table">
						<table>
							<tr class="modal-div_2">
								<td><span class="red">*</span> <span class="modal-item">제품명</span>
								</td>
								<td><select name="bom_code">
										<c:forEach var="code" items="${bom_code}">
											<option value="${code.bom_code}">${code.bom_name}</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr class="modal-div_2">
								<td><span class="red">*</span> <span class="modal-item">회원ID</span>
								</td>
								<td><select name="buser_seq">
										<c:forEach var="code" items="${buser_seq}">
											<option value="${code.buser_seq}">${code.buser_seq}</option>
										</c:forEach>
								</select></td>
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

	<!-- script -->
	<script src="./assets/js/mes_pfwork.js"></script>

</body>
</html>