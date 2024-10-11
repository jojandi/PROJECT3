<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="./assets/css/00.user_side_base.css" rel="stylesheet">
<link href="./assets/css/admin.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

#menu #items #i4{
    font-weight: 901;
    text-decoration: underline;
}

#i_1{
	background-color: rgb(165, 224, 144);
}  
/* 전체 페이지 스타일 */
body {
	margin: 0;
	padding: 0;
}

/* 테이블 컨테이너 스타일 */
#main_library {
	width: 95%;
	border-collapse: collapse;
	margin: 20px auto;
}

/* 헤더 스타일 */
th {
	padding: 10px;
	text-align: center;
	font-weight: bold;
	border-bottom: 1px solid #ccc;
	border-right: 1px solid #ccc;
}

/* 테이블 바디 스타일 */
td {
	border-bottom: 1px solid #ccc;
	padding: 10px;
	text-align: left;
}

/* 체크박스 스타일 */
input[type="checkbox"] {
	margin: 0;
	cursor: pointer;
}

/* 링크 스타일 */
a {
	text-decoration: none;
	color: #007bff;
}

a:hover {
	text-decoration: underline;
}

/* 버튼 컨테이너 스타일 */
.button-container {
	margin: 20px 0;
	text-align: right; /* 오른쪽 정렬 */
}

.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 500px;
	top: 100px;
	width: 400px;
	height: 80%;
	overflow: auto;
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

#workForm {
	text-align: center;
}

#openForm2, [type=submit], #listBtn{
    font-size: 15px;
    padding: 5px 10px;
    margin: 5px 0;
    border-radius: 10%;
    background: rgb(165, 224, 144);
    border: 1px solid rgb(106, 170, 82);
    cursor: pointer;
}

#listBtn{
    background: white;
    border: 1px solid rgb(106, 170, 82);
}
</style>

</head>
<body>
	<div id="wrap">

<%-- 		<%@ include file="/WEB-INF/mes/mes_human/human_side.jsp"%> --%>
		<section>
			<div class="main_page" id="main_page_1">
				<h3>사원 상세 내역</h3>
				<div>
					<div class="page">
						<table id="main_library">
							<tr>
								<th class="sortable">사원번호</th>
								<td>${dto.emp_id}</td>
							</tr>
							<tr>
								<th>이름</th>
								<td>${dto.emp_name}</td>
							</tr>
							<tr>
								<th>직급</th>
								<td>${dto.po_name}</td>
							</tr>
							<tr>
								<th>부서</th>
								<td>${dto.dept_name}</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td>${dto.emp_hp}</td>
							</tr>
							<tr>
								<th>주소</th>
								<td>${dto.emp_add}</td>
							</tr>
							<tr>
								<th>입사일</th>
								<td>${dto.emp_hiredate}</td>
							</tr>
						</table>
					</div>

					<div class="button-container">
						<form method="post" action="remove">
							<input id="openForm2" type="button" value="수정">
							<input type="hidden" name="emp_id" value="${dto.emp_id }">
							<input type="submit" value="삭제">
						</form>
						<button class="btn" id="listBtn">
							<a href="http://localhost:8080/mes_page/mes_human">목록</a>
						</button>
					</div>
					<div id="formModal2" class="modal">
						<div class="modal-content">
							<span class="close">&times;</span>
							<form id="workForm2" method="post" action="modify">
								<table>
									<tr>
										<th colspan="2">사원 수정</th>
									</tr>
									<tr>
										<td>사원번호</td>
										<td>${dto.emp_id}
									</tr>
									<tr>
										<td>이름</td>
										<td><input type="text" name="emp_name"></td>
									</tr>
									<tr>
										<td>직급</td>
										<td><input type="text" name="po_name"></td>
									</tr>
									<tr>
										<td>부서</td>
										<td><input type="text" name="dept_name"></td>
									</tr>
									<tr>
										<td>전화번호</td>
										<td><input type="text" name="emp_hp"></td>
									</tr>
									<tr>
										<td>주소</td>
										<td><input type="text" name="emp_add"></td>
									</tr>
									<tr>
										<td>입사일</td>
										<td><input name="emp_hiredate" type="date"></td>
									</tr>
								</table>
								<input type="hidden" name="emp_id" value="${dto.emp_id }">
								<input type="submit" value="수정">
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>


	<script src="./assets/js/mes_human_2.js"></script>
</body>
</html>