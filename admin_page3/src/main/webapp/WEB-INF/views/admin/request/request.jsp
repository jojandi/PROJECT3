<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서발주</title>
<link href="./assets/css/request/request.css" rel="stylesheet">
<style>
aside #items #i2 .material-symbols-outlined {
	background: rgb(165, 224, 144);
}
</style>
</head>
<body>

	<section>
		<div class="main_page" id="main_page_1">
			<h3>도서 발주</h3>
			<div>
				<div id="table">
					<table id="main_library">
						<colgroup>
							<col width="7%">
							<col width="25%">
							<col width="8%">
							<col width="12%">
							<col width="8%">
							<col width="12%">
							<col width="8%">
							<col width="8%">
						</colgroup>
						<thead>
							<tr>
								<th>발주번호</th>
								<th class="sortable">도서명</th>
								<th>저자명</th>
								<th>출판사</th>
								<th>도서관</th>
								<th>발주일자</th>
								<th>수량</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${map.list}">
								<tr>
									<td>${list.lr_seq}</td>
									<td class="bname2">${list.app_book}</td>
									<td>${list.app_name}</td>
									<td>${list.app_pub}</td>
									<td>${list.lib_name}</td>
									<td>${list.lr_date}</td>
									<c:if test="${empty list.lr_ing}">								
										<td>
											<input type="text" name="lr_count" data-lr_seq="${list.lr_seq}">
										</td>
									</c:if>
									<c:if test="${not empty list.lr_ing}">								
										<td>${list.lr_count}</td>
									</c:if>
									<c:if test="${empty list.lr_ing}">								
										<td>-</td>
									</c:if>
									<c:if test="${not empty list.lr_ing}">								
										<td>${list.lr_ing}</td>
									</c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="bot_btn">
					<form action="apply" method="get">
						<div class="search-container">
							<select name="searchType">
								<option value="1" ${param.searchType == 1 or param.searchType == null ? "selected='selected'" : ""}>도서명</option>
								<option value="2" ${param.searchType == 2 ? "selected='selected'" : ""}>도서관</option>
							</select>
							<input type="text" id="searchInput" name="keyword" value="${param.keyword}" placeholder="검색어를 입력하시오. "> 
								<input type="submit" value="검색">
						</div>
					</form>
					<div id="reqBox">
						<input type="button" id="applyReq" value="발주">
					</div>
				</div>
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
					href="request?page=<%=sec_first - 1%>&keyword=${param.keyword}&searchType=${param.searchType}">chevron_left</a>
				</span>
			</c:if>

			<!-- 섹션 내에서의 첫번째 페이지부터 마지막 페이지만 나오게 -->
			<c:forEach var="i" begin="<%=sec_first%>" end="<%=sec_last%>">

				<!-- 페이지 이동, 현재 페이지는 strong 처리 -->
				<c:if test="${i eq param.page}">
					<a href="request?page=${i}&keyword=${param.keyword}&searchType=${param.searchType}" id="page" class="chap"><strong>${i}</strong></a>
				</c:if>
				<c:if test="${i != param.page}">
					<a href="request?page=${i}&keyword=${param.keyword}&searchType=${param.searchType}" id="page" class="chap">${i}</a>
				</c:if>

			</c:forEach>

			<c:if test="<%=sec_last == lastPage%>">
				<span class="material-symbols-outlined">chevron_right</span>
			</c:if>
			<c:if test="<%=sec_last != lastPage%>">
				<span class="material-symbols-outlined"> <a
					href="request?page=<%=sec_last + 1%>&keyword=${param.keyword}&searchType=${param.searchType}">chevron_right</a>
				</span>
			</c:if>
		</div>
	</section>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		// ajax 실행 메소드 
		function ajax(url, param, cb, method){	// cb : callback 함수
	
			if(!method) method = "get"; // method 기본값 설정
			
			const xhr = new XMLHttpRequest();
	
			xhr.open(method,url);
			xhr.setRequestHeader("Content-Type","application/json");		
			const strData = JSON.stringify(param); 
			console.log("strData : " + strData);
			xhr.send(strData); // 최종 전송
			
			// typeof : 변수의 타입을 문자로 알려줌
			if(typeof cb == "function"){
				xhr.onload = function(){
					cb(xhr.responseText); // 전달인자 -> ajax에서 받아온 것
				}
			}
		}
		
		// 발주 이벤트
		document.querySelector("#applyReq").addEventListener('click', function(){
			//jQuery로 for문 돌면서 input type text의 value를 담는다
		    let lr_count = []; // lib_request 테이블에 수량 인서트
		    let lr_seq = []; // orderstatus 테이블에 인서트
		    $("input[name='lr_count']").each(function(i){ 
		    	console.log($(this), this);
		    	lr_count.push($(this).val());
		    });

		    $("input[name='lr_count']").each(function(i){   
		    	lr_seq.push($(this).attr('data-lr_seq'));
		    });
		    
		    console.log(lr_count);
		    console.log(lr_seq);
		    
		    if(lr_seq.length <= 0){
		    	alert("발주할 도서가 없습니다. "); 
		    } else{
		    	console.log("발주 수량 :", lr_count);
		    	console.log("발주 번호 :", lr_seq);
			    
			    data = {
			    		"lr_counts" : lr_count,
			    		"lr_seqs" : lr_seq
			    }
			    
			    ajax("reqOrder", data, function(result){
			    	console.log(result);
			    	if(result > 0){
			    		alert("완료되었습니다. ");
			    		location.href="request";
			    	} else{
			    		alert("다시 시도해주세요. ");
			    	}
			    }, "post")
		    }
		})
		
	</script>

</body>
</html>