<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<link href="./assets/css/member/member_read.css" rel="stylesheet">
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
				<h3>도서 회원 상세 내역</h3>
				<div>
					<!-- 언제부터 대출가능 한지 넣기  -->

					<form action="member1" method="get">
						<div class="page">
						
							<table>
								<tr>
									<th>회원번호</th>
									<td>${dto.user_seq}</td>
								</tr>
								<tr>
									<th>이름</th>
									<td>${dto.user_name}</td>
								</tr>
								<tr>
									<th>생년월일</th>
									<td>${dto.user_birth}</td>
								</tr>
								<tr>
									<th>아이디</th>
									<td>${dto.user_id}</td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td>${dto.user_tel}</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td>${dto.user_email}</td>
								</tr>
								<tr>
									<th>주소</th>
									<td>${dto.user_addr1} ${dto.user_addr2}</td>
								</tr>
								<tr>
									<th>선호도</th>
									<td>${dto.like}</td>
								</tr>
								<tr>
									<th>대여수</th>
									<td>${dto2.loan_seq}</td>
								</tr>
								<tr>
									<th>연체횟수</th>
									<td>${dto.over_count}</td>
								</tr>
								<tr>
									<th>비고</th>
									<td>
										<c:if test="${dto.user_pass != null}">
												${dto.user_pass} 부터 대여 가능
										</c:if> 
										<c:if test="${dto.user_pass == null}">
											-
										</c:if>
									</td>
								</tr>
							</table>
						</div>
						<div id="submit">
							<input type="submit" value="목록으로">
						</div>
					</form>
				</div>
			</div>
		</section>
	<script src="./assets/js/mem/member.js"></script>
</body>
</html>
