<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.Map"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>BOM 수정</title>
    <link href="../assets/css/mes/admin_table.css" rel="stylesheet">
    <link href="../assets/css/mes/00.user_side_base.css" rel="stylesheet">
    <link href="../assets/css/mes/admin.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet">
<!--     <script src="../assets/js/click.js"></script> -->
    <link href="../assets/css/mes/mes_workorder.css" rel="stylesheet">
<!--     <link href="../assets/css/mes/click.css" rel="stylesheet"> -->

<style>
	#i2 .material-symbols-outlined {
		background-color: rgb(165, 224, 144);
	}
</style>

</head>
<body>

	<section>
			<div class="main_page" id="main_page_1">
				<h3>BOM</h3>
				<div>
					<div id="bomsh">
						<input type="text" placeholder="통합검색">
					</div>
					<div class="page_2">
						<table id="main_library">
							<thead>
								<tr>
									
									<th class="sortable">제품코드</th>
									<th>부품명</th>
									<th>부품코드1</th>
									<th>부품코드2</th>
									<th>부품코드3</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="dto" items="${map.list}">
									<tr>
										
										<td><a
											href="http://localhost:8080/mesPage/mes_workorder2_read?bom_code=${dto.bom_code}">${dto.bom_code}</a></td>
										<td>${dto.bom_name}</td>
										<td>${dto.mes_book_code1}</td>
										<td>${dto.mes_book_code2}</td>
										<td>${dto.mes_book_code3}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="bot_btn">
						<a href="http://localhost:8080/mesPage/mes_workorder2_create"><input type="button" id="addbom" value="BOM 생성"></a>
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
								<a href="mes_workorder2?pageNo=<%= sec_first - 1 %>">chevron_left</a>
							</span>
						</c:if>
		                
		                <!-- 섹션 내에서의 첫번째 페이지부터 마지막 페이지만 나오게 -->
						<c:forEach var="i" begin="<%= sec_first %>" end="<%= sec_last %>">
							
							<!-- 페이지 이동, 현재 페이지는 strong 처리 -->
							<c:if test="${i eq param.pageNo}"> 
								<a href="mes_workorder2?pageNo=${i}" id="page" class="chap"><strong>${i}</strong></a>
							</c:if>
							<c:if test="${i != param.pageNo}"> 
								<a href="mes_workorder2?pageNo=${i}" id="page" class="chap">${i}</a>
							</c:if>
								
						</c:forEach>
						
						<c:if test="<%= sec_last == lastPage %>">
							<span class="material-symbols-outlined">chevron_right</span>
						</c:if>
						<c:if test="<%= sec_last != lastPage %>">
		                	<span class="material-symbols-outlined">
		                		<a href="mes_workorder2?pageNo=<%= sec_last + 1 %>">chevron_right</a>chevron_right
		                	</span>
		                </c:if>
		            </div>
			</div>
			
</section>
	
	<!-- //////////////////////////// 첫번째 모달 ////////////////////////////////////// -->
	
	<!-- //////////////////////////// 첫번째 모달 ////////////////////////////////////// -->

	<script src="../assets/js/mes_workorderBom.js"></script>

</body>
</html>