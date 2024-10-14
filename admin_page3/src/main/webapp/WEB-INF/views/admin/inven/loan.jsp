<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<link href="./assets/css/inven/inven.css" rel="stylesheet">
<style>
	 #i3 .material-symbols-outlined { background-color: rgb(165, 224, 144); }
</style>
<head>
<meta charset="UTF-8">
<title>도서 재고 관리</title>
</head>
<body>
		<section>
			<div class="main_page" id="main_page_1">
				<h3>도서 대출 관리</h3>
				<div>
					<div class="page">
						<table>
							<colgroup>
                                <col width="7%">
                                <col width="7%">
                                <col width="28%">
                                <col width="10%">
                                <col width="10%">
                                <col width="9%">
                                <col width="10%">
                                <col width="10%">
                                <col width="6%">
                            </colgroup>
							<thead>
								<tr>
									<th>회원번호</th>
									<th>도서코드</th>
									<th>도서명</th>
									<th>도서관</th>
									<th>대출일자</th>
									<th>대출현황</th>
									<th>반납예정일</th>
									<th>반납일</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="list" items="${map.list}">
									<tr>
										<td>${list.user_seq}</td>
										<td>${list.book_code}</td>
										<td>${list.book_name}</td>
										<td>${list.lib_name}</td>
										<td>${list.loan_date}</td>
										<td>
											<c:if test="${list.loan_ing == true}">
												<select name="loan_ing" class="loan_ing">
													<option value="Y" selected>대출중</option>
													<option value="N">반납완료</option>
												</select>
											</c:if>
											<c:if test="${list.loan_ing == false}">
												반납완료
											</c:if>
										</td>
										<td>${list.loan_ex}</td>
										<td>
											<c:if test="${list.loan_return == null}">
			                            		-
			                            	</c:if>
			                            	<c:if test="${list.loan_return != null}">
			                            		${list.loan_return}
			                            	</c:if> 
										</td>
										<td>
											<c:if test="${list.loan_ing == true}">
												<input type="hidden" value=${list.lib_id } class="lib_id">
												<input type="hidden" value="${list.user_seq}" class="user_seq">
												<input type="hidden" value="${list.book_code}" class="book_code">
												<input type="hidden" value="${list.loan_seq}" class="loan_seq">
												<input type="submit" value="수정" class="submit">
											</c:if>
											<c:if test="${list.loan_ing == false}">
												-
											</c:if>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="bot_btn">
						<form action="inven" method="get">
							<div class="search-container">
								<select name="searchType">
									<option value="1" ${param.searchType == 1 or param.searchType == null ? "selected='selected'" : ""}>도서명</option>
									<option value="2" ${param.searchType == 2 ? "selected='selected'" : ""}>도서관</option>
								</select>
								<input type="text" id="searchInput" name="keyword" value="${param.keyword}" placeholder="검색어를 입력하시오. "> 
									<input type="submit" value="검색">
							</div>
						</form>
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
							href="loan?page=<%=sec_first - 1%>&keyword=${param.keyword}&searchType=${param.searchType}">chevron_left</a>
						</span>
					</c:if>

					<!-- 섹션 내에서의 첫번째 페이지부터 마지막 페이지만 나오게 -->
					<c:forEach var="i" begin="<%=sec_first%>" end="<%=sec_last%>">

						<!-- 페이지 이동, 현재 페이지는 strong 처리 -->
						<c:if test="${i eq param.page}">
							<a href="loan?page=${i}&keyword=${param.keyword}&searchType=${param.searchType}" id="page" class="chap"><strong>${i}</strong></a>
						</c:if>
						<c:if test="${i != param.page}">
							<a href="loan?page=${i}&keyword=${param.keyword}&searchType=${param.searchType}" id="page" class="chap">${i}</a>
						</c:if>

					</c:forEach>

					<c:if test="<%=sec_last == lastPage%>">
						<span class="material-symbols-outlined">chevron_right</span>
					</c:if>
					<c:if test="<%=sec_last != lastPage%>">
						<span class="material-symbols-outlined"> <a
							href="loan?page=<%=sec_last + 1%>&keyword=${param.keyword}&searchType=${param.searchType}">chevron_right</a>
						</span>
					</c:if>
				</div>
			</div>
		</section>
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
		
		// 수정하기
		const submit = document.querySelectorAll(".submit");
		for(let i = 0; i<submit.length; i++){
		    submit[i].addEventListener('click', function(){
		    	const book_code = document.querySelectorAll(".book_code");
				const loan_seq = document.querySelectorAll(".loan_seq");
				const user_seq = document.querySelectorAll(".user_seq");
		    	console.log("book_code : " + book_code[i].value);
			    console.log("loan_seq : " + loan_seq[i].value);
			    console.log("user_seq : " + user_seq[i].value);
			    
			    const data = {
			    		"book_code" : book_code[i].value,
			    		"loan_seq" : loan_seq[i].value,
			    		"user_seq" : user_seq[i].value
			    }
			    const page = '${param.page}';
			    
			    ajax("loanReturn", data, function(result){
			    	if(result > 0){
				    	alert("수정되었습니다. ");
				    	if(page <= 0){
					    	location.href="loan";
				    	} else{
					    	location.href="loan?page="+page;
				    	}
			    	} else{
			    		alert("다시 시도해주세요. ")
			    	}
			    }, "post")
		    })
		}
	</script>
</body>
</html>
