<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 마이페이지</title>
<link href="../assets/css/my/user_mypage_bookadd.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
        <section id="min">

            <div id="stitle">
                <h3>${ login.user_name }님의 도서 신청 내역</h3>
            </div>

            <div id="t1" class="table">
                <table>
                    <thead> 
                        <tr>
                            <td id="bnameall">도서명</td>
                            <td>도서관</td>
                            <td>신청일</td>
                            <td>신청현황</td>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="add" items="${map.list}">
                        <tr class="parent">
                            <td class="bname">${add.app_book }</td>
                            <td>${add.lib_name}</td>
                            <td>${add.app_date }</td>
                            <c:if test="${ add.purchased eq null }">
                          		<td>신청완료</td>
                            </c:if>
                            <c:if test="${ add.purchased != null }">
                            	<td>${add.purchased }</td>
                            </c:if>
                        </tr>
                    </c:forEach>
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
						<a href="loan?page=<%= sec_first - 1 %>">chevron_left</a>
					</span>
				</c:if>
                
                <!-- 섹션 내에서의 첫번째 페이지부터 마지막 페이지만 나오게 -->
				<c:forEach var="i" begin="<%= sec_first %>" end="<%= sec_last %>">
					
					<!-- 페이지 이동, 현재 페이지는 strong 처리 -->
					<c:if test="${i eq param.page}"> 
						<a href="apply?page=${i}" id="page" class="chap"><strong>${i}</strong></a>
					</c:if>
					<c:if test="${i != param.page}"> 
						<a href="apply?page=${i}" id="page" class="chap">${i}</a>
					</c:if>
						
				</c:forEach>
				
				<c:if test="<%= sec_last == lastPage %>">
					<span class="material-symbols-outlined">chevron_right</span>
				</c:if>
				<c:if test="<%= sec_last != lastPage %>">
                	<span class="material-symbols-outlined">
                		<a href="loan?page=<%= sec_last + 1 %>">chevron_right</a>chevron_right
                	</span>
                </c:if>
            </div>
        </section>

		<script src=".../assets/js/my/mypage_bookadd.js"></script>
</body>
</html>