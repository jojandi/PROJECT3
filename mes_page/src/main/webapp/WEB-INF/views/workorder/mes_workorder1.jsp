<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*" %>
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
<link href="./assets/css/mes_workorder.css" rel="stylesheet">
<link href="./assets/css/click.css" rel="stylesheet">
<link href="./assets/css/modal.css" rel="stylesheet">
</head>
<body>

	<section>
		<!-- ---------------------- 작업지시서 페이지 ---------------------------- -->
		<div class="main_page" id="main_page_1">
			<h3>작업지시서</h3>
			<div>
				<div class="search-container">
					<input type="text" id="searchInput" placeholder="지시번호 검색">
				</div>
				<div class="page_2">
					<table id="main_library1">
						<col width="15%" />
						<col width="20%" />
						<col width="20%" />
						<col width="10%" />
						<col width="10%" />
						<col width="10%" />
						<col width="10%" />
						<thead>
							<tr>
								<th class="sortable">지시번호</th>
								<th>제품코드</th>
								<th>제품명</th>
								<th>공정</th>
								<th>수량</th>
								<th>상태</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${map.list}">
								<tr>
									<td class="sortable">${ list.wo_id }</td>
									<td>${ list.bom_code }</td>
									<td>${ list.bom_name }</td>
									<td>${ list.wo_process }</td>
									<td>${ list.wo_count }</td>
									<td>${ list.wo_status }</td>
									<td><form method="get" action="mes_workorder1_read">
											<input type="hidden" name="lib_id" value="${list.lib_id }">
											<input type="hidden" name="wo_id" value="${ list.wo_id }">
											<input type="hidden" name="os_id" value="${ list.os_id }">
											<input type="submit" value="수정">
										</form></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="bot_btn">
					<input type="button" id="addbtn"
						value="작업지시서 생성">
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
						<a href="mes_workorder1?page=<%= sec_first - 1 %>">chevron_left</a>
					</span>
				</c:if>
                
                <!-- 섹션 내에서의 첫번째 페이지부터 마지막 페이지만 나오게 -->
				<c:forEach var="i" begin="<%= sec_first %>" end="<%= sec_last %>">
					
					<!-- 페이지 이동, 현재 페이지는 strong 처리 -->
					<c:if test="${i eq param.page}"> 
						<a href="mes_workorder1?page=${i}" id="page" class="chap"><strong>${i}</strong></a>
					</c:if>
					<c:if test="${i != param.page}"> 
						<a href="mes_workorder1?page=${i}" id="page" class="chap">${i}</a>
					</c:if>
						
				</c:forEach>
				
				<c:if test="<%= sec_last == lastPage %>">
					<span class="material-symbols-outlined">chevron_right</span>
				</c:if>
				<c:if test="<%= sec_last != lastPage %>">
                	<span class="material-symbols-outlined">
                		<a href="mes_workorder1?page=<%= sec_last + 1 %>">chevron_right</a>chevron_right
                	</span>
                </c:if>
            </div>
            
		</div>
	</section>
	
	<!-- //////////////////////////// 작업지시서 생성 모달 ////////////////////////////////////// -->
	<div id="modal_2" class="modal_2" style="display: none;">
		<div class="close_2">
			<span class="material-symbols-outlined"> close </span>
		</div>
		<div class="modal-content_2">
			<div id="daylist_2"></div>
			<div id="modal-content-divs_2">
				<h2>&lt;작업 지시서 생성&gt;</h2>
				<div class="modal-div_">
					<span class="red">*</span> 필수
				</div>
					<form method="post" action="insertwo">
				<div id="table">
						<table>
							<tr class="modal-div_2">
								<td><span class="red">*</span> <span class="modal-item">제품코드</span>
								</td>
								<td><select name="bom_code">
										<c:forEach var="code" items="${bom_code}">
											<option value="${code.bom_code}">${code.bom_name}</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr class="modal-div_2">
								<td><span class="red">*</span> <span class="modal-item">공정</span>
								</td>
								<td><select name="wo_process">
										<option value="A공정">A공정</option>
										<option value="B공정">B공정</option>
										<option value="C공정">C공정</option>
								</select></td>
							</tr>
							<tr class="modal-div_2">
								<td class="modal-item">수량</td>
								<td><input type="text" name="wo_count"></td>
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

	<script src="./assets/js/mes_workorderWo.js"></script>

</body>
</html>