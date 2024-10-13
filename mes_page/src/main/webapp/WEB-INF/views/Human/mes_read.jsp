<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 상세 내역</title>
<link href="./assets/css/00.user_side_base.css" rel="stylesheet">
<link href="./assets/css/admin.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>
#menu #items #i4 {
	font-weight: 901;
	text-decoration: underline;
}

#i_1 {
	background-color: rgb(165, 224, 144);
}

body {
	margin: 0;
	padding: 0;
}

#main_library {
	width: 95%;
	border-collapse: collapse;
	margin: 20px auto;
}

th {
	padding: 10px;
	text-align: center;
	font-weight: bold;
	border-bottom: 1px solid #ccc;
	border-right: 1px solid #ccc;
}

td {
	border-bottom: 1px solid #ccc;
	padding: 10px;
	text-align: left;
}

input[type="checkbox"] {
	margin: 0;
	cursor: pointer;
}

a {
	text-decoration: none;
	color: #007bff;
}

a:hover {
	text-decoration: underline;
}

.button-container {
	margin: 20px 0;
	text-align: right;
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

#openForm2, [type=submit], #listBtn {
	font-size: 15px;
	padding: 5px 10px;
	margin: 5px 0;
	border-radius: 10%;
	background: rgb(165, 224, 144);
	border: 1px solid rgb(106, 170, 82);
	cursor: pointer;
}

#listBtn {
	background: white;
	border: 1px solid rgb(106, 170, 82);
}
</style>
</head>
<body>
	<section>
		<div class="mainPage" id="main_page_1">
			<h3>사원 상세 내역</h3>
			<div>
				<div class="page">
					<table id="main_library">
						<tr>
							<th>사원번호</th>
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
					<!-- 수정 버튼 -->
					<button id="openForm2">수정</button>
					<!-- 삭제 버튼 -->
					<form method="post" action="mes_human/remove">
						<input type="hidden" name="emp_id" value="${dto.emp_id}">
						<input type="submit" value="삭제">
					</form>

					<!-- 목록으로 돌아가기 버튼 -->
					<button id="listBtn">
						<a href="mes_human">목록</a>
					</button>
				</div>

				<!-- 수정 폼 모달 -->
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
									<td>${dto.emp_id}</td>
								</tr>
								<tr>
									<td>이름</td>
									<td><input type="hidden" name="emp_name"
										value="${dto.emp_name}">${dto.emp_name}</td>
								</tr>
								<tr>
									<td>직급</td>
									<td><select name="po_id">
											<option value="10" ${dto.po_name == '전임' ? 'selected' : ''}>전임</option>
											<option value="20" ${dto.po_name == '선임' ? 'selected' : ''}>선임</option>
											<option value="30" ${dto.po_name == '첵임' ? 'selected' : ''}>책임</option>
											<option value="50" ${dto.po_name == '사장' ? 'selected' : ''}>사장</option>
									</select> <%-- <input type="text" name="po_name" value="${dto.po_name}"></td> --%>
								</tr>
								<tr>
									<td>부서</td>
									<td>
										<%-- <input type="text" name="dept_name"
										value="${dto.dept_name}"> --%> <select name="dept_id">
											<option value="1000" ${dept_name == '생산팀' ? 'selected' : ''}>생산팀</option>
											<option value="2000" ${dept_name == '영업팀' ? 'selected' : ''}>영업팀</option>
											<option value="3000" ${dept_name == '인사팀' ? 'selected' : ''}>인사팀</option>
											<option value="4000"
												${dept_name == '재고관리팀' ? 'selected' : ''}>재고관리팀</option>
											<option value="5000"
												${dept_name == '환경관리팀' ? 'selected' : ''}>환경관리팀</option>
									</select>
									</td>
								</tr>
								<tr>
									<td>전화번호</td>
									<td><input type="text" name="emp_hp" value="${dto.emp_hp}"></td>
								</tr>
								<tr>
									<td>주소</td>
									<td><input type="text" name="emp_add"
										value="${dto.emp_add}"></td>
								</tr>
								<tr>
									<td>입사일</td>
									<td><input type="date" name="emp_hiredate"
										value="${dto.emp_hiredate}"></td>
								</tr>
							</table>
							<input type="hidden" name="emp_id" value="${dto.emp_id}">
							<input type="submit" value="수정">
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- JavaScript 추가 -->
	<script>
		// 수정 버튼 클릭 시 모달 표시
		var modal = document.getElementById("formModal2");
		var btn = document.getElementById("openForm2");
		var span = document.getElementsByClassName("close")[0];

		btn.onclick = function() {
			modal.style.display = "block";
		}

		// 닫기 버튼 클릭 시 모달 닫기
		span.onclick = function() {
			modal.style.display = "none";
		}

		// 모달 외부 클릭 시 모달 닫기
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>
</body>
</html>
