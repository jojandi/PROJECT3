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
	                        	<input type="button" class="invenBnt" value="재고현황">
	                        	<form method="post" action="bestCart">
		                        	<input type="hidden" name="book_code" value="${list.book_code}" class="code">
		                        	<input type="hidden" name="user" value="${login.user_seq}" class="user">
		                            <input type="submit" class="cartBnt" value="장바구니">
	                        	</form>
	                            <input type="button" class="reserBnt" value="예약하기">
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
                	
                	<div class="new inven">
	                    <div class="close ci">
	                        <span class="material-symbols-outlined">close</span>
	                    </div>
						<c:forEach var="lib" items="${library}">
		
		                    <div class="invenLibrary">
		                        <div class="library">${lib.lib_name}</div>
		                        <div class="addr">
		                            <span class="material-symbols-outlined">home</span>
		                            ${lib.lib_add}
		                        </div>
		                        <div class="call">
		                            <span class="material-symbols-outlined">call</span>
		                            ${lib.lib_call}
		                        </div>
		                        <div class="realInven">재고 <span>${list.count}</span> 권</div>
		                    </div>
		             	</c:forEach>
	                </div>

	                <div class="new reser">
	                    <div class="close cr">
	                        <span class="material-symbols-outlined">close</span>
	                    </div>
						<c:forEach var="lib" items="${library}">
		
		                    <div class="invenLibrary">
		                        <div class="library_">
		                            <div class="library">${lib.lib_name}</div>
		                            <div class="addr">
		                                <span class="material-symbols-outlined">home</span>
		                                ${lib.lib_add}
		                            </div>
		                            <div class="call">
		                                <span class="material-symbols-outlined">call</span>
		                          		${lib.lib_call}
		                            </div>
		                            <div class="realInven">재고 <span>${list.count}</span> 권</div>
		                        </div>
		
		                        <div class="btnbox">
		                        	<c:if test="${list.count == 0}">
		                        		<input type="button" class="noneReserBnt" value="예약">
		                        	</c:if>
		                        	<form action="best_res" method="post">
		                        		<input type="hidden" name="user_seq" value="${login.user_seq}" class="user">
		                        		<input type="hidden" name="book_code" value="${list.book_code}">
		                        		<input type="hidden" name="lib_id" value="${lib.lib_id}">
			                            <input type="submit" class="realReserBnt" value="예약">
		                        	</form>
		                        </div>
		                    </div>
	                    </c:forEach>
	                </div>
                	
                </c:forEach>
                
            </div>    
            <script>
	            window.addEventListener("load",function(){
	            	invenOn();
	            	reserOn();
	            	closer();
	            	noneReser();
	            	// login();
	            })
            	// const login = '${ login }';
            	
            	const invenBnt = document.querySelectorAll(".invenBnt"); // 재고현황 버튼
            	const reserBnt = document.querySelectorAll(".reserBnt"); // 예약하기 버튼
            	const cartBnt = document.querySelectorAll(".cartBnt"); // 장바구니 버튼
            	const noneReserBnt = document.querySelectorAll(".noneReserBnt"); // 예약 실패 버튼
            	
            	const ci = document.querySelectorAll(".ci"); // 재고현황 닫기
            	const cr = document.querySelectorAll(".cr"); // 예약하기 닫기
            	
            	const inven = document.querySelectorAll(".inven"); // 재고현황 블럭
            	const reser = document.querySelectorAll(".reser"); // 예약 블럭

            	// 재고현황 클릭 이벤트
            	function invenOn(){
            	    for(let i = 0 ; i < invenBnt.length; i++){
            	        invenBnt[i].addEventListener('click', function(){
            	            console.log('재고현황 클릭!!!');
            	            inven[i].style.display = "block"; // 재고현황 block
            	        })
            	    }
            	}
            	
            	// 예약하기 클릭 이벤트
            	function reserOn(){
            	    for(let i = 0 ; i < reserBnt.length; i++){
            	        reserBnt[i].addEventListener('click', function(){
            	            console.log('예약하기 클릭!!!');
            	            reser[i].style.display = "block";
            	        })   
            	    }
            	}
            	
            	// 재고 없을 때 예약 버튼
            	function noneReser(){
            	    for(let i = 0 ; i < noneReserBnt.length; i++){
            	    	noneReserBnt[i].addEventListener('click', function(){
            	           	alert("재고가 없습니다. ")
            	        })   
            	    }
            	}
            	
            	// 닫기 클릭 이벤트
            	function closer(){
            	    for(let i = 0 ; i < ci.length; i++){
            	        ci[i].addEventListener('click', function(){
            	            console.log('재고현황 닫기!!!');
            	            inven[i].style.display = "none"; // 재고현황 none
            	        })
            	    }
            	    for(let i = 0 ; i < cr.length; i++){
            	        cr[i].addEventListener('click', function(){
            	            console.log('예약하기 닫기!!!');
            	            reser[i].style.display = "none"; // 예약현황 none
            	        })
            	    }
            	}
            	
            	/* function login(){

            		for(let i = 0 ; i < reserBnt.length; i++){
            	        reserBnt[i].addEventListener('click', function(e){
            				if(login == ''){
            	                e.preventDefault();
            					alert("로그인 후 이용 가능합니다. ")
            				} else{
            		           console.log('예약하기 클릭!!!');
            		           alert("해당 도서가 예약되었습니다. ")
            				}
            	        })   
            	    }
            	    
            	    for(let i = 0 ; i < cartBnt.length; i++){
            	        cartBnt[i].addEventListener('click', function(e){
            	            if(login == ''){
            	                e.preventDefault();
            					alert("로그인 후 이용 가능합니다. ")
            				} else{
            		           console.log('장바구니 클릭!!!');
            		           alert("해당 도서가 장바구니에 담겼습니다. ")
            				}
            	        })
            	        
            	    }
            	} */
            </script>
        </section>
    </div>
</body>
</html>