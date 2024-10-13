<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<link href="./assets/css/member/member.css" rel="stylesheet">
<style>
	 #i1 .material-symbols-outlined { background-color: rgb(165, 224, 144); }
</style>
<head>
<meta charset="UTF-8">
<title>도서 회원 관리</title>
</head>
<body>

		<section>
			<div class="main_page" id="main_page_1">
				<h3>도서 회원 관리</h3>
				<div>
					<!-- 언제부터 대출가능 한지 넣기  -->

					<form action="/processMembers" method="post">
						<div class="page">
							<table>
								<colgroup>
	                                <col width="7%">
	                                <col width="17%">
	                                <col width="10%">
	                                <col width="10%">
	                                <col width="12%">
	                                <col width="10%">
	                            </colgroup>
								<thead>
									<tr>
										<th>회원번호</th>
										<th>이름</th>
										<th>생년월일</th>
										<th>아이디</th>
										<th>전화번호</th>
										<th>비고</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="list" items="${list}">
										<tr>
											<td>${list.user_seq}</td>
											<td><a href="member2?seq=${list.user_seq}">${list.user_name}</a></td>
											<td>${list.user_birth}</td>
											<td>${list.user_id}</td>
											<td>${list.user_tel}</td>
											
											<td>
												<c:if test="${list.user_pass != null }">
												${list.user_pass} 부터 대여 가능
												</c:if> 
												<c:if test="${list.user_pass == null}">
													-
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

					</form>
				</div>
			</div>
		</section>
	<script src="./assets/js/mem/member.js"></script>

</body>
</html>
