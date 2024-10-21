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
<link href="./assets/css/mes/admin_table.css" rel="stylesheet">
<link href="./assets/css/mes/00.user_side_base.css" rel="stylesheet">
<link href="./assets/css/mes/admin.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script src="./assets/js/mes/click.js"></script>
<link href="./assets/css/mes/click.css" rel="stylesheet">
<link href="./assets/css/mes/mes_pfwork.css" rel="stylesheet">
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
				<form method="get" action="updatepf">
					<div class="page_2">
						<table id="main_library">
							<thead>
								<tr>
									<th class="sortable">주문번호</th>
									<th>제품명</th>
									<th>회원ID</th>
									<th>주문날짜</th>
									<th>담당자</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="sortable"><input type=hidden id="os_id" name="os_id"
										value="${ list.os_id }">${ list.os_id }</td>
									<td><select name="bom_code">
											<c:forEach var="code" items="${bom_code}">
												<option value="${code.bom_code}">${code.bom_code}</option>
											</c:forEach>
									</select></td>
									<td>${ list.user_id }</td>
									<td>${ list.os_date }</td>
									<td>${ list.emp_name }</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div>
					<!-- 아작스 쓰세용~~^^ 나만 고통받을 수 없지~~~~~~~ -->
						<input type="submit" id="upbtn" value="수정"> 					
						<input type="button" id="delbtn" value="삭제">
					</div>
				</form>
				<br>
			</div>
		</div>
	</section>
	
	<!-- delete ajax로 보내기  -->
	<script>
		function ajax(url, param, cb, method) {
			// javascript에서 false는 null, undefined, 0
			// true는 false가 아닌 것으로 정의되어 있음
			if(!method) method = "get";
			
			const xhr = new XMLHttpRequest();
			xhr.open(method, url);
			xhr.setRequestHeader("Content-Type","application/json"); // json 보내줄 거임
			xhr.send(JSON.stringify(param));
			
			if(typeof cb == "function") {
				xhr.onload = function(){
					cb(xhr.responseText)
				}
			}
		}	
		
		document.querySelector("#delbtn").addEventListener("click", function(){
			const os_id = document.querySelector("#os_id").value;
			
			const data = {
					"os_id" : os_id
			}
			ajax("deletepf", data, function(result){
				if(result >= 1) {
					location.href="mes_pfwork1";
				} else {
					alert("실패!!!!!!!!!!!!!!")
				}
			}, "delete")
		})
	</script>

</body>
</html>