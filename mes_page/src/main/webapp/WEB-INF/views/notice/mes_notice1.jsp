<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="layout.css" type="text/css">
    <link href="./assets/css/admin_table.css" rel="stylesheet">
    <link href="./assets/css/00.user_side_base.css" rel="stylesheet">
    <link href="./assets/css/admin.css" rel="stylesheet">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link href="./assets/css/click.css" rel="stylesheet">
    <link href="./assets/css/mes_notice1.css" rel="stylesheet">
    
    <style>
    	#menu #items #i6{
            font-weight: 901;
            text-decoration: underline;
        }
    </style>
  
</head>

<body>

        <section>
            <div class="main_page">
                <h3>게시판</h3>
                <div class="notince" >
                    <div class="t1">
	                    <div class="scc" style="text-align: right;">
	                        <input class="sch" type="text" name="search" placeholder="검색어를 입력하세요">
	                        <button class="sb" name="검색" value="검색">검색</button>
	                    </div>
                        <div class="page">
                            <table>
                                <tr>
                                    <th>번호</th>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>작성날짜</th>
                                </tr>
                                <c:forEach var="notice" items="${ map.list }">
                                <tr>
                                	<td>${ notice.notice_id }</td>
                                	<td><a href="mes_noticeRead?notice_id=${ notice.notice_id }">${ notice.notice_name }</a></td>
                                	<td>${ notice.emp_name }</td>
                                	<td>${ notice.notice_date }</td>
                                </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                    <div id="pagination"></div>
                    <br>
                    <div class="write" style="text-align:right;">
                        <a href="mes_notice2">
                            <input type="button" class="btnnn" value="글쓰기">
                        </a>
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
									<a href="mes_pfwork1?pageNo=<%= sec_first - 1 %>">chevron_left</a>
								</span>
							</c:if>
			                
			                <!-- 섹션 내에서의 첫번째 페이지부터 마지막 페이지만 나오게 -->
							<c:forEach var="i" begin="<%= sec_first %>" end="<%= sec_last %>">
								
								<!-- 페이지 이동, 현재 페이지는 strong 처리 -->
								<c:if test="${i eq param.pageNo}"> 
									<a href="mes_notice1?pageNo=${i}" id="page" class="chap"><strong>${i}</strong></a>
								</c:if>
								<c:if test="${i != param.pageNo}"> 
									<a href="mes_notice1?pageNo=${i}" id="page" class="chap">${i}</a>
								</c:if>
									
							</c:forEach>
							
							<c:if test="<%= sec_last == lastPage %>">
								<span class="material-symbols-outlined">chevron_right</span>
							</c:if>
							<c:if test="<%= sec_last != lastPage %>">
			                	<span class="material-symbols-outlined">
			                		<a href="mes_notice1?pageNo=<%= sec_last + 1 %>">chevron_right</a>chevron_right
			                	</span>
			                </c:if>
			            </div>
            </div>
        </section>

<script src="./assets/js/mes_notice.js"></script>
</body>

</html>