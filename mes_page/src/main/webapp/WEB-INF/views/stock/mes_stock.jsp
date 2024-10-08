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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>재고 관리</title>
<link href="./assets/css/admin_table.css" rel="stylesheet">
<link href="./assets/css/00.user_side_base.css" rel="stylesheet">
<link href="./assets/css/admin.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link href="./assets/css/click.css" rel="stylesheet">
<link href="./assets/css/mes_stock.css" rel="stylesheet">

<!-- <script src="./assets/js/admin_stock.js"></script> -->
<script src="./assets/js/mes_stock_search.js"></script>
</head>

<body>


		<section>
			<div class="main_page" id="main_page_1">
				<h3>재고 현황</h3>
				<div>
					<div class="bot_btn">
						<div class="search-container">
							<input type="text" id="searchBom" placeholder="제품명 검색...">
						</div>
					</div>
					<div class="page_2">
						<table id="main_library">
							<colgroup>
								<col width="3%">
								<col width="20%">
								<col width="7%">
								<col width="8%">
								<col width="8%">
							</colgroup>
							<thead>
								<tr>
									<th>제품 코드</th>
									<th class="sortable">제품명</th>
									<th>재고 수량</th>
									<th>보관 위치</th>
									<th>비고</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="productList" items="${productList}">
									<tr>
										<td>${productList.bom_code }</td>
										<td class="sortable">${productList.bom_name }</td>
										<td>${productList.pd_count }</td>
										<td>${productList.wh_name }</td>
										<td>${productList.pd_note }
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

				</div>
			</div>

			<div class="main_page" id="main_page_2">
				<h3>보유 도서 목록</h3>
				<div>
					<div class="bot_btn">
						<div class="search-container">
							<input type="text" id="searchInput" placeholder="도서명 검색...">
						</div>
					</div>
					<div class="page_2">
						<table id="main_library2">
							<thead>
								<tr>
									<th>부품번호</th>
									<th class="sortable">도서명</th>
									<th>도서 코드</th>
									<th>저자</th>
									<th>출판사</th>
									<th>수량</th>
									<th>보관 위치</th>
								</tr>
							</thead>
							<!-- 여기에 데이터 -->
							<tbody>
								<c:forEach var="mesbook" items="${map.list}">
									<tr>
										<td>${mesbook.mes_book_code }</td>
										<td class="sortable">${mesbook.book_name }</td>
										<td>${mesbook.book_isbn }</td>
										<td>${mesbook.book_author }</td>
										<td>${mesbook.book_pub }</td>
										<td>${mesbook.book_count }</td>
										<td>${mesbook.wh_code }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- 보유도서 페이징 -->
						<%
						Map map = (Map) request.getAttribute("map");
						int totalCount = (int) map.get("totalCount");

						String str_countPerPage = (String) request.getAttribute("countPerPage");
						int countPerPage = Integer.parseInt(str_countPerPage);

						String str_pageNo = (String) request.getAttribute("page");
						int pageNo = Integer.parseInt(str_pageNo);

						int lastPage = (int) Math.ceil((double) totalCount / countPerPage);

						// 한번에 보여줄 페이지의 개수
						int countPerSection = 3;
						// 페이지 섹션 위치
						int position = (int) Math.ceil((double) pageNo / countPerSection);
						int sec_first = ((position - 1) * countPerSection) + 1;
						int sec_last = position * countPerSection;
						if (sec_last > lastPage) {
							sec_last = lastPage;
						}
 						%>
						<c:set var="lastPage2" value="<%=lastPage%>" scope='page' />

						<c:if test="<%=sec_first == 1%>">
					      &lt;
					   	</c:if>
						<c:if test="<%=sec_first != 1%>">
							<a href="stock?page=<%=sec_first - 1%>">&lt;</a>
						</c:if>

						<c:forEach var="i" begin="<%=sec_first%>" end="<%=sec_last%>">
							<c:if test="${i eq page}"> [<a href="stock?page=${i}&mainPage=2"><strong>${ i }</strong></a>] </c:if>
							<c:if test="${i != page}">[<a href="stock?page=${i}&mainPage=2">${ i }</a>]</c:if>
						</c:forEach>

						<c:if test="<%=sec_last == lastPage%>">
						  &gt;
					    </c:if>
						<c:if test="<%=sec_last != lastPage%>">
							<a href="stock?page=<%=sec_last + 1%>">&gt;</a>
						</c:if>
						<!-- 여기까지 페이징 -->
				</div>
			</div>

			<div class="main_page" id="main_page_3">
				<h3>도서 발주</h3>
				<div>
					<div class="table_wrap">
						<div class="page_2">
							<table id="main_library_1">
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
									<c:forEach var="tbl_order" items="${tbl_order}">
										<tr>
											<td class="sortable">${tbl_order.mes_book_code }</td>
											<td>${tbl_order.order_id }</td>
											<td>${tbl_order.pub_name }</td>
											<td>${tbl_order.order_st }</td>
											<td>${tbl_order.emp_name }</td>
											<td>${tbl_order.order_date }</td>
											<td>
												<form method="get" action="stockUpdate">
													<input type="hidden" name="order_id"
														value="${tbl_order.order_id }"> <input
														type="submit" value="수정">
												</form>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

						</div>
						<div class="text_right">
							<input id="openForm1" type="button" value="발주">
						</div>
						<!-- <div class="page_1">
                            <h3>도서 구매 내역</h3>
                            <table id="main_library_2">
                                <thead>
                                    <tr>
                                        <th><input type="checkbox" id="p2_checkAll"></th>
                                        <th class="sortable">도서명</th>
                                        <th>저자명</th>
                                        <th>출판사</th>
                                        <th>출판연도</th>
                                        <th>도서코드</th>
                                        <th>발주 권수</th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>

                        </div> -->
					</div>

				</div>
			</div>
			<div id="formModal1" class="modal">
				<!-- 도서 발주 모달 -->
				<div class="modal-content">
					<span class="close1">&times;</span>
					<form id="workForm" method="post" action="stock">
						<input type="hidden" name="action" value="insert_order">
						<table>
							<tr>
								<th colspan="2">도서 발주</th>
							</tr>
							<tr>
								<td>부품코드</td>
								<td><select name="mes_book_code">
										<c:forEach var="code" items="${mes_book_code}">
											<option value="${code}">${code}</option>
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
											<option value="${code}">${code}</option>
										</c:forEach>
								</select></td>
							</tr>
						</table>
						<input id="workFormBtn" type="submit" value="발주">
					</form>
				</div>
			</div>
			<!-- 			<div id="formModal2" class="modal"> 도서 발주 업데이트 모달 -->
			<!-- 				<div class="modal-content"> -->
			<!-- 					<span class="close2">&times;</span> -->
			<!-- 					<form id="workForm" method="post" action="stockUp"> -->
			<!-- 					<input type="hidden" name="action" value="update_order"> -->
			<!-- 						<table> -->
			<!-- 							<tr> -->
			<!-- 								<th colspan="2">도서 발주</th> -->
			<!-- 							</tr> -->
			<!-- 							<tr> -->
			<!-- 								<td>부품코드</td> -->
			<!-- 								<td></td> -->
			<!-- 							</tr> -->
			<!-- 							<tr> -->
			<!-- 								<td>주문개수</td> -->
			<!-- 								<td></td> -->
			<!-- 							</tr> -->
			<!-- 							<tr> -->
			<!-- 								<td>발주상태</td> -->
			<!-- 								<td></td> -->
			<!-- 							</tr> -->
			<!-- 							<tr> -->
			<!-- 								<td>발주처id</td> -->
			<!-- 								<td></td> -->
			<!-- 							</tr> -->
			<!-- 						</table> -->
			<!-- 						<input id="workFormBtn" type="submit" value="발주"> -->
			<!-- 					</form> -->
			<!-- 				</div> -->
			<!-- 			</div> -->
		</section>


	<!-- 가장 아래 고정 -->

</body>
<script src="./assets/js/mes_stock.js"></script>
</html>