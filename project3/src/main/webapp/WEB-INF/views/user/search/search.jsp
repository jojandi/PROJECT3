<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 도서 검색</title>
<link href="../assets/css/search/search.css" rel="stylesheet">
<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
a:hover {
	color: inherit;
	text-decoration: none;
}
</style>
</head>
<body>
	<div id="wrap">

		<div id="search">
			<div id="searchResult">
				<span>검색 결과</span>
			</div>
			<form action="search" method="get">
				<input type="text" id="searchIn" name="book_name"
					value="${param.book_name}" placeholder=" 검색어를 입력해주세요. "> <input
					type="submit" id="searchBnt" value="⌕">
			</form>
		</div>


		<div class="searchEnd">

			<div class="books" id="b1">
				<c:if test="${empty list}">
					<h4> 도서 검색 결과가 없습니다. </h4>
					<a href="request">
						도서 신청하러 가기...
					</a>
				</c:if>
				<c:forEach var="list" items="${list}">
					<table>
						<tr>
							<td rowspan="3">
								<div class="imge">
									<img src="${list.book_img}" alt="${list.book_name} 책 표지">
								</div>
							</td>
							<td class="bookTitle">${list.book_name}</td>
							<td rowspan="2" class="bookBnt">
								<input type="button" class="invenBnt" data-isbn="${list.book_ISBN}" value="재고현황">
								
								<c:if test="${not empty login.user_seq}">
									<form method="post" action="searchCart">
										<input type="hidden" name="book_code" value="${list.book_code}" class="code"> 
										<input type="hidden" name="user_seq" value="${login.user_seq}" class="user"> 
										<input type="submit" class="cartBnt" value="장바구니">
									</form>
								</c:if> 
								<c:if test="${empty login.user_seq}">
									<input type="button" class="noneCartBnt" value="장바구니">
								</c:if> 
								
								<input type="button" class="reserBnt" data-isbn="${list.book_ISBN}" value="예약하기">
							</td>
						</tr>
						<tr>
							<td class="information">
								<div class="bookInfo wirter">${list.book_author}(지은이)|
									${list.book_pub}(주)</div>
								<div class="bookInfo review">${list.li_book_info}</div>
							</td>
						</tr>
					</table>

					<!-- //////////////////////////////// 모달 - 재고현황 //////////////////////////////// -->
					<div class="modal fade" id="invenModal" tabindex="-1" role="dialog"
						aria-labelledby="invenModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<div id="invenContent"></div>
									<!-- 여기에 재고 정보를 동적으로 추가 -->
								</div>
							</div>
						</div>
					</div>

					<!-- //////////////////////////////// 모달 - 예약하기 //////////////////////////////// -->
					<div class="modal fade" id="reserModal" tabindex="-1" role="dialog"
						aria-labelledby="reserModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<div id="reserContent"></div>
									<!-- 여기에 예약 정보를 동적으로 추가 -->
								</div>
							</div>
						</div>
					</div>

				</c:forEach>

			</div>

		</div>
	</div>
	<script>
		window.addEventListener("load",function(){
         	isLogin();
         	invenOn();
         	reserOn();
         	cartOn();
         })
         const user_seq = '${login.user_seq}';
         const login = '${ login }';
         
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
         
      	// 재고현황 클릭 이벤트
        const invenBnt = document.querySelectorAll(".invenBnt"); // 재고현황 버튼
		function invenOn(){
		    for(let i = 0 ; i < invenBnt.length; i++){
		        invenBnt[i].addEventListener('click', function(){
		            console.log('재고현황 클릭!!!');
		            
		            const bookISBN = this.getAttribute('data-isbn'); // data-isbn 속성에서 ISBN 값 가져오기				            
		            console.log("bookISBN :", bookISBN);
		            const data = {
		            		'book_ISBN' : bookISBN
		            };
		            
		            ajax("searchInven", data, function(result){
		            	console.log(result)
		            	try{
		            		let invenContent = '';
		            		result = JSON.parse(result);
			            	result.forEach(lib => { // 아작스에서 받아온 결과를 토대로 html 생성
			            		
			            		const num = formatNum(lib.lib_call)
			            		console.log(num)
			            		
			                    invenContent += `
			                    	<div class="invenLibrary">
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
			                    `;
			                });
			            	document.getElementById('invenContent').innerHTML = invenContent;
			            	
			            	// 모달 보여주기
			                $('#invenModal').modal('show');
		            	}catch(e){
							console.log("josn 아님");
							console.log(e);
						}
		            }, "post")
		            
		        })
		    }
		}
         
        const reserBnt = document.querySelectorAll(".reserBnt"); // 예약하기 버튼
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
		            
		            ajax("searchInven", data, function(result){
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
			                        	<!-- 재고가 없을 시 예약 실패 버튼 생성-->
			                        	\${lib.count == 0 ? `
			                        		<input type="button" class="noneReserBnt" value="예약">
			                        	` : ` <!-- 재고가 있을 시 예약 진행 -->
				                        	<form action="searchRes" method="post">
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
		            	
		            	// 예약 실패 버튼
		                noneReser();
		            }, "post")
		        })   
		    }
		
		}
        	
        const cartBnt = document.querySelectorAll(".cartBnt"); // 장바구니 버튼				
		// 장바구니 클릭 이벤트
		function cartOn(){
		    for(let i = 0 ; i < cartBnt.length; i++){
		        cartBnt[i].addEventListener('click', function(){
		            console.log("장바구니 클릭!!!");
		            alert("해당 도서가 장바구니에 담겼습니다. ")
		        })
		    }
		}
	        	
     	const noneCartBnt = document.querySelectorAll(".noneCartBnt"); // 장바구니 실패 버튼
     	// 예약 실패 이벤트
     	function noneReser(){
	     	const noneReserBnt = document.querySelectorAll(".noneReserBnt"); // 예약 실패 버튼
     	    for(let i = 0 ; i < noneReserBnt.length; i++){
     	    	noneReserBnt[i].addEventListener('click', function(){
	     	    	if(login){
		     	           	alert("재고가 없습니다. ")
	     	    	} else{
	     	    		alert("로그인 후 이용 가능합니다. ");
	    				location.href="login";
	     	    	}
     	        })   
     	    }
     	}

     	// 장바구니 실패 이벤트
     	function isLogin(){
     	    for(let i = 0 ; i < noneCartBnt.length; i++){
     	    	noneCartBnt[i].addEventListener('click', function(e){
     				alert("로그인 후 이용 가능합니다. ");
     				location.href="login";
     	        })
     	    }
     	} 
	</script>

</body>
</html>