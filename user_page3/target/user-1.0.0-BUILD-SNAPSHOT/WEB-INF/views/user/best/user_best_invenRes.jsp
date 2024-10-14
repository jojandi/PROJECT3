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
<title>베스트 도서</title>
<link href="./assets/css/best/user_best.css" rel="stylesheet">
</head>
<body>
	<div id="wrap">
        <section class="best_infor">
            <div id="show_box_"> <!--가져와서 출력될 div -->
                <h1>종합 베스트 도서</h1>
                <c:forEach var="list" items="${list}">
	                <table>
	                    <tr>
	                        <td rowspan="3">
	                            <div class="imge">
	                                <img src="${list.book_img}" alt="'${list.book_name}' 책 표지">
	                            </div>
	                        </td>
	                        <td><span id="in_top">전체 1위</span></td>
	                        <td rowspan="3" class="bookBnt">
	                        	<a href="bestInven?book_ISBN=${list.book_ISBN}">
		                        	<input type="button" class="invenBnt" value="재고현황">
	                        	</a>
	                        	<c:if test="${not empty login.user_seq}">
		                        	<form method="post" action="bestCart">
			                        	<input type="hidden" name="book_code" value="${list.book_code}" class="code">
			                        	<input type="hidden" name="user" value="${login.user_seq}" class="user">
			                            <input type="submit" class="cartBnt" value="장바구니">
		                        	</form>
	                        	</c:if>
	                        	<c:if test="${empty login.user_seq}">
			                    	<input type="button" class="noneCartBnt" value="장바구니">
	                        	</c:if>
	                        	<a href="bestInvenRes?book_ISBN=${list.book_ISBN}">
	                            	<input type="button" class="reserBnt" value="예약하기">
	                            </a>
	                        </td>
	                    </tr>
	                    <tr>
	                    	<td class="bookTitle">${list.book_name}</td>
	                    </tr>
	                    <tr>
	                        <td class="information">
	                            <div class="bookInfo wirter">
	                                ${list.book_author} (지은이) | ${list.book_pub}(주)
	                            </div>
	                            <div class="bookInfo review">
	                                    ${list.li_book_info}
	                            </div>
	                        </td>
	                    </tr>
                	</table>
                	
                	<!-- //////////////////////////////// 모달 - 재고현황 //////////////////////////////// -->
                	<div class="new inven" style="display: none;">
	                    <div class="close ci">
	                        <a href="best">
		                        <span class="material-symbols-outlined">close</span>
	                        </a>
	                    </div>
						<c:forEach var="lib" items="${lib}">
		
		                    <div class="invenLibrary">
		                        <div class="library">${lib.lib_name}</div>
		                        <div class="addr">
		                            <span class="material-symbols-outlined">home</span>
		                            ${lib.lib_add}
		                        </div>
		                        <div class="call">
		                            <span class="material-symbols-outlined">call</span>
		                            <c:set var="lib_call" value="${lib.lib_call}" scope="request" />
									<%
									    String lib_call = request.getAttribute("lib_call").toString();
								        System.out.println("전화번호 : " + lib_call);
								        String call1 = lib_call.substring(0, 2);
								        String call2 = lib_call.substring(2, 5);
								        String call3 = lib_call.substring(5, 9);
								        String num = 0 + call1 + "-" + call2  + "-" +  call3;
								        System.out.println(num);
									%>
	                          		<%= num %>
		                        </div>
		                        <div class="realInven">재고 <span>${lib.count}</span> 권</div>
		                    </div>
		             	</c:forEach>
	                </div>

					<!-- //////////////////////////////// 모달 - 예약하기 //////////////////////////////// -->
	                <div class="new reser">
	                    <div class="close cr">
	                    	<a href="best">
		                        <span class="material-symbols-outlined">close</span>
	                    	</a>
	                    </div>
						<c:forEach var="lib" items="${lib}">
		
		                    <div class="invenLibrary">
		                        <div class="library_">
		                            <div class="library">${lib.lib_name}</div>
		                            <div class="addr">
		                                <span class="material-symbols-outlined">home</span>
		                                ${lib.lib_add}
		                            </div>
		                            <div class="call">
		                                <span class="material-symbols-outlined">call</span>
		                                <c:set var="lib_call" value="${lib.lib_call}" scope="request" />
										<%
										    String lib_call = request.getAttribute("lib_call").toString();
									        System.out.println("전화번호 : " + lib_call);
									        String call1 = lib_call.substring(0, 2);
									        String call2 = lib_call.substring(2, 5);
									        String call3 = lib_call.substring(5, 9);
									        String num = 0 + call1 + "-" + call2  + "-" +  call3;
									        System.out.println(num);
										%>
		                          		<%= num %>
		                            </div>
		                            <div class="realInven">재고 <span>${lib.count}</span> 권</div>
		                        </div>
		
		                        <div class="btnbox">
		                        	<c:if test="${lib.count == 0 or empty list.count}">
		                        		<input type="button" class="noneReserBnt" value="예약">
		                        	</c:if>
		                        	<c:if test="${lib.count > 0}">
			                        	<form action="bestRes" method="post">
			                        		<input type="hidden" name="user_seq" value="${login.user_seq}" class="user">
			                        		<input type="hidden" name="book_code" value="${list.book_code}">
			                        		<input type="hidden" name="lib_id" value="${lib.lib_id}">
				                            <input type="submit" class="realReserBnt" value="예약">
			                        	</form>
		                        	</c:if>
		                        </div>
		                    </div>
	                    </c:forEach>
	                </div>
                	
                </c:forEach>
                
            </div>    
            <script>
	            window.addEventListener("load",function(){
	            	noneReser();
	            	isLogin();
	            })
            	
            	const noneReserBnt = document.querySelectorAll(".noneReserBnt"); // 예약 실패 버튼
            	const noneCartBnt = document.querySelectorAll(".noneCartBnt"); // 장바구니 실패 버튼
            	// 재고 없을 때 예약 버튼
            	function noneReser(){
            	    for(let i = 0 ; i < noneReserBnt.length; i++){
            	    	noneReserBnt[i].addEventListener('click', function(){
            	           	alert("재고가 없습니다. ")
            	        })   
            	    }
            	}

            	// 로그인 안 되어 있을 때 이벤트
            	const login = '${ login }';
            	function isLogin(){
            		for(let i = 0 ; i < reserBnt.length; i++){
            			noneReserBnt[i].addEventListener('click', function(e){
            				alert("로그인 후 이용 가능합니다. ");
            				location.href="login";
            	        })  
            	    }
            	    
            	    for(let i = 0 ; i < cartBnt.length; i++){
            	    	noneCartBnt[i].addEventListener('click', function(e){
            				alert("로그인 후 이용 가능합니다. ");
            				location.href="login";
            	        })
            	    }
            	} 
            </script>
        </section>
    </div>
</body>
</html>