<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<link href="../assets/css/join/user_join.css" rel="stylesheet">
</head>
<body>

	<div id="hg">
		<div class="name">
			<strong>행복만땅 회원가입</strong>
		</div>

		<div>
			<form method="post" action="join" id="form">
				<div id="ess"><span>*</span> 는 필수입니다. </div>
				<table border="1">
					<tr>
						<td class="label"><span>*</span> 이름</td>
						<td><input type="text" id="name_" name="user_name" placeholder="이름을 입력하세요."></td>
					</tr>
					<tr>
						<td class="label"><span>*</span> 생년월일</td>
						<td>
							<div class="container">
								<select name="yyyy">
									<option value="1950">1950</option>
									<option value="1951">1951</option>
									<option value="1952">1952</option>
									<option value="1953">1953</option>
									<option value="1954">1954</option>
									<option value="1955">1955</option>
									<option value="1956">1956</option>
									<option value="1957">1957</option>
									<option value="1958">1958</option>
									<option value="1959">1959</option>
									<option value="1960">1960</option>
									<option value="1961">1961</option>
									<option value="1962">1962</option>
									<option value="1963">1963</option>
									<option value="1964">1964</option>
									<option value="1965">1965</option>
									<option value="1966">1966</option>
									<option value="1967">1967</option>
									<option value="1968">1968</option>
									<option value="1969">1969</option>
									<option value="1970">1970</option>
									<option value="1971">1971</option>
									<option value="1972">1972</option>
									<option value="1973">1973</option>
									<option value="1974">1974</option>
									<option value="1975">1975</option>
									<option value="1976">1976</option>
									<option value="1977">1977</option>
									<option value="1978">1978</option>
									<option value="1979">1979</option>
									<option value="1980">1980</option>
									<option value="1981">1981</option>
									<option value="1982">1982</option>
									<option value="1983">1983</option>
									<option value="1984">1984</option>
									<option value="1985">1985</option>
									<option value="1986">1986</option>
									<option value="1987">1987</option>
									<option value="1988">1988</option>
									<option value="1989">1989</option>
									<option value="1990" selected>1990</option>
									<option value="1991">1991</option>
									<option value="1992">1992</option>
									<option value="1993">1993</option>
									<option value="1994">1994</option>
									<option value="1995">1995</option>
									<option value="1996">1996</option>
									<option value="1997">1997</option>
									<option value="1998">1998</option>
									<option value="1999">1999</option>
									<option value="2000">2000</option>
									<option value="2001">2001</option>
									<option value="2002">2002</option>
									<option value="2003">2003</option>
									<option value="2004">2004</option>
									<option value="2005">2005</option>
									<option value="2006">2006</option>
									<option value="2007">2007</option>
									<option value="2008">2008</option>
									<option value="2009">2009</option>
									<option value="2010">2010</option>
									<option value="2011">2011</option>
									<option value="2012">2012</option>
									<option value="2013">2013</option>
									<option value="2014">2014</option>
									<option value="2015">2015</option>
									<option value="2016">2016</option>
									<option value="2017">2017</option>
									<option value="2018">2018</option>
									<option value="2019">2019</option>
									<option value="2020">2020</option>
									<option value="2021">2021</option>
									<option value="2022">2022</option>
									<option value="2023">2023</option>
									<option value="2024">2024</option>

								</select>
								<select name="mm">
									<option value="1" selected>1월</option>
									<option value="2">2월</option>
									<option value="3">3월</option>
									<option value="4">4월</option>
									<option value="5">5월</option>
									<option value="6">6월</option>
									<option value="7">7월</option>
									<option value="8">8월</option>
									<option value="9">9월</option>
									<option value="10">10월</option>
									<option value="11">11월</option>
									<option value="12">12월</option>
								</select>
								<select name="dd">
									<option value="1" selected>1일</option>
									<option value="2">2일</option>
									<option value="3">3일</option>
									<option value="4">4일</option>
									<option value="5">5일</option>
									<option value="6">6일</option>
									<option value="7">7일</option>
									<option value="8">8일</option>
									<option value="9">9일</option>
									<option value="10">10일</option>
									<option value="11">11일</option>
									<option value="12">12일</option>
									<option value="13">13일</option>
									<option value="14">14일</option>
									<option value="15">15일</option>
									<option value="16">16일</option>
									<option value="17">17일</option>
									<option value="18">18일</option>
									<option value="19">19일</option>
									<option value="20">20일</option>
									<option value="21">21일</option>
									<option value="22">22일</option>
									<option value="23">23일</option>
									<option value="24">24일</option>
									<option value="25">25일</option>
									<option value="26">26일</option>
									<option value="27">27일</option>
									<option value="28">28일</option>
									<option value="29">29일</option>
									<option value="30">30일</option>
									<option value="31">31일</option>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<td class="label"><span>*</span> 아이디</td>
						<td>
							<div id="seob">
								<input type="text" id="user_id" name="user_id" placeholder="아이디">
								<div class="red" id="username-message">아이디를 적어주세요</div>
							</div>
							<div class="gaip">
								<input type="button" value="아이디 중복확인" id="check_username">
									<span id="LO01">
										사용가능한 아이디입니다. 
									</span>
									<span id="LO02">
										이미 존재하는 아이디입니다. 
									</span>
							</div>
						</td>
					</tr>
					<tr>
					    <td class="label"><span>*</span> 비밀번호</td>
					    <td>
					        <input type="password" id="password" name="user_pw" placeholder="비밀번호" oninput="validatePassword()">
					        <div class="red" id="password-message">비밀번호를 적어주세요</div>
					    </td>
					</tr>
					<tr>
					    <td class="label">비밀번호 확인</td>
					    <td>
					        <input type="password" id="confirm-password" name="confirm" placeholder="비밀번호 재입력" oninput="checkPasswordMatch()">
					        <div class="red" id="confirm-password-message">비밀번호가 일치하지 않습니다</div>
					    </td>
					</tr>
					<tr>
						<td class="label"><span>*</span> 전화번호</td>
						<td><input type="number" id="phone" name="user_tel" placeholder="숫자만 입력해주세요."></td>
					</tr>
					<tr>
						<td class="label"><span>*</span> 주소</td>
						<td>
							<input type="text" id="addressnum" name="addressnum" placeholder="우편번호">
							<div class="gaip">
								<input type="button" value="검색" onclick="execDaumPostcode()">
							</div>
							<br>
							<input type="text" id="address" name="user_addr" placeholder="기본주소 입력">
							<input type="text" id="addressinfo" name="user_addr_info" placeholder="상세주소 입력">
						</td>
					</tr>
					<tr>
						<td class="label"><span>*</span> e_mail</td>
						<td>
							<input class="email-input" type="text" id="email-user" name="user_email" placeholder="이메일주소">
							<div class="email-domain">@</div>
							<input class="email-input" type="text" id="email-domain" name="domain" placeholder="naver.com">
						</td>
					</tr>
					<tr>
						<td class="label"><span>*</span> 선호도 조사</td>
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
				<div style="text-align: center;">
					<input id="gaip_1" type="submit" value="회원가입 완료">
				</div>
			</form>
		</div>
	</div>
	
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
	<script src="../assets/js/join/user_join.js"></script>
	<script src="../assets/js/join/user_join_post.js"></script>

</body>
</html>
