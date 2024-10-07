<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="project3.gamja.jojandi.dto.user.my.*" %>
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

				<c:if test="${ login.user_sub == true }">
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
	                           <form method="post" action="bookflix_use">
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
                    
                    <script>
	                    function info1On(){
	
	                        pwIn.addEventListener('keyup', function(event){
	                            if(event.keyCode == 13){
	                                pwBnt.click();
	                            }
	                        })
	
	                        pwBnt.addEventListener('click', function(){
	
	                            let pwIn = document.querySelector("#pwIn").value;
	                            let pw = '${ login.user_pw }';
	                            
	                            console.log(pw)
	                            console.log('비밀번호 확인 클릭!!!');
	                            console.log(pwIn);
	                            if(pwIn == pw){
	                                info2.style.display = "block";
	                                info1.style.display = "none";
	                            } else{
	                                pwerror.style.display = "block";
	                            }
	                        })
	                    }
	                    
	                    info1On();
                    </script>

                    <div id="info2">
                    <form method="post" action="update">
                        <table>
                            <tr>
                                <td class="center">이름</td>
                                <td>
                                    <input type="text" id=nick name="name" value="${ login.user_name }">
                                </td>
                            </tr>
                            <tr>
                                <td class="center" id="id">아이디</td>
                                <td>
                                    <input type="text" id="username" name="id" value="${ login.user_id }">
                                    <span>
										<input type="button" value="아이디 중복확인" id="check-username">
										<span id="LO01">
											사용가능한 아이디입니다. 
										</span>
										<span id="LO02">
											이미 존재하는 아이디입니다. 
										</span>
									</span>
                                </td>
                            </tr>
                            <tr>
                                <td class="center">비밀번호</td>
                                <td id="pwedit">
                                    <input type="password" name="pw" id="pweditIn" value="${ login.user_pw }">
                                </td>
                            </tr>
                            <tr>
                                <td class="center">전화번호</td>
                                <td>
                                	<%
                                	UserDTO dto = (UserDTO)session.getAttribute("login");
                               		String tel = dto.getUser_tel();
                               		System.out.println("전화번호 : " + tel);
                               		String[] telArr = tel.split("-");
                               		
                               		System.out.println("전화번호 : " + telArr[0]);
                               		System.out.println("전화번호 : " + telArr[1]);
                               		System.out.println("전화번호 : " + telArr[2]);
                               		
                               		String num = telArr[0] + telArr[1] + telArr[2];
                                	%>
                                    <input type="text" id=tel name="tel" placeholder="숫자만 입력해주세요. " value="<%=num%>">
                                </td>
                            </tr>
                            <tr>
                                <td class="center">이메일</td>
                                <td>
                                	<% 
	                            		String email = dto.getUser_email();
                                		System.out.println("이메일 : " + email);
                                		String[] emailArr = email.split("@");
                                		
                                		System.out.println("이메일 : " + emailArr[0]);
                                		System.out.println("이메일 : " + emailArr[1]);
                                		
                                		String mail = emailArr[0];
                                		String domain = emailArr[1];
                                	%>
                                    <input class="email-input" type="text" value=<%=mail%> id="email-user" name="user_email">
									<span class="email-domain">@</span>
									<input class="email-input" type="text" value=<%=domain%> id="email-domain" name="domain">
                                </td>
                            </tr>
                            <tr>
                                <td class="center">주소</td>
                                <td id="addr">
									<div class="gaip">
                                    	<input type="text" id="addressnum" name="addressnum" placeholder="우편번호">
										<input type="button" value="검색" onclick="execDaumPostcode()">
									</div>
									<input type="text" id="address" name="address" value="${ login.user_addr1 }">
									<input type="text" id="addressinfo" name="addressinfo" value="${ login.user_addr2 }">
                                </td>
                            </tr>
                            <tr>
                                <td class="center">선호도</td>
                                <td>
                                    <input type="radio" id="hre1" name="like" value="1">언론
									<input type="radio" id="hre2" name="like" value="2">소설
									<input type="radio" id="hre3" name="like" value="3">역사
									<input type="radio" id="hre4" name="like" value="4">인문학
									<input type="radio" id="hre5" name="like" value="5">자기계발
									<input type="radio" id="hre6" name="like" value="6">무협
									<br>
									<input type="radio" id="hre7" name="like" value="7">만화
									<input type="radio" id="hre8" name="like" value="8">판타지
									<input type="radio" id="hre9" name="like" value="9">로맨스
									<input type="radio" id="hre10" name="like" value="10">추리
									<input type="radio" id="hre11" name="like" value="11">스릴러
                                </td>
                            </tr>
                        </table>
                        <input type="hidden" name="seq" value="${ login.user_seq }">
                        <div id=update>
	                        <input type="submit" value="변경하기">
                        </div>
                    </form>
                    <form method="post" action="user_del">
	                    <input type="hidden" name="code" value="${login.user_seq}">
                   		<input type="submit" value="회원탈퇴" id="realout">
                    </form>

                    </div>

                </div>

            </div>

        </section>
        
        <script>
	        function likeSet(){
	            let ri = [];
	            ri = document.getElementsByName("like");
	            let like = '${ login.like_id }';
	            console.log("like" + like);
	
	            for(let i = 1; i < ri.length; i++){
	                if(like == (i)){
	                    console.log(ri[i-1]);
	                    ri[i-1].setAttribute("checked","checked");
	                }
	            }
	
	        }
	        
	        likeSet();
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