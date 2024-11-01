<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="project3.talking.gamja.dto.user.UserDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 마이페이지</title>
<link href="../assets/css/my/user_mypage_info.css" rel="stylesheet">
</head>
<body>
        <section id="info">

            <div id="stitle">
                <h3>${ login.user_name }님의 정보</h3>
            </div>
            
            <!-- 기본정보 -->
            <div id="information">  
                <div id="miniInfo"> 
                    <div id="profile"></div>
                    <div id="nickname">${ login.user_name }</div>
                    <div id="email">${ login.user_email }</div>
                    <div id="num">회원번호 : ${ login.user_seq }</div>
                    <div id="out">
		            <a href="logout" id="logout">로그아웃</a>
                    </div>
                </div>

				<c:if test="${ login.user_sub == 'Y' }">
	               <div id="booksub">
	                   <div id="booklogo">
	                       <img src="../assets/img/bookflix.png">
	                   </div>
	
	                   <div id="bookuser">
	                       <div id="bookall">
	                           <span>이달의 ${list[0].bom_name} 도서</span>
	   
	                           <div id="books">
	                           	<c:forEach var="list" items="${list}">
	                                <table>
	                                    <tr>
	                                        <td>
	                                            <img src="${list.book_img}">
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                        <td class="booktitle">&lt; ${list.book_name} &gt;</td>
	                                    </tr>
	                                </table>
	                           	</c:forEach>
	                           </div>
	                       </div>
	   
	                       <div id="bookout">
	                           <form method="post" action="buserDel">
				                    <input type="hidden" name="user" value="${login.user_seq}">
				                    <input type="hidden" name="bseq" value="${list[0].buser_seq}">
		                    		<input type="submit" value="구독 취소" id="bookout">
		                    	</form>
	                       </div>
	                   </div>
	                  
	               </div>
                </c:if>

                <!-- 정보수정 -->
                <div id="infoedit">
                    <h3 id="infoeditTite">내 정보 수정</h3>

                    <div id="info1">
                        <input type="password" id="pwIn" placeholder="비밀번호를 입력해주세요."><br>
                        <input type="submit" id="pwBnt" value="확인">
                        <div id="pwerror">비밀번호를 확인해주세요</div>
                    </div>

                    <div id="info2">
                    <form method="post" action="infoEdit">
                        <table>
                            <tr>
                                <td class="center">이름</td>
                                <td>
                                    <input type="text" id=nick name="user_name" value="${ login.user_name }">
                                </td>
                            </tr>
                            <tr>
                                <td class="center" id="id">아이디</td>
                                <td>
                                    <input type="text" id="username" name="user_id" value="${ login.user_id }">
                                    <span>
										<input type="button" value="아이디 중복확인" id="check-username">
									</span>
                                </td>
                            </tr>
                            <tr>
                                <td class="center">전화번호</td>
                                <td>
                                    <input type="number" id=tel name="user_tel" placeholder="숫자만 입력해주세요. " value="${login.user_tel}">
                                </td>
                            </tr>
                            <tr>
                                <td class="center">이메일</td>
                                <td>
                                    <input class="email-input" type="text" value="${login.user_email}" id="email-user" name="user_email">
									<span class="email-domain">@</span>
									<input class="email-input" type="text" value="${login.domain}" id="email-domain" name="domain">
                                </td>
                            </tr>
                            <tr>
                                <td class="center">주소</td>
                                <td id="addr">
									<div class="gaip">
                                    	<input type="text" id="addressnum" name="addressnum" placeholder="우편번호">
										<input type="button" value="검색" onclick="execDaumPostcode()">
									</div>
									<input type="text" id="address" name="user_addr" value="${ login.user_addr }">
									<input type="text" id="addressinfo" name="user_addr_info" value="${ login.user_addr_info }">
                                </td>
                            </tr>
                            <tr>
                                <td class="center">선호도</td>
                                <td>
                                    <input type="radio" id="hre1" name="like_id" value="1">언론
									<input type="radio" id="hre2" name="like_id" value="2">소설
									<input type="radio" id="hre3" name="like_id" value="3">역사
									<input type="radio" id="hre4" name="like_id" value="4">인문학
									<input type="radio" id="hre5" name="like_id" value="5">자기계발
									<input type="radio" id="hre6" name="like_id" value="6">무협
									<br>
									<input type="radio" id="hre7" name="like_id" value="7">만화
									<input type="radio" id="hre8" name="like_id" value="8">판타지
									<input type="radio" id="hre9" name="like_id" value="9">로맨스
									<input type="radio" id="hre10" name="like_id" value="10">추리
									<input type="radio" id="hre11" name="like_id" value="11">스릴러
                                </td>
                            </tr>
                        </table>
                        <input type="hidden" name="user_pw" value="${ login.user_pw }">
                        <input type="hidden" name="user_seq" value="${ login.user_seq }">
                        <div id=update>
	                        <input type="submit" value="변경하기">
                        </div>
                    </form>
                    <form method="post" action="userDel">
	                    <input type="hidden" name="code" value="${login.user_seq}">
                   		<input type="submit" value="회원탈퇴" id="realout">
                    </form>

                    </div>

                </div>

            </div>

        </section>
        
        
        
        <script>
	        window.addEventListener("load",function(){
	        	likeSet();
	        	info1On();
	        	idCheck();
	        	userEdit();
	        })
	        
	        function likeSet(){
	            let ri = [];
	            ri = document.getElementsByName("like_id");
	            const like = '${ login.like_id }';
	            console.log(ri);
	            console.log("like : ", like);
	
	            for(let i = 1; i <= ri.length; i++){
	                if(like == i){
	                    console.log(ri[i-1]);
	                    ri[i-1].setAttribute("checked","checked");
	                }
	            }
	
	        }
	        
	        function ajax(url, param, cb, method) {
	        	if(!method) method = "get";
	        	
	        	const xhr = new XMLHttpRequest();
	        	xhr.open(method, url);
	        	xhr.setRequestHeader("Content-Type","application/json"); // json 보내줄 거임
	        	xhr.send(JSON.stringify(param));
	        	console.log(JSON.stringify(param));
	        	if(typeof cb == "function") {
	        		xhr.onload = function(){
	        			cb(xhr.responseText)
	        		}
	        	}
	        }
	        
	        function info1On(){
	             pwIn.addEventListener('keyup', function(event){
	                 if(event.keyCode == 13){
	                     pwBnt.click();
	                 }
	             })
	
	             pwBnt.addEventListener('click', function(){
	                const pwIn = document.querySelector("#pwIn").value;
	             	const id = '${login.user_id}';
	             	
	             	const xhr = new XMLHttpRequest();
	             	const data = {
	             			"user_id" : id,
	             			"user_pw" : pwIn
	             	};
	             	
	             	ajax("infoEditPw", data, function(result){
            			if(result == 'true'){
            				info2.style.display = "block";
                         	info1.style.display = "none";
            			} else{
            				pwerror.style.display = "block";
            			}
	             	}, "post")
	          	})
	       	}
	        
	        function idCheck(){
		        document.querySelector("#check-username").addEventListener("click", function(){
		        	const user_id = document.querySelector("#username").value;
		        	
		        	const data = {
		        			"user_id" : user_id
		        	}
		        	ajax("checkUserId", data, function(result) {
		                if (result === "exists") {
		                    alert("사용할 수 없는 아이디입니다. 이미 존재하는 아이디입니다.");
		                } else if (result === "available") {
		                    alert("사용 가능한 아이디입니다.");
		                } else {
		                    alert("서버 오류가 발생했습니다. 다시 시도해주세요.");
		                }
		            }, "post");
		        })
	        }
	        
	        // 유저가 정보를 업데이트 할 때
	        function userEdit(){
	        	document.querySelector("#update input").addEventListener("click", function(){
	        		alert("정보가 수정되었습니다. 다시 로그인 해주세요. ");
	        	})
	        }
        </script>

		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
		    function execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 선택한 주소 정보를 입력한 필드에 넣기
		                document.getElementById('addressnum').value = data.zonecode; // 우편번호
		                document.getElementById('address').value = data.address; // 기본주소
		                document.getElementById('addressinfo').focus();
		            }
		        }).open();
		    }
		</script>
        <script src="../assets/js/my/mypage_info.js"></script>
</body>
</html>