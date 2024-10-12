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
                </c:forEach>
            </div>    
            <script>
	            window.addEventListener("load",function(){
	            	isLogin();
	            })
            	
            	const noneCartBnt = document.querySelectorAll(".noneCartBnt"); // 장바구니 실패 버튼
            	// 로그인 안 되어 있을 때 이벤트
            	const login = '${ login }';
            	function isLogin(){
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