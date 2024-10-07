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
<link href="../assets/css/my/user_mypage_cart.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
                    	<c:forEach var="list" items="${list}">
                    	<input type="hidden" name="user_seq" class="code" value="${login.user_seq}">
            			<input type="hidden" name="book_code" class="user" value="${list.book_code}">
	                        <tr class="cart">
	                            <td rowspan="3" class="border">
	                                <input type="checkbox" name="cart_chk" value="${list.book_code}" class="chk"> 
	                            </td>
	                            <td rowspan="3" class="bookCover border">
	                                <img src="${list.book_img}"  alt="${list.book_name}의 책표지">
	                            </td>
	                            <td class="bookTitle book">
	                                ${list.book_name}
	                            </td>
	                            <td class="border" rowspan="3">
	                            	<form method="post" action="cart_res">
	                            		<input type="hidden" name="user_seq" value="${list.user_seq}">
	                            		<input type="hidden" name="book_code" value="${list.book_code}">
	                            		<input type="hidden" name="cart_seq" value="${list.cart_seq}">
		                                <input type="submit" class="reser" value="예약"><br>
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
	                            <td class="wirter book border">
	                            	<span>${list.book_author}(지은이)</span>
	                            	<span> | </span>
	                            	<span>${list.book_pub}(주)</span>
	                            </td>
	                        </tr>
	                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <div id="bntall">
                <input type="button" id="reserchk" class="bnt" value="선택 도서 예약하기"><br>
                <input type="button" id="delall" class="bnt" value="전체 도서 삭제하기">
                <input type="button" id="reserall" class="bnt" value="전체 도서 예약하기">
            </div>
        
        </div>
        </section>
        <script src="../assets/js/my/mypage_cart.js"></script>
		<script>
			const user = '${login.user_seq}';
			document.querySelector("#reserchk").addEventListener('click', function(){
			    ajax_reschk();
			})
			document.querySelector("#delall").addEventListener('click', function(){
			    ajax_del('post');
			})
			document.querySelector("#reserall").addEventListener('click', function(){
			    ajax_resall('post');
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
	
			function ajax_reschk() {
	
			    //jQuery로 for문 돌면서 check 된값 배열에 담는다
			    var lists = [];
			    var cart = [];
			    $("input[name='cart_chk']:checked").each(function(i){   
			        lists.push($(this).val());
			    });
			    
			    $("input[name='cart_chk']:checked").each(function(i){   
			        cart.push($(this).val());
			    });
			    
			    console.log("책 코드 :", lists);
			    console.log("찜 코드 :",cart);

			    const data = {
			    		"book_code" : lists,
			    		"cart_seq" : cart
			    		"user_seq" : user
			    }
			    
			    if(lists.length > 0){
			    	ajax("reschk", data, function(){
			    		alert("선택 도서가 예약되었습니다. ");
			    	}, "post")
			    } else{
			        alert("도서를 선택해주세요. ")
			    }
			}
	
			function ajax_del(method) {
	
			    let seqs = [];
	
			    $("input[name='cart']").each(function(i){   
			        seqs.push($(this).val());
			    });
	
			    console.log(seqs);
			    
			    console.log("code=" + seqs + "&user=" + user )
			    
			    if(seqs.length > 0){
				    let url = 'delall';
				    
				    // ajax
				    let xhr = new XMLHttpRequest();
				    
				    xhr.open(method, url);
				    
				    if(method == 'get'){			
				        xhr.send();
				    } else{
				        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"); 
				    
				        xhr.send( "seq=" + seqs + "&user=" + user);
				        
				    }
				
				
				    xhr.onload = function(){
						alert("삭제되었습니다. ")
	
			            xhr = new XMLHttpRequest();
			        
			            xhr.open('get', mypage_cart);
			            
			            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"); 
			        
			            xhr.send( "seq=" + user );
				    }
				}
			    
			}
	
			function ajax_resall(method) {
	
			    let seqs = [];
			    let cart = [];
	
			    $("input[name='cart_chk']").each(function(i){   
			        seqs.push($(this).val());
			    });
			    
			    $("input[name='cart_seq']").each(function(i){   
			        cart.push($(this).val());
			    });
	
			    console.log(seqs);
			    
			    console.log("code=" + seqs + "&user=" + user + "&cart=" + cart);
			    
			    if(seqs.length > 0){
				    let url = 'resAll';
				    // ajax
				    let xhr = new XMLHttpRequest();
				    
				    xhr.open(method, url);
				    
				    if(method == 'get'){			
				        xhr.send();
				    } else{
				        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"); 
				    
				        xhr.send( "code=" + seqs + "&user=" + user + "&cart=" + cart);
				        
				    }
				
				    xhr.onload = function(){
						alert("예약이 완료되었습니다. ")
	
			            xhr = new XMLHttpRequest();
			        
			            xhr.open('get', res);
			            
			            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"); 
			        
			            xhr.send( "seq=" + user );
					}
				}
			}
		</script>
</body>
</html>