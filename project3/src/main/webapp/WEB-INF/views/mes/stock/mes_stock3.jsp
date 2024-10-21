<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%-- <%@ page import="mes_DTO.MesStockDTO"%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 발주</title>
<link href="../assets/css/mes/admin_table.css" rel="stylesheet">
<link href="../assets/css/mes/00.user_side_base.css" rel="stylesheet">
<link href="../assets/css/mes/admin.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<!-- <link href="../assets/css/mes/click.css" rel="stylesheet"> -->
<link href="../assets/css/mes/mes_stock.css" rel="stylesheet">

<!-- <script src="../assets/js/mes/admin_stock.js"></script> -->
<script src="../assets/js/mes/mes_stock.js"></script>
<script src="../assets/js/mes/mes_stock_search.js"></script>

<style>
	#i3 .material-symbols-outlined {
		background-color: rgb(165, 224, 144);
	}
</style>

</head>
<body>
	<section>

			<div class="main_page" id="main_page_1">
				<h3>도서 발주</h3>
				<div>
					<div class="table_wrap">
						<div class="page_2">
							<table id="main_library">
								<thead>
									<tr>
										<th class="sortable">부품코드</th>
										<th>발주ID</th>
										<th>구매처</th>
										<th>발주상태</th>
										<th>담당자</th>
										<th>발주일</th>
										<th></th>
									</tr>
								</thead>
								<tbody class="main_tbody">
									<c:forEach var="StockList3" items="${map.list}">
										<tr>
											<td class="sortable">${StockList3.mes_book_code }</td>
											<td>${StockList3.order_id }</td>
											<td>${StockList3.pub_name }</td>
											<td>${StockList3.order_st }</td>
											<td>${StockList3.emp_name }</td>
											<td>${StockList3.order_date }</td>
											<td>
												<form method="get" action="stock_update">
													<input type="hidden" name="order_ID"
														value="${StockList3.order_id }"> <input
														type="submit" value="수정">
												</form>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

						</div>
						<div id="text_right">
							<input id="openForm1" type="button" value="발주">
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
								<a href="mes_stock1?page=${i}" id="page" class="chap"><strong>${i}</strong></a>
							</c:if>
							<c:if test="${i != param.page}"> 
								<a href="mes_stock1?page=${i}" id="page" class="chap">${i}</a>
							</c:if>
								
						</c:forEach>
						
						<c:if test="<%= sec_last == lastPage %>">
							<span class="material-symbols-outlined">chevron_right</span>
						</c:if>
						<c:if test="<%= sec_last != lastPage %>">
		                	<span class="material-symbols-outlined">
		                		<a href="mes_stock1?page=<%= sec_last + 1 %>">chevron_right</a>chevron_right
		                	</span>
		                </c:if>
		            </div>
					</div>

				</div>
			</div>
			<div id="formModal1" class="modal">
				<!-- 도서 발주 모달 -->
				<div class="modal-content">
					<span class="close1">&times;</span>
					<form id="workForm" method="post" action="mes_stock3">
						<input type="hidden" name="action" value="insert_order">
						<table>
							<tr>
								<th colspan="2">도서 발주</th>
							</tr>
							<tr>
								<td>부품코드</td>
								<td><select name="mes_book_code">
										<c:forEach var="code" items="${mes_book_code}">
											<option value="${code.mes_book_code}">${code.mes_book_code}</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<td>주문개수</td>
								<td><input id="order_count" type="text" name="order_count"></td>
							</tr>
							<tr>
								<td>발주처id</td>
								<td><select name="pub_id">
										<c:forEach var="code" items="${pub_id}">
											<option value="${code.pub_id}">${code.pub_id}</option>
										</c:forEach>
								</select></td>
							</tr>
						</table>
						<input id="workFormBtn" type="submit" value="발주">
						</div>
					</form>
			</div>
		</section>
</body>
</html>