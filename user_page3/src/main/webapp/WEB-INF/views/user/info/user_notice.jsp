<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 사용자용</title>
<link href="./assets/css/info/user_notice2.css" rel="stylesheet">
<link href="./assets/css/base/user_base.css" rel="stylesheet">
<link href="./assets/css/info/user_info_side.css" rel="stylesheet">
</head>
<style>
aside #items #i1 .material-symbols-outlined {
	background: rgb(165, 224, 144);
}
</style>
<body>

	<div id="section">
		<div class="name">
			<strong>공지사항</strong>
		</div>

		<div id="table">
			<table class="report" id="reportTable">
				<colgroup>
					<col width="5%" />
					<col width="10%" />
					<col width="20%" />
					<col width="10%" />
					<col width="5%" />
					<!-- 조회수 컬럼 추가 -->
				</colgroup>
				<thead>
					<tr>
						<td>번호</td>
						<td>분류</td>
						<td>제목</td>
						<td>등록일</td>
						<!-- <td>조회</td> -->
						<td>조회수</td>
					</tr>
				</thead>

				<c:choose>
					<c:when test="${map.list != null && !map.list.isEmpty()}">
						<c:forEach var="noti" items="${map.list}">
							<tr>
								<td>${noti.ann_Seq}</td>
								<!-- c:set -> request.getAttribute를 하기 위해 request 영역에 변수 선언 -->
								<c:set var="libarary" value="${noti.lib_name}" scope="request" />
								<%
								String l = "a";
								if (request.getAttribute("libarary") == null) {
									System.out.println("null임!!!");
								} else {
									String lib = request.getAttribute("libarary").toString();
									System.out.println("도서관 : " + lib);
									l = lib.substring(0, 2);
								}
								%>
								<td><c:choose>
										<c:when test="${noti.class_Id == 5001}">
                                            공지 - <%=l%>
											<!-- 자바 영역에 있는 변수 l의 값을 가져올 수 있음 -->
										</c:when>
										<c:otherwise>
                                            안내 - <%=l%>
										</c:otherwise>
									</c:choose></td>
								<!--상대주소-->
								<td class="retitle"><a
									href="notice3?ann_seq=${noti.ann_Seq}"> ${noti.ann_Title}</a></td>
								<td>${noti.ann_Regi}</td>
								<%-- <td>${noti.ann_Check}</td> --%>
								<td>${noti.viewCount}</td>
								<!-- 조회수 추가 -->
							</tr>
						</c:forEach>
					</c:when>

					<c:otherwise>
						<tr>
							<td colspan="6">공지사항이 없습니다.</td>
							<!-- 컬럼 갯수 맞춤 -->
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
		<%
		Map map = (Map) request.getAttribute("map");
		System.out.println("totalCount : " + map.get("totalCount"));
		int totalCount = Integer.parseInt(map.get("totalCount").toString());

		System.out.println("countPerPage : " + request.getAttribute("countPerPage"));
		System.out.println("page : " + request.getAttribute("page"));

		String str_countPerPage = request.getAttribute("countPerPage").toString();
		int countPerPage = Integer.parseInt(str_countPerPage);

		String str_pageNo = request.getAttribute("page").toString();
		int pageNo = Integer.parseInt(str_pageNo);

		int lastPage = (int) Math.ceil((double) totalCount / countPerPage);
		int countPerSection = 3;
		int position = (int) Math.ceil((double) pageNo / countPerSection);

		int sec_first = ((position - 1) * countPerSection) + 1;
		int sec_last = position * countPerSection;

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
					href="notice?page=<%=sec_first - 1%>">chevron_left</a>
				</span>
			</c:if>

			<c:forEach var="i" begin="<%=sec_first%>" end="<%=sec_last%>">
				<c:if test="${i eq param.page}">
					<a href="notice?page=${i}&keyword=${param.keyword}" id="page"
						class="chap"><strong>${i}</strong></a>
				</c:if>
				<c:if test="${i != param.page}">
					<a href="notice?page=${i}&keyword=${param.keyword}" id="page"
						class="chap">${i}</a>
				</c:if>
			</c:forEach>

			<c:if test="<%=sec_last == lastPage%>">
				<span class="material-symbols-outlined">chevron_right</span>
			</c:if>
			<c:if test="<%=sec_last != lastPage%>">
				<span class="material-symbols-outlined"> <a
					href="notice?page=<%=sec_last + 1%>">chevron_right</a>
				</span>
			</c:if>
		</div>

		<form id="search" method="get" action="comment">
			<div id="search">
				<select name="period">
					<option value="분류">분류</option>
				</select>
				 <select name="type">
					<option value="제목">제목</option>
				</select> 
				<input type="search" id="searchInput" name="keyword"placeholder="검색어를 입력해주세요">
					 <input type="button" value="검색"class="search" onclick="filterTable()">
					
			</div>
		</form>
	</div>

	<script src="./assets/js/info/user_notice.js"></script>
</body>
</html>
