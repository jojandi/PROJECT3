<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 마이페이지</title>
<link href="../assets/css/my/user_mypage_use.css" rel="stylesheet">
<style>
    section #smenu #res{ font-weight: 900; text-decoration: underline; }
</style>
</head>
<body>
<!-- mypage-use -->	
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

        <section id="use">

            <div id="stitle">
                <h3>${ login.user_name }님의 이용내역</h3>
            </div>
            
            <div id="smenu"> 
                <span class="text on" id="res"><a href="res?seq=${login.user_seq}">예약내역</a></span>
                <span class="text" id="line">|</span>
                <span class="text on" id="loan"><a href="loan?seq=${login.user_seq}">대출내역</a></span>
                <span class="text" id="line">|</span>
                <span class="text on" id="overdue"><a href="over?seq=${login.user_seq}">연체내역</a></span>
            </div>

            <div class="table">
                <table>
                	<colgroup>
					    <col width="30%"/>
					    <col width="15%"/>
					    <col width="15%"/>
					    <col width="10%"/>
					    <col width="15%"/>
					  </colgroup>
                    <thead> 
                        <tr>
                            <td class="bnameall">도서명</td>
                            <td class="day1">예약일자</td>
                            <td class="day1">픽업일자</td>
                            <td>예약번호</td>
                            <td>현황</td>
                        </tr>
                    </thead>

                    <tbody>
                       	<c:forEach var="list" items="${map.list}">
	                       <tr>
	                            <td class="bname">${list.book_name}</td>
	                            <td>${list.res_day}</td>
	                            <td>
	                            	<c:if test="${list.res_pick != null}">
	                            		${list.res_pick}
	                            	</c:if>
	                            	<c:if test="${list.res_pick == null}">
	                            		-
	                            	</c:if>
	                            </td>
	                            <td>${list.res_id}</td>
	                            <td>
									<c:if test="${list.res_pick != null}">
										픽업 완료
									</c:if>
									<c:if test="${list.res_pick == null}">
										대기중
									</c:if>
								</td>
	                       </tr>
                           </c:forEach>
                    </tbody>
                </table>
            </div>
            
            <c:set var="map" value="${map}"/>
            <c:set var="countPerPage" value="${countPerPage}"/>
            <c:set var="page" value="${page}"/>
            <%-- <%
				Map map = (Map)request.getAttribute("map");
				int totalCount = (int)map.get("totalCount");
				
				String str_countPerPage = (String)request.getAttribute("countPerPage");
				int countPerPage = Integer.parseInt(str_countPerPage);
		
				String str_pageNo = (String)request.getAttribute("page");
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
						<a href="res?page=<%= sec_first - 1 %>">chevron_left</a>
					</span>
				</c:if>
                
                <!-- 섹션 내에서의 첫번째 페이지부터 마지막 페이지만 나오게 -->
				<c:forEach var="i" begin="<%= sec_first %>" end="<%= sec_last %>">
					
					<!-- 페이지 이동, 현재 페이지는 strong 처리 -->
					<c:if test="${i eq param.page}"> 
						<a href="res?page=${i}" id="page" class="chap"><strong>${i}</strong></a>
					</c:if>
					<c:if test="${i != param.page}"> 
						<a href="res?page=${i}" id="page" class="chap">${i}</a>
					</c:if>
						
				</c:forEach>
				
				<c:if test="<%= sec_last == lastPage %>">
					<span class="material-symbols-outlined">chevron_right</span>
				</c:if>
				<c:if test="<%= sec_last != lastPage %>">
                	<span class="material-symbols-outlined">
                		<a href="res?page=<%= sec_last + 1 %>">chevron_right</a>chevron_right
                	</span>
                </c:if>
            </div> --%>
        </section>

    <!-- wrap -->
    </div>

</body>
</html>