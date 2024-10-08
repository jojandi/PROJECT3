<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="project3.gamja.mesPage.dto.MesBuserDTO"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<link href="./assets/css/00.user_side_base.css" rel="stylesheet">
<link href="./assets/css/00.user_side_base.css" rel="stylesheet">
<link href="./assets/css/admin.css" rel="stylesheet">
<link href="./assets/css/mes_human.css" rel="stylesheet">
<link href="./assets/css/admin_table.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<style>

/* -------------------------------관리자 직원관리------------------------------ */


#i_1 {
	background-color: rgb(165, 224, 144);
}
/*        	table { */
/*        	font-size: 18px; */
/*        	} */
.clickable {
	cursor: pointer;
	color: blue;
	text-decoration: underline;
}

/* ------------------------------------------------------------------ */
</style>



</head>

<body>



	

		<section>

			<div class="main_page" id="main_page_1">
				<h3>회원관리</h3>
				<div>
					<div class="bot_btn">
						<div class="search-container">
							<form>
								<input type="text" id="searchInput" name="user_id2"placeholder="회원 검색..."> 
								<input type="submit" value="검색">
							</form>
						</div>
					</div>
					<div class="page_2">
						<table id="main_library">
							<colgroup>
							</colgroup>
							<thead>
								<tr>
									<th class="sortable">회원번호</th>
									<th>회원 ID</th>
									<th>회원 주소</th>
									<th>회원 이메일</th>
									<th>가입일</th>
									<th>만료일</th>
								</tr>
							</thead>
							<tbody>
								<!-- 여기 데이터 채우세요 -->
							<tbody>

								<c:forEach var="list" items="${userList}">
									<tr>
										<td>${list.buser_seq}</td>
										<td>${list.user_id}</td>
										<td>${list.user_addr}</td>
										<td>${list.user_email}</td>
										<td>${list.buser_date}</td>
										<td>${list.buser_end}</td>
									</tr>
								</c:forEach>
							</tbody>
							</tbody>
						</table>
					</div>

				</div>
			</div>
		</section>
	<!--자바 스크립트 영역-->
	<script src="./assets/js/mes_buser.js"></script>


</body>

</html>