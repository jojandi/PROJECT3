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
									<c:if test="${ work.bom_name != null }">
										<td>${ work.lib_name }</td>
									</c:if>
<%-- 									<c:if test="${ work.bom_name != null }"> --%>
<%-- 										<td>${ work.user_id }</td> --%>
<%-- 									</c:if> --%>
									<td>${ work.os_date }</td>
									<td id="createwo">
										<form method="post" action="pfinsertwo">
											<input type="hidden" name="lib_id" value="${work.lib_id }">
											<input type="hidden" name="lr_count" value="${work.lr_count }"> 
											<input type="hidden" name="os_id" value="${work.os_id }">
											<c:if test="${empty work.os_status }">
												<input type="submit" value="작업지시서 생성">
											</c:if>
											<c:if test="${'진행중' eq work.os_status }">
												${work.os_status }
											</c:if>
											<c:if test="${'완료' eq work.os_status }">
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
		<%
	            Map map = (Map) request.getAttribute("map");
				int totalCount = Integer.parseInt(map.get("totalCount").toString());
	
				String str_countPerPage = request.getAttribute("countPerPage").toString();
				int countPerPage = Integer.parseInt(str_countPerPage);
	
				String str_pageNo = request.getAttribute("page").toString();
				int pageNo = Integer.parseInt(str_pageNo);
				
				// 마지막 페이지 구하기 -> 전체 페이지수 / 페이지당 개수 -> 올림처리
				int lastPage = (int)Math.ceil((double)totalCount / countPerPage); 
				
				int countPerSection = 5; // 한 번에 보여줄 페이지의 개수
				// 몇 번째 섹션인지 -> 현재페이지 / 한 번에 보여줄 페이지의 개수 -> 올림처리
				int position = (int)Math.ceil((double)pageNo / countPerSection);
				
				int sec_first = ((position - 1) * countPerSection) + 1; // 섹션의 첫 번째 페이지
				int sec_last = position * countPerSection; // 섹션으 마지막 페이지
				
				// 마지막 페이지 이상으로 더이상 페이지가 나오지 않게 설계
				if(sec_last > lastPage){
					sec_last = lastPage;
				}
			%>
			<!-- 자바영역의 값 올리기 -->
			<c:set var="lastPage" value="<%= lastPage %>"/>

            <div id="movepage">
            	<c:if test="<%= sec_first == 1 %>">
                <span class="material-symbols-outlined">chevron_left</span>
                </c:if>
                <c:if test="<%= sec_first != 1 %>">
                	<span class="material-symbols-outlined">
						<a href="mes_pfwork1?page=<%= sec_first - 1 %>">chevron_left</a>
					</span>
				</c:if>
                
                <!-- 섹션 내에서의 첫번째 페이지부터 마지막 페이지만 나오게 -->
				<c:forEach var="i" begin="<%= sec_first %>" end="<%= sec_last %>">
					
					<!-- 페이지 이동, 현재 페이지는 strong 처리 -->
					<c:if test="${i eq param.page}"> 
						<a href="mes_pfwork1?page=${i}" id="page" class="chap"><strong>${i}</strong></a>
					</c:if>
					<c:if test="${i != param.page}"> 
						<a href="mes_pfwork1?page=${i}" id="page" class="chap">${i}</a>
					</c:if>
						
				</c:forEach>
				
				<c:if test="<%= sec_last == lastPage %>">
					<span class="material-symbols-outlined">chevron_right</span>
				</c:if>
				<c:if test="<%= sec_last != lastPage %>">
                	<span class="material-symbols-outlined">
                		<a href="mes_pfwork1?page=<%= sec_last + 1 %>">chevron_right</a>chevron_right
                	</span>
                </c:if>
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