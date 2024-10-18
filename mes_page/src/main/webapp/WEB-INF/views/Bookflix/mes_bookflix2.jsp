<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="project3.gamja.mesPage.dto.MesReviewDTO"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<link href="./assets/css/00.user_side_base.css" rel="stylesheet"> 
<link href="./assets/css/admin.css" rel="stylesheet">
<link href="./assets/css/mes_buser.css" rel="stylesheet">
<link href="./assets/css/admin_table.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<!-- <script src="./assets/js/click.js"></script> -->
<!-- <link href="./assets/css/click.css" rel="stylesheet"> -->
<style>
	#i2 .material-symbols-outlined {
		background-color: rgb(165, 224, 144);
	}
/* -------------------------------관리자 직원관리------------------------------ */
#menu #items #i5 {
	font-weight: 901;
	text-decoration: underline;
}

.clickable {
	cursor: pointer;
	color: blue;
	text-decoration: underline;
}
#modal_4 {
    font-size: 14px; /* 모달 내부의 텍스트 크기 재설정 */
}
#dt_btn{
width: 70px;
}

/* ------------------------------------------------------------------ */

	.hidden-column {
		display: none;
	}

</style>



</head>

<body>

	
		<section>

			<div class="main_page" id="main_page_1">
				<h3>리뷰 관리</h3>
				<div>
					<div class="bot_btn">
						<div class="search-container">
							<input type="text" id="searchInput" placeholder="리뷰 검색...">
							<input type="submit" value="검색">
						</div>
					</div>
					<div class="page_2">
						<table id="main_library">
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성날짜</th>
								<th>삭제</th>
								<th class="hidden-column">평점</th>
        						<th class="hidden-column">내용</th>
							</tr>
							<c:forEach var="list" items="${reviewList }">
						    <tr class="data-row" data-id="${list.review_seq}">
						        <td class="sortable">
						            <input type="hidden" class="review_seq" name="review_seq" id= "review_seq" value="${list.review_seq}">
						            ${list.review_seq}
						        </td>
						        <td class="title-cell">${list.review_name}</td>
						        <td>${list.user_id}</td>
						        <td>${list.review_date}</td>
						        <td><button class="dt_btn" data-id="${list.review_seq}">삭제하기</button></td> <!-- class 사용 -->
						        <td class="hidden-column">${list.review_score}</td>
						        <td class="hidden-column">${list.review_contents}</td>
						    </tr>
						</c:forEach>

						</table>
					</div>
					
				</div>
			</div>
		</section>


	<!-- //////////////////////////// 두번째 모달 ////////////////////////////////////// -->
	<div id="modal_4" class="modal_4">
		<div class="close_4">
			<span class="material-symbols-outlined"> close </span>
		</div>
		<div class="modal-content_4">
			<div id="modal-content-divs_4">
				<div id="table">
					<table id="modalTable">

					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- //////////////////////////// 두번째 모달 ////////////////////////////////////// -->

	<!--자바 스크립트 영역-->
	<script src="./assets/js/mes_review.js"></script>
	<script>
		function ajax(url, param, cb, method) {
			// javascript에서 false는 null, undefined, 0
			// true는 false가 아닌 것으로 정의되어 있음
			if(!method) method = "get";
			
			const xhr = new XMLHttpRequest();
			xhr.open(method, url);
			xhr.setRequestHeader("Content-Type","application/json"); // json 보내줄 거임
			xhr.send(JSON.stringify(param));
			
			if(typeof cb == "function") {
				xhr.onload = function(){
					cb(xhr.responseText)
				}
			}
		}	
		
		document.querySelectorAll(".dt_btn").forEach(function(btn) {
		    btn.addEventListener("click", function() {
		        const reviewSeq = document.querySelector("#review_seq").value; 
		        const data = {
		            "review_seq": reviewSeq
		        };
		        
		        if (confirm("정말로 삭제하시겠습니까?")) {  // 확인 대화상자
		            ajax("deleteReview", data, function(result) {
		                if (result >= 1) {
		                    alert("삭제되었습니다.");
		                    location.href = "mes_review";  // 성공 시 페이지 새로고침
		                } else {
		                    alert("삭제에 실패했습니다.");
		                }
		            }, "DELETE");
		        }
		    });
		});
	</script>

</body>

</html>