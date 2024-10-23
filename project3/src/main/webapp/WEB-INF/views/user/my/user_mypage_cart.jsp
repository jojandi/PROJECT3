<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 마이페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="../assets/css/my/user_mypage_cart.css" rel="stylesheet">
<!-- Bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
	a:hover { color: inherit; text-decoration: none; }
</style>
</head>
<body>
        <section id="cart">

            <div id="stitle">
                <h3>${ login.user_name }님의 찜 목록</h3>
            </div>

        <div id="table_btn">

           	<div id="t1" class="table">
                <table>
                    <colgroup>
                        <col width="5%">
                        <col width="15%">
                        <col width="55%">
                        <col width="15%">
                    </colgroup>
                    <thead> 
                        <tr>
                            <td>
                                <input type="checkbox" id="chkall">
                            </td>
                            <td colspan="2">상품명</td>
                            <!-- <td id="tw"></td> -->
                            <td>예약/삭제</td>
                        </tr>
                    </thead>

                    <tbody>
                    	<c:if test="${empty list}">
                    		<tr>
	                    		<td colspan="3" id="cartNull">장바구니가 비었습니다. </td>
                    		</tr>
                    	</c:if>
                    	<c:forEach var="list" items="${list}">
                    	<input type="hidden" name="user_seq" class="code" value="${login.user_seq}">
            			<input type="hidden" name="book_code" class="user" value="${list.book_code}">
	                        <tr class="cart">
	                            <td rowspan="3" class="border-bottom">
	                                <input type="checkbox" name="cart_chk" data-cart="${list.cart_seq}" 
	                                value="${list.book_code}" class="chk"> 
	                            </td>
	                            <td rowspan="3" class="bookCover border-bottom">
	                                <img src="${list.book_img}"  alt="${list.book_name}의 책표지">
	                            </td>
	                            <td class="bookTitle book">
	                                ${list.book_name}
	                            </td>
	                            <td class="border-bottom" rowspan="3">
	                            	<form method="post" action="cart_res">
	                            		<input type="hidden" name="user_seq" value="${list.user_seq}">
	                            		<input type="hidden" name="book_code" value="${list.book_code}">
	                            		<input type="hidden" name="cart_seq" value="${list.cart_seq}">
		                                <input type="button" class="reser" value="예약" data-isbn="${list.book_ISBN}"><br>
	                            	</form>
	                            	<form method="post" action="cart_del">
	                            		<input type="hidden" name="user_seq" value="${list.user_seq}">
	                            		<input type="hidden" name="cart_seq" value="${list.cart_seq}">
	                            		<!-- <input type="hidden" name="cart_seq" value="1"> -->
		                                <input type="submit" class="del" value="삭제">
	                            	</form>
	                            </td>
	                        </tr>
	                       	<tr>
	                            <td id="info" class="book">
	                                 - ${list.li_book_info}
	                            </td>
	                        </tr>
	                        <tr class="cart">
	                            <td class="wirter book border-bottom">
	                            	<span>${list.book_author}(지은이)</span>
	                            	<span> | </span>
	                            	<span>${list.book_pub}(주)</span>
	                            </td>
	                        </tr>
	                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- <div id="bntall">
                <input type="button" id="reserchk" class="bnt" value="선택 도서 예약하기"><br>
                <input type="button" id="delall" class="bnt" value="전체 도서 삭제하기">
                <input type="button" id="reserall" class="bnt" value="전체 도서 예약하기">
            </div> -->
            
            <!-- //////////////////////////////// 모달 - 예약하기 //////////////////////////////// -->
            <div class="modal fade"  id="reserModal" tabindex="-1" role="dialog" aria-labelledby="reserModalLabel" aria-hidden="true">
               <div class="modal-dialog" role="document">
			      <div class="modal-content">
			          <div class="modal-header">
			              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                  <span aria-hidden="true">&times;</span>
			              </button>
			          </div>
			          <div class="modal-body">
			              <div id="reserContent"></div> <!-- 여기에 예약 정보를 동적으로 추가 -->
			          </div>
			      </div>
			  </div>
            </div>
        
        </div>
        </section>
        <script src="../assets/js/my/mypage_cart.js"></script>
		<script>
			const user = '${login.user_seq}';
			/* document.querySelector("#reserchk").addEventListener('click', function(){
			    ajax_reschk();
			})
			document.querySelector("#delall").addEventListener('click', function(){
			    ajax_delAll();
			})
			document.querySelector("#reserall").addEventListener('click', function(){
			    ajax_resall();
			}) */
			
			window.addEventListener("load",function(){
            	reserOn();
            })
			
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
			
			// 전화번호 변환 함수
            function formatNum(call) {
            	// call이 문자열인지 확인하고, 그렇지 않으면 문자열로 변환
                if (typeof call !== 'string') {
                    call = String(call);
                }
                const call1 = call.substring(0, 2); 
                const call2 = call.substring(2, 5);
                const call3 = call.substring(5, 9);
                return "0" + call1 + "-" + call2 + "-" + call3;
            }
	
			const reserBnt = document.querySelectorAll(".reser"); // 예약하기 버튼
			const user_seq = '${login.user_seq}'
         	// 예약하기 클릭 이벤트
			function reserOn(){
			    for(let i = 0 ; i < reserBnt.length; i++){
			        reserBnt[i].addEventListener('click', function(){
			            console.log('예약하기 클릭!!!');
			            
			            const bookISBN = this.getAttribute('data-isbn'); // data-isbn 속성에서 ISBN 값 가져오기				            
			            console.log("bookISBN :", bookISBN);
			            const data = {
			            		'book_ISBN' : bookISBN
			            };
			            
			            ajax("bestInven", data, function(result){
			            	let invenContent = '';
		            		result = JSON.parse(result);
			            	result.forEach(lib => { // 아작스에서 받아온 결과를 토대로 html 생성
			            		
			            		const num = formatNum(lib.lib_call)
			            		
			                    invenContent += `
			                    	<div class="invenLibrary">
					                    	<div class="library_">
				                            <div class="library">\${lib.lib_name}</div>
				                            <div class="addr">
				                                <span class="material-symbols-outlined">home</span>
				                                \${lib.lib_add}
				                            </div>
				                            <div class="call">
				                                <span class="material-symbols-outlined">call</span>
				                                \${num}													
				                            </div>
				                            <div class="realInven">재고 <span>\${lib.count}</span> 권</div>
				                        </div>
				
				                        <div class="btnbox">
				                        	\${lib.count == 0 ? `
				                        		<input type="button" class="noneReserBnt" value="예약">
				                        	` : `
					                        	<form action="cart_res" method="post">
					                        		<input type="hidden" name="user_seq" value="\${user_seq}">
					                        		<input type="hidden" name="book_code" value="\${lib.book_code}">
					                        		<input type="hidden" name="lib_id" value="\${lib.lib_id}">
						                            <input type="submit" class="realReserBnt" value="예약">
					                        	</form>
					                        `}
				                        </div>
			                        </div>
			                    `;
			                });
			            	document.getElementById('reserContent').innerHTML = invenContent;
			            	
			            	// 모달 보여주기
			                $('#reserModal').modal('show');
			            }, "post")
			        })   
			    }
			
			}
			
			// 체크한 도서 예약
			function ajax_reschk() {
	
			    //jQuery로 for문 돌면서 check 된값 배열에 담는다
			    let book = [];
			    let cart = [];
			    $("input[name='cart_chk']:checked").each(function(i){   
			    	book.push($(this).val());
			        cart.push($(this).attr('data-cart'));
			    });
			    
			    console.log("book :", book);
			    console.log("cart :",cart);
			    console.log("user :",cart);

			    const data = {
			    		"book_codes" : book,
			    		"cart_seqs" : cart,
			    		"user_seq" : user
			    }
			    
			    if(cart.length > 0){
			    	ajax("reschk", data, function(result){
			    		console.log(result);
			    		alert("선택 도서가 예약되었습니다. ");
			    		location.href="cart?seq=${login.user_name}";
			    	}, "post")
			    } else{
			        alert("도서를 선택해주세요. ")
			    }
			}
	
			// 전체 도서 삭제
			function ajax_delAll() {
	
			    let cart = [];
	
			    $("input[name='cart_seq']").each(function(i){   
			    	cart.push($(this).val());
			    });
	
			    console.log("cart :", cart );
			    console.log("user :", user );
			    
			    const data = {
		    		"cart_seqs" : cart,
		    		"user_seq" : user
			    };
			    
			    if(cart.length > 0){
			    	ajax("delall", data, function(result){
			    		if(result > 0){
				    		console.log(result);
				    		alert("삭제되었습니다. ");
				    		location.href="cart?seq=${login.user_name}";
			    		} else{
				    		alert("다시 시도해주세요. ");
			    		}
			    	}, "delete")
				} else{
					alert("삭제할 도서가 없습니다.");
				}
			    
			}
	
			// 전체 도서 예약
			function ajax_resall(method) {
				let book = [];
			    let cart = [];
			    $("input[name='cart_chk']").each(function(i){   
			    	book.push($(this).val());
			    });
			    
			    $("input[name='cart_chk']").each(function(i){   
			        cart.push($(this).attr('data-cart'));
			    });
			    
			    console.log("book :", book);
			    console.log("cart :",cart);
			    console.log("user :",cart);

			    const data = {
			    		"book_codes" : book,
			    		"cart_seqs" : cart,
			    		"user_seq" : user
			    }
			    
			    if(cart.length > 0){
			    	ajax("reschk", data, function(result){
			    		console.log(result);
			    		alert("전체 도서가 예약되었습니다. ");
			    		location.href="cart?seq=${login.user_name}";
			    	}, "post")
			    } else{
			        alert("도서가 없습니다. ")
			    }
			}
		</script>
</body>
</html>