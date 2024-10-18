<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>BOM 수정</title>
    <link href="./assets/css/admin_table.css" rel="stylesheet">
    <link href="./assets/css/00.user_side_base.css" rel="stylesheet">
    <link href="./assets/css/admin.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet">
    <script src="./assets/js/click.js"></script>
    <link href="./assets/css/mes_workorder.css" rel="stylesheet">
    <link href="./assets/css/click.css" rel="stylesheet">
</head>
<body>

	<section>
			<div class="main_page" id="main_page_1">
				<h3>BOM</h3>
				<div>
					<div id="bomsh">
						<input type="text" placeholder="통합검색">
					</div>
					<div class="page_2">
						<table id="main_library">
							<thead>
								<tr>
									<th><input type="checkbox" id="p1_checkAll"></th>
									<th class="sortable">제품코드</th>
									<th>부품명</th>
									<th>부품코드1</th>
									<th>부품코드2</th>
									<th>부품코드3</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="dto" items="${list}">
									<tr>
										<td><input type="checkbox" class="bom_checkbox"></td>
										<td><a
											href="http://localhost:8080/mesPage/mes_bom_read?bom_code=${dto.bom_code}">${dto.bom_code}</a></td>
										<td>${dto.bom_name}</td>
										<td>${dto.mes_book_code1}</td>
										<td>${dto.mes_book_code2}</td>
										<td>${dto.mes_book_code3}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="bot_btn">
						<a href="http://localhost:8080/mesPage/mes_bomcreate"><input type="button" id="addbom" value="BOM 생성"></a>
					</div>
				</div>
			</div>
			
</section>
	
	<!-- //////////////////////////// 첫번째 모달 ////////////////////////////////////// -->
	
	<!-- //////////////////////////// 첫번째 모달 ////////////////////////////////////// -->

	<script src="./assets/js/mes_workorderBom.js"></script>

</body>
</html>