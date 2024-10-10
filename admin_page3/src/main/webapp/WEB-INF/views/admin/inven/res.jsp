<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<link href="./assets/css/inven/inven.css" rel="stylesheet">
<style>
#i2 .material-symbols-outlined {
	background-color: rgb(165, 224, 144);
}
</style>
<head>
<meta charset="UTF-8">
<title>도서 재고 관리</title>
</head>
<body>
		<section>
			<div class="main_page" id="main_page_1">
				<h3>도서 예약 관리</h3>
				<div>
					<div class="page">
						<table>
							<colgroup>
								<col width="5%">
								<col width="5%">
								<col width="5%">
								<col width="28%">
								<col width="10%">
								<col width="7%">
								<col width="12%">
								<col width="10%">
							</colgroup>
							<thead>
								<tr>
									<th>회원번호</th>
									<th>예약번호</th>
									<th>도서코드</th>
									<th>도서명</th>
									<th>예약일자</th>
									<th>픽업일자</th>
									<th>현황</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="list" items="${map.list}">
									<tr>
										<td>${list.user_seq}</td>
										<td>${list.res_id}</td>
										<td>${list.book_code}</td>
										<td>${list.book_name}</td>
										<td>${list.res_day}</td>
										<td><c:if test="${list.res_ing == false}">
				                            		${list.res_pick}
				                            	</c:if> <c:if test="${list.res_ing == true}">
				                            		-
				                            	</c:if></td>
										<td><c:if test="${list.res_ing == true}">
												<select name="loan_ing" class="select">
													<option value="Y">픽업완료</option>
													<option value="N" selected>대기중</option>
												</select>
											</c:if> <c:if test="${list.res_ing == false}">
													픽업완료
												</c:if></td>
										<td><c:if test="${list.res_pick == null}">
												<input type="hidden" value=${list.book_code } class="code">
												<input type="hidden" value=${list.user_seq } class="user">
												<input type="hidden" value=${list.res_id } class="seq">
												<input type="submit" value="수정" class="submit">
											</c:if> <c:if test="${list.res_pick != null}">
													-
												</c:if></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<%-- <%
					Map map = (Map) request.getAttribute("map");
					int totalCount = (int) map.get("totalCount");
			
					String str_countPerPage = (String) request.getAttribute("countPerPage");
					int countPerPage = Integer.parseInt(str_countPerPage);
			
					String str_pageNo = (String) request.getAttribute("page");
					int pageNo = Integer.parseInt(str_pageNo);
			
					// 마지막 페이지 구하기 -> 전체 페이지수 / 페이지당 개수 -> 올림처리
					int lastPage = (int) Math.ceil((double) totalCount / countPerPage);
			
					int countPerSection = 5; // 한 번에 보여줄 페이지의 개수
					// 몇 번째 섹션인지 -> 현재페이지 / 한 번에 보여줄 페이지의 개수 -> 올림처리
					int position = (int) Math.ceil((double) pageNo / countPerSection);
			
					int sec_first = ((position - 1) * countPerSection) + 1; // 섹션의 첫 번째 페이지
					int sec_last = position * countPerSection; // 섹션으 마지막 페이지
			
					// 마지막 페이지 이상으로 더이상 페이지가 나오지 않게 설계
					if (sec_last > lastPage) {
						sec_last = lastPage;
					}
				%>
				<!-- 자바영역의 값 올리기 -->
				<c:set var="lastPage" value="<%=lastPage%>" />

				<div id="movepage">
					<c:if test="<%=sec_first == 1%>">
						<span class="material-symbols-outlined">chevron_left</span>
					</c:if>
					<c:if test="<%=sec_first != 1%>">
						<span class="material-symbols-outlined"> <a
							href="res?page=<%=sec_first - 1%>">chevron_left</a>
						</span>
					</c:if>

					<!-- 섹션 내에서의 첫번째 페이지부터 마지막 페이지만 나오게 -->
					<c:forEach var="i" begin="<%=sec_first%>" end="<%=sec_last%>">

						<!-- 페이지 이동, 현재 페이지는 strong 처리 -->
						<c:if test="${i eq param.page}">
							<a href="res?page=${i}" id="page" class="chap"><strong>${i}</strong></a>
						</c:if>
						<c:if test="${i != param.page}">
							<a href="res?page=${i}" id="page" class="chap">${i}</a>
						</c:if>

					</c:forEach>

					<c:if test="<%=sec_last == lastPage%>">
						<span class="material-symbols-outlined">chevron_right</span>
					</c:if>
					<c:if test="<%=sec_last != lastPage%>">
						<span class="material-symbols-outlined"> <a
							href="res?page=<%=sec_last + 1%>">chevron_right</a>
						</span>
					</c:if>
				</div> --%>
			</div>
		</section>
	<script src="./assets/js/inven/res_post.js"></script>
</body>
</html>
