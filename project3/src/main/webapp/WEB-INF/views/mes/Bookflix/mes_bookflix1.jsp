<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="project3.talking.gamja.dto.mes.MesBuserDTO"%>
<%@ page import="java.util.Map"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<link href="../assets/css/mes/00.user_side_base.css" rel="stylesheet">
<link href="../assets/css/mes/00.user_side_base.css" rel="stylesheet">
<link href="../assets/css/mes/admin.css" rel="stylesheet">
<link href="../assets/css/mes/mes_buser.css" rel="stylesheet">
<link href="../assets/css/mes/admin_table.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<!-- <script src="../assets/js/mes/click.js"></script> -->
<!-- <link href="../assets/css/mes/click.css" rel="stylesheet"> -->


<style>

/* -------------------------------관리자 직원관리------------------------------ */


#i_1 {
	background-color: rgb(165, 224, 144);
}
/*        	table { */
/*        	font-size: 18px; */
/*        	} */
.clickable {
	cursor: pointer;
	color: blue;
	text-decoration: underline;
}

/* ------------------------------------------------------------------ */
	#i1 .material-symbols-outlined {
		background-color: rgb(165, 224, 144);
	}



</style>



</head>

<body>

		<section>

			<div class="main_page" id="main_page_1">
				<h3>회원관리</h3>
				<div>
					<div class="bot_btn">
						<div class="search-container">
							<form>
								<input type="text" id="searchInput" name="user_id2"placeholder="회원 검색..."> 
								<input type="submit" value="검색">
							</form>
						</div>
					</div>
					<div class="page_2">
						<table id="main_library">
							<colgroup>
							</colgroup>
							<thead>
								<tr>
									<th class="sortable">회원번호</th>
									<th>회원 ID</th>
									<th>회원 주소</th>
									<th>회원 이메일</th>
									<th>가입일</th>
									<th>만료일</th>
								</tr>
							</thead>
							<tbody>
								<!-- 여기 데이터 채우세요 -->
							<tbody>

								<c:forEach var="list" items="${map.list}">
									<tr>
										<td>${list.buser_seq}</td>
										<td>${list.user_id}</td>
										<td>${list.user_addr}</td>
										<td>${list.user_email}</td>
										<td>${list.buser_date}</td>
										<td>${list.buser_end}</td>
									</tr>
								</c:forEach>
							</tbody>
							</tbody>
						</table>
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
								<a href="mes_bookflix1?pageNo=<%= sec_first - 1 %>">chevron_left</a>
							</span>
						</c:if>
		                
		                <!-- 섹션 내에서의 첫번째 페이지부터 마지막 페이지만 나오게 -->
						<c:forEach var="i" begin="<%= sec_first %>" end="<%= sec_last %>">
							
							<!-- 페이지 이동, 현재 페이지는 strong 처리 -->
							<c:if test="${i eq param.pageNo}"> 
								<a href="mes_bookflix1?pageNo=${i}" id="page" class="chap"><strong>${i}</strong></a>
							</c:if>
							<c:if test="${i != param.pageNo}"> 
								<a href="mes_bookflix1?pageNo=${i}" id="page" class="chap">${i}</a>
							</c:if>
								
						</c:forEach>
						
						<c:if test="<%= sec_last == lastPage %>">
							<span class="material-symbols-outlined">chevron_right</span>
						</c:if>
						<c:if test="<%= sec_last != lastPage %>">
		                	<span class="material-symbols-outlined">
		                		<a href="mes_bookflix1?pageNo=<%= sec_last + 1 %>">chevron_right</a>chevron_right
		                	</span>
		                </c:if>
		            </div>
				</div>
			</div>
		</section>

	<!--자바 스크립트 영역-->
	<script src="../assets/js/mes/mes_buser.js"></script>


</body>

</html>